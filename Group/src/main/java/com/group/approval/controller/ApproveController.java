package com.group.approval.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.group.approval.service.ApproveService;
import com.group.approval.vo.Document;
import com.group.approval.vo.Draft;
import com.group.approval.vo.Progress;
import com.group.user.vo.Department;
import com.group.user.vo.Position;


@Controller
public class ApproveController {
	private static final Logger log = LoggerFactory.getLogger(ApproveController.class);

	@Autowired
	private ApproveService approveService;

	// 기안 등록 : GET
	@RequestMapping(value = "ap/add", method = RequestMethod.GET)
	public String add(Model model) {

		// log.debug("ctrl dftAdd GET> test");
		List<Document> doc = approveService.apAddSelServ();
		List<Department> dep = approveService.apAddMmSelServ();
		List<Position> pos = approveService.apADDPosSelServ();

		model.addAttribute("doc", doc);
		model.addAttribute("dep", dep);
		model.addAttribute("pos", pos);

		log.debug("ApproveController add model : " + model);
		
		return "/approve/ap_dftAdd";
	}

	// 기안 등록 : POST
	@RequestMapping(value = "ap/add", method = RequestMethod.POST)
	public String apAddCtrl(@RequestParam("uploadFile") MultipartFile uploadFile,
					MultipartHttpServletRequest request, Draft draft, Progress progress) {

		log.debug("ApproveController apAddCtrl : " + draft);
		
		UtilFile utilFile = new UtilFile();

		String uploadPath = utilFile.fileUpload(request, uploadFile, draft);
		int result = approveService.apAddServ(draft, progress, uploadPath);
		
		log.debug("ApproveController apAddCtrl uploadPath :" + uploadPath);
		log.debug("ApproveController apAddCtrl result :" + result);

		return "redirect:/ap/list";
	}

	// 결재 목록 [대기/반려/완료] : GET
	@RequestMapping(value = "ap/list", method = RequestMethod.GET)
	public String apProListCtrl(Model model,
			@RequestParam(value = "apProgress", defaultValue = "0") int apProgress, HttpSession session) {

		int mmCode = (int) session.getAttribute("mmCode");
		
		log.debug("ApproveController apProListCtrl mmCode :" + mmCode);

		List<Draft> pgList = approveService.pgListServ(apProgress, mmCode);
		List<Document> docList = approveService.docListServ();

		log.debug("ApproveController apProListCtrl pgList :" + pgList);
		log.debug("ApproveController apProListCtrl docList :" + docList);
		
		model.addAttribute("pgList", pgList);
		model.addAttribute("docList", docList);

		return "/approve/ap_list";
	}

	// 결재 상세보기[대기/반려/완료] : GET
	@RequestMapping(value = "ap/Content", method = RequestMethod.GET)
	public String apHvDetailCtrl(Model model, @RequestParam("dftCode") int dftCode) {
		
		log.debug("ApproveController apHvDetailCtrl dftCode :" + dftCode);
		
		Draft draft = new Draft();
		
		draft = approveService.hvContServ(dftCode);

		model.addAttribute("draft", draft);

		log.debug("ApproveController apHvDetailCtrl model :" + model);
		
		return draft.getUrl();
	}

	// 결재 요청[승인/반려] : POST
	@RequestMapping(value = "ap/proAdd", method = RequestMethod.POST)
	public String proAdd(Draft draft, Progress progress, @RequestParam("dftCode") int dftCode) {

		log.debug("ApproveController proAdd dftCode :" + dftCode);
		
		int result = approveService.apProAddServ(draft, progress, dftCode);
		
		log.debug("ApproveController proAdd result :" + result);

		return "redirect:/ap/list";
	}

	// 임시 문서함 : GET
	@RequestMapping(value = "ap/temList", method = RequestMethod.GET)
	public String temList(Model model, HttpSession session) {

		int mmCode = (int) session.getAttribute("mmCode");

		List<Draft> temList = approveService.temListServ(mmCode);
		List<Document> docList = approveService.docListServ();

		log.debug("ApproveController proAdd temList :" + temList);
		log.debug("ApproveController proAdd docList :" + docList);

		model.addAttribute("temList", temList);
		model.addAttribute("docList", docList);

		return "/approve/ap_temList";
	}

	// 임시 문서함 상세보기 : GET
	@RequestMapping(value = "ap/temContent", method = RequestMethod.GET)
	public String aptemDetailCtrl(Model model, @RequestParam("dftCode") int dftCode) {

		log.debug("ApproveController aptemDetailCtrl dftCode : " + dftCode);
		
		List<Draft> draft = approveService.temContServ(dftCode);
		
		log.debug("ApproveController aptemDetailCtrl draft : " + draft);
		
		model.addAttribute("draft", draft);
		model.addAttribute("dep", approveService.apAddMmSelServ());
		model.addAttribute("pos", approveService.apADDPosSelServ());
		model.addAttribute("doc", approveService.apAddSelServ());
		model.addAttribute("selectDoc", approveService.temDocSeleServ(dftCode));
		model.addAttribute("nameMap", approveService.temContNameServ(draft));
		model.addAttribute("depMap", approveService.temContDepServ(draft));
		model.addAttribute("ptMap", approveService.temContPtServ(draft));
		
		return "/approve/ap_temModify";
	}

	// 문서 양식 목록 : GET
	@RequestMapping(value = "ap/docList", method = RequestMethod.GET)
	public String apdocListCtrl(Model model) {

		List<Document> docList = new ArrayList<Document>();

		docList = approveService.docListServ();
		
		log.debug("ApproveController apdocListCtrl docList : " + docList);
		
		model.addAttribute("docList", docList);

		return "/approve/ap_docList";
	}

	// 다운로드 : 기안 : 첨부파일 다운로드
	@RequestMapping(value = "ap/dftDownFile", method = RequestMethod.GET)
	public ModelAndView apDftDownDftFile(@RequestParam(value = "dftCode", required = true) int dftCode) {

		log.debug("ApproveController apDftDownDftFile dftCode : " + dftCode);
		
		Draft draft = new Draft();
		
		draft = approveService.apDownDftServ(dftCode);
		
		log.debug("ApproveController apDftDownDftFile draft : " + draft);
		
		File downDftFile = new File(draft.getDftFilePath());

		return new ModelAndView("downloadView", "downloadFile", downDftFile);
	}

	// 다운로드 : 문서 : 첨부파일 다운로드
	@RequestMapping(value = "ap/docDownFile", method = RequestMethod.GET)
	public ModelAndView apDocDownDftFile(@RequestParam(value = "docCode", required = true) int docCode) {
		
		log.debug("ApproveController apDocDownDftFile docCode : " + docCode);
		
		Document document = new Document();
		
		document = approveService.apDownDocServ(docCode);
		
		log.debug("ApproveController apDocDownDftFile document : " + document);

		File downFile = new File(document.getDocFilePath());

		return new ModelAndView("downloadView", "downloadFile", downFile);
	}
}