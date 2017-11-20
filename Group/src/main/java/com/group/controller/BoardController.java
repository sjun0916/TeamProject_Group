package com.group.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.group.common.FileUtil;
import com.group.common.FileVO;
import com.group.common.SearchVO;
import com.group.service.BoardService;
import com.group.vo.BoardReplyVO;
import com.group.vo.BoardVO;

@Controller 
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @Autowired
    private BoardService boardSvc;
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/BoardList")
    public String boardList(SearchVO searchVO, ModelMap modelMap) {

        searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); // startRow, endRow

        List<?> listview  = boardSvc.selectBoardList(searchVO);
        
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
        
        return "content_board/BoardList";
    }
    
    /** 
     * 글 쓰기. 
     */
    @RequestMapping(value = "/BoardForm")
    public String boardForm(HttpServletRequest request, ModelMap modelMap) {
        String boardnum = request.getParameter("boardnum");
        if (boardnum != null) {
            BoardVO boardInfo = boardSvc.selectBoardOne(boardnum);
            List<?> listview = boardSvc.selectBoardFileList(boardnum);
        
            modelMap.addAttribute("boardInfo", boardInfo);
            modelMap.addAttribute("listview", listview);
        }
        
        return "content_board/BoardForm";
    }
    
    /**
     * 글 저장.
     */
    @RequestMapping(value = "/BoardSave")
    public String boardSave(HttpServletRequest request, BoardVO boardInfo) {
        String[] filenum = request.getParameterValues("filenum");
        System.out.println(boardInfo.getUploadfile());
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile());

        boardSvc.insertBoard(boardInfo, filelist, filenum);

        return "redirect:/BoardList";
    }

    /**
     * 글 읽기.
     */
    @RequestMapping(value = "/BoardRead")
    public String boardRead(HttpServletRequest request, ModelMap modelMap) {
        
        String boardnum = request.getParameter("boardnum");
        
        boardSvc.updateBoardRead(boardnum);
        BoardVO boardInfo = boardSvc.selectBoardOne(boardnum);
        List<?> listview = boardSvc.selectBoardFileList(boardnum);
        List<?> replylist = boardSvc.selectBoardReplyList(boardnum);
        
        modelMap.addAttribute("boardInfo", boardInfo);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("replylist", replylist);
        
        return "content_board/BoardRead";
    }
    
    /**
     * 글 삭제.
     */
    @RequestMapping(value = "/BoardDelete")
    public String boardDelete(HttpServletRequest request) {
        
        String boardnum = request.getParameter("boardnum");
        
        boardSvc.deleteBoardOne(boardnum);
        
        return "redirect:/BoardList";
    }

    /* ===================================================================== */
    
    /**
     * 댓글 저장.
     */
    @RequestMapping(value = "/BoardReplySave")
    public String boardReplySave(HttpServletRequest request, BoardReplyVO boardReplyInfo) {
        
        boardSvc.insertBoardReply(boardReplyInfo);

        return "redirect:/BoardRead?boardnum=" + boardReplyInfo.getBoardnum();
    }
    
    /**
     * 댓글 삭제.
     */
    @RequestMapping(value = "/BoardReplyDelete")
    public String boardReplyDelete(HttpServletRequest request, BoardReplyVO boardReplyInfo) {
        
        boardSvc.deleteBoardReply(boardReplyInfo.getRenum());

        return "redirect:/BoardRead?boardnum=" + boardReplyInfo.getBoardnum();
    }      
}
