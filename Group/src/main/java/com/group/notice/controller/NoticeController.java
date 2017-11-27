package com.group.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group.board.common.FileUtil;
import com.group.board.vo.FileVO;
import com.group.board.vo.SearchVO;
import com.group.notice.service.NoticeService;
import com.group.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

    @Autowired
    private NoticeService noticeSvc;
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/NoticeList")
    public String noticeList(SearchVO searchVO, ModelMap modelMap) {

        searchVO.pageCalculate( noticeSvc.selectNoticeCount(searchVO) ); // startRow, endRow

        List<?> listview  = noticeSvc.selectNoticeList(searchVO);
        List<?> listview2 = noticeSvc.selectNoticeList2();
        modelMap.addAttribute("listview2", listview2);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
        
        return "content_notice/NoticeList";
    }//사용자가 선택한 필드와 검색어가 전달됨(SearchVO)


    /** 
     * 글 쓰기. 
     */
    @RequestMapping(value = "/NoticeForm")
    public String noticeForm(HttpServletRequest request, ModelMap modelMap) {
        String noticenum = request.getParameter("noticenum");
        if (noticenum != null) {
            NoticeVO noticeInfo = noticeSvc.selectNoticeOne(noticenum);
            List<?> listview = noticeSvc.selectNoticeFileList(noticenum);
        
            modelMap.addAttribute("noticeInfo", noticeInfo);
            modelMap.addAttribute("listview", listview);
        }
        
        return "content_notice/NoticeForm";
    }
    
    /**
     * 글 저장.
     */
    @RequestMapping(value = "/NoticeSave")
    public String noticeSave(HttpServletRequest request, NoticeVO noticeInfo) {
        String[] filenum = request.getParameterValues("filenum");
        System.out.println(noticeInfo.getUploadfile());
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFiles(noticeInfo.getUploadfile());

        noticeSvc.insertNotice(noticeInfo, filelist, filenum);

        return "redirect:/NoticeList";
    }

    /**
     * 글 읽기.
     */
    @RequestMapping(value = "/NoticeRead")
    public String noticeRead(HttpServletRequest request, ModelMap modelMap) {
        
        String noticenum = request.getParameter("noticenum");
        
        noticeSvc.updateNoticeRead(noticenum);
        NoticeVO noticeInfo = noticeSvc.selectNoticeOne(noticenum);
        List<?> listview = noticeSvc.selectNoticeFileList(noticenum);
       
        
        modelMap.addAttribute("noticeInfo", noticeInfo);
        modelMap.addAttribute("listview", listview);
        
        
        return "content_notice/NoticeRead";
    }
    
    /**
     * 글 삭제.
     */
    @RequestMapping(value = "/NoticeDelete")
    public String noticeDelete(HttpServletRequest request) {
        
        String noticenum = request.getParameter("noticenum");
        
        noticeSvc.deleteNoticeOne(noticenum);
        
        return "redirect:/NoticeList";
    }

    /* ===================================================================== */
    
      

}
