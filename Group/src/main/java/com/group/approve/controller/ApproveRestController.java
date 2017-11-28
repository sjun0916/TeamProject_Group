package com.group.approve.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.group.approve.service.ApproveService;
import com.group.approve.util.UtilFile;
import com.group.approve.vo.Approval;
import com.group.approve.vo.Document;
import com.group.approve.vo.Draft;
import com.group.approve.vo.Progress;
import com.group.user.vo.Department;
import com.group.user.vo.Position;
import com.group.user.vo.UserVO;

@RestController
public class ApproveRestController {

	private static final Logger log = LoggerFactory.getLogger(ApproveRestController.class);
	
	@Autowired
	private ApproveService approveService;

	// 문서양식 등록 : POST
	@RequestMapping(value ="ap/addDoc", method = RequestMethod.POST)
	public Map<String, Object> apDocAddReCtrl(@RequestParam("uploadFile") MultipartFile uploadFile,
							  MultipartHttpServletRequest request, Document document) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Document> selDoc = new ArrayList<Document>();
		UtilFile utilFile = new UtilFile();
		
		// 파일 업로드 
		String uploadPath = utilFile.fileUpload(request, uploadFile, selDoc);

		log.debug("ApproveRestController apDocAddReCtrl uploadPath : " + uploadPath);
		
		int result = approveService.apDocAddServ(document, uploadPath);
		
		//파일 업로드 db 입력 여부 
		if(result != 0) {
			resultMap.put("check","성공");
			
//			generate mapper에서 document에서 select해와서 resultMap에다 담아줘서 가져옴
			selDoc = approveService.apDocSelServ(document);
			
			resultMap.put("selDoc", selDoc);			
		} else {
			resultMap.put("check", "실패");
		}
		
		log.debug("ApproveRestController apDocAddReCtrl resultMap : " + resultMap);
		
		return resultMap; 
	}
	
	// 결재선 : 브라우저 내에서 선택하여 사원코드/이름값 가져오기
	@RequestMapping(value ="ap/addMm", method = RequestMethod.POST)
	public List<UserVO> apMmAddReCtrl(Position position, Department department) {
		
		log.debug("ApproveRestController apMmAddReCtrl position : " + position + ", department : " + department);
		
		return approveService.apMmAddServ(position,department);
	}
	
	// 결재선 : 결재선 등록,즐겨찾기
	@RequestMapping(value ="ap/addApr", method = RequestMethod.POST)
	public int apAprAddReCtrl(Approval approval) {
				
		log.debug("ApproveRestController apAprAddReCtrl approval : " + approval);
		
		int apr = 0;
		System.out.println(approval.getAprApproval1());
		//결재선이 모두 null일 경우 조건
		if(approval.getAprApproval1() != 0) {
			apr = approveService.apAprAddServ(approval);
		}
		
		log.debug("ApproveRestController apAprAddReCtrl apr : " + apr);
		
		return apr;
	}
	
	// 결재선 : list에서 view_db에서 사원코드로 저장된 결재선 가져오기 [복수]
	@RequestMapping(value ="ap/listApr", method = RequestMethod.POST)
	public List<Approval> apAprListReCtrl(@RequestParam("mmCode") int mmCode) {		
		
		log.debug("ApproveRestController apAprListReCtrl mmCode : " + mmCode);
		
		return approveService.apAprListServ(mmCode);
	}
	
	// 결재선 : (pk값) 결재선 가져오기[단수]
	@RequestMapping(value="ap/selApr", method = RequestMethod.POST)
	public Map apAprSelReCtrl(@RequestParam("aprCode") int aprCode) {
		
		log.debug("ApproveRestController apAprSelReCtrl aprCode : " + aprCode);
	
		return approveService.apAprSelServ(aprCode);
	}
	
	// 검색 : 결재 목록
	@RequestMapping(value="ap/searchDft", method = RequestMethod.POST)
	public List<Draft> apSearchListCtrl(Draft draft,
					@RequestParam(value="docFileGroup", defaultValue="문서없음") String docFileGroup) {
		
		log.debug("ApproveRestController apSearchListCtrl draft : " + draft);
		log.debug("ApproveRestController apSearchListCtrl docFileGroup : " + docFileGroup);
		
		return approveService.apSearchServ(draft ,docFileGroup);
	}
	
	// 검색 : 문서 양식 목록
	@RequestMapping(value = "ap/searchDoc", method = RequestMethod.POST)
	public List<Document> apSearchDocListCtrl(@RequestParam(value="docFileGroup") String docFileGroup) {
		
		log.debug("ApproveRestController apSearchDocListCtrl docFileGroup : " + docFileGroup);
	
		return approveService.apSearchDocServ(docFileGroup);	
	}
	
	// 검색 : 임시 저장목록
	@RequestMapping(value = "ap/searchTem", method = RequestMethod.POST)
	public List<Draft> apSearchDocListCtrl(Draft draft,
						@RequestParam(value="docFileGroup", defaultValue="0") String docFileGroup) {
		
		log.debug("ApproveRestController apSearchDocListCtrl draft : " + draft + 
							", docFileGroup : " + docFileGroup);
		
		return approveService.apSearchDftServ(draft);
	}
	
	// 전자결제 팝업창 기본데이터 요청 : 윤재호
	@RequestMapping(value ="ap/evApproval", method = RequestMethod.POST)
	public Map<String, Object> evAppReqData() {
		
		// 1.문서종류, 결제부서, 직급 정보를 조회한다
		List<Document> doc = approveService.apAddSelServ(); //문서종류
		List<Department> dep = approveService.apAddMmSelServ(); //부서
		List<Position> pos = approveService.apADDPosSelServ(); //직급
		
		// 2.map에 담아 뷰로 값 리턴한다
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("doc", doc);
		resultMap.put("dep", dep);
		resultMap.put("pos", pos);
		
		log.debug("ApproveRestController evAppReqData resultMap : " + resultMap);
		
		return resultMap;
	}
	
	//기안 등록 : POST 윤재호
	@RequestMapping(value ="ap/addApply", method = RequestMethod.POST)
	public String apAddApplyCtrl(@RequestParam("uploadFile") MultipartFile uploadFile,
							MultipartHttpServletRequest request, Draft draft, Progress progress){
			

		log.debug("ApproveRestController apAddApplyCtrl draft : " + draft);
		log.debug("ApproveRestController apAddApplyCtrl progress : " + progress);
		
		UtilFile utilFile = new UtilFile();
		
		String uploadPath = utilFile.fileUpload(request, uploadFile, draft);
		
		int result = approveService.apAddServ(draft, progress, uploadPath);
		
		log.debug("ApproveRestController evAppReqData result : " + result);
		
		return null;
	}
}