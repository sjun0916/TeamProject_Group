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
import com.group.service.Board5Svc;
import com.group.vo.BoardReplyVO;
import com.group.vo.BoardVO;

@Controller 
public class Board5Ctr {
	
	private static final Logger logger = LoggerFactory.getLogger(Board5Ctr.class);

    @Autowired
    private Board5Svc boardSvc;
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/board5List")
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
    @RequestMapping(value = "/board5Form")
    public String boardForm(HttpServletRequest request, ModelMap modelMap) {
        String brdno = request.getParameter("brdno");
        if (brdno != null) {
            BoardVO boardInfo = boardSvc.selectBoardOne(brdno);
            List<?> listview = boardSvc.selectBoard5FileList(brdno);
        
            modelMap.addAttribute("boardInfo", boardInfo);
            modelMap.addAttribute("listview", listview);
        }
        
        return "/content_board/BoardForm";
    }
    
    /**
     * 글 저장.
     */
    @RequestMapping(value = "/board5Save")
    public String boardSave(HttpServletRequest request, BoardVO boardInfo) {
        String[] fileno = request.getParameterValues("fileno");
        
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile());

        boardSvc.insertBoard(boardInfo, filelist, fileno);

        return "redirect:/board5List";
    }

    /**
     * 글 읽기.
     */
    @RequestMapping(value = "/board5Read")
    public String board5Read(HttpServletRequest request, ModelMap modelMap) {
        
        String brdno = request.getParameter("brdno");
        
        boardSvc.updateBoard5Read(brdno);
        BoardVO boardInfo = boardSvc.selectBoardOne(brdno);
        List<?> listview = boardSvc.selectBoard5FileList(brdno);
        List<?> replylist = boardSvc.selectBoard5ReplyList(brdno);
        
        modelMap.addAttribute("boardInfo", boardInfo);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("replylist", replylist);
        
        return "/content_board/BoardRead";
    }
    
    /**
     * 글 삭제.
     */
    @RequestMapping(value = "/board5Delete")
    public String boardDelete(HttpServletRequest request) {
        
        String brdno = request.getParameter("brdno");
        
        boardSvc.deleteBoardOne(brdno);
        
        return "redirect:/board5List";
    }

    /* ===================================================================== */
    
    /**
     * 댓글 저장.
     */
    @RequestMapping(value = "/board5ReplySave")
    public String board5ReplySave(HttpServletRequest request, BoardReplyVO boardReplyInfo) {
        
        boardSvc.insertBoardReply(boardReplyInfo);

        return "redirect:/board5Read?brdno=" + boardReplyInfo.getBrdno();
    }
    
    /**
     * 댓글 삭제.
     */
    @RequestMapping(value = "/board5ReplyDelete")
    public String board5ReplyDelete(HttpServletRequest request, BoardReplyVO boardReplyInfo) {
        
        boardSvc.deleteBoard5Reply(boardReplyInfo.getReno());

        return "redirect:/board5Read?brdno=" + boardReplyInfo.getBrdno();
    }      
}
