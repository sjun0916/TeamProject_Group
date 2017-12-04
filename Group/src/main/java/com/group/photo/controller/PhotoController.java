package com.group.photo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group.board.common.FileUtil2;
import com.group.board.vo.FileVO;
import com.group.board.vo.SearchVO;
import com.group.photo.service.PhotoService;
import com.group.photo.vo.PhotoVO;

@Controller
public class PhotoController {
	private static final Logger logger = LoggerFactory.getLogger(PhotoController.class);

	@Autowired
	private PhotoService photoSvc;



	/**
	 * 리스트.
	 */
	@RequestMapping(value = "/PhotoList")
	public String photoList(SearchVO searchVO, ModelMap modelMap) {
		searchVO.setDisplayRowCount(9);
		searchVO.pageCalculate( photoSvc.selectPhotoCount(searchVO) ); // startRow, endRow

		List<?> listview  = photoSvc.selectPhotoList(searchVO);
		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);

		return "content_photo/PhotoList";
	}//사용자가 선택한 필드와 검색어가 전달됨(SearchVO)


	/** 
	 * 글 쓰기. 
	 */
	@RequestMapping(value = "/PhotoForm")
	public String photoForm(HttpServletRequest request, ModelMap modelMap) {
		String photonum = request.getParameter("photonum");
		if (photonum != null) {
			PhotoVO photoInfo = photoSvc.selectPhotoOne(photonum);
			List<?> listview = photoSvc.selectPhotoFileList(photonum);

			modelMap.addAttribute("photoInfo", photoInfo);
			modelMap.addAttribute("listview", listview);
		}

		return "content_photo/PhotoForm";
	}

	/**
	 * 
	 * 글 저장.
	 */
	@RequestMapping(value = "/PhotoSave")
	public String photoSave(HttpServletRequest request, PhotoVO photoInfo) {
		String[] filenum = request.getParameterValues("photofilenum");
		System.out.println(photoInfo.getUploadfile());
		FileUtil2 fs = new FileUtil2();
		fs.setConPath(request.getServletContext().getRealPath("/imgUpload"));

		List<FileVO> filelist = fs.saveAllFiles(photoInfo.getUploadfile());
		Object[] arrFileVO = filelist.toArray();
		FileVO tmpFileVO = new FileVO();
		tmpFileVO = (FileVO)arrFileVO[0];
		photoInfo.setRealname(tmpFileVO.getRealname());
		photoSvc.insertPhoto(photoInfo, filelist, filenum);

		return "redirect:/PhotoList";
	}

	/**
	 * 글 읽기.
	 */
	@RequestMapping(value = "/PhotoRead")
	public String photoRead(HttpServletRequest request, ModelMap modelMap) {

		String photonum = request.getParameter("photonum");

	
		PhotoVO photoInfo = photoSvc.selectPhotoOne(photonum);
		List<?> listview = photoSvc.selectPhotoFileList(photonum);


		modelMap.addAttribute("photoInfo", photoInfo);
		modelMap.addAttribute("listview", listview);


		return "content_photo/PhotoRead";
	}

	/**
	 * 글 삭제.
	 */
	@RequestMapping(value = "/PhotoDelete")
	public String photoDelete(HttpServletRequest request) {

		String photonum = request.getParameter("photonum");

		photoSvc.deletePhotoOne(photonum);

		return "redirect:/PhotoList";
	}

	/* ===================================================================== */



}
