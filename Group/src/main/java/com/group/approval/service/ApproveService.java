package com.group.approval.service;

import java.util.List;
import java.util.Map;

import com.group.approval.vo.Approval;
import com.group.approval.vo.Document;
import com.group.approval.vo.Draft;
import com.group.approval.vo.Progress;
import com.group.user.vo.Department;
import com.group.user.vo.Position;
import com.group.user.vo.UserVO;


public interface ApproveService {

	// 기안 페이지 요청[1.Document 2.department 3.position]
	List<Document> 									apAddSelServ();
	List<Department> 								apAddMmSelServ();
	List<Position> 									apADDPosSelServ();
	// [ajax] 기안 페이지 요청 : 결재선 사원 가져오기
	List<UserVO> 									apMmAddServ(Position position, Department department);
	// [ajax] 결재선 가져오기[팝업:목록]/ 결재선 검색[jsp]
	List<Approval> 									apAprListServ(int mmCode);
	// 총 목록 (대기/반려/완료)
	List<Draft> 									pgListServ(int apProgress, int mmCode);
	// 임시 목록
	List<Draft> 									temListServ(int mmCode);
	// 임시 목록 상세보기
	List<Draft> 									temContServ(int dftCode);
	// List 검색
	List<Draft> 									apSearchServ(Draft draft, String docFileGroup);
	List<Document> 									apSearchDocServ(String docFileGroup);
	List<Draft> 									apSearchDftServ(Draft draft);
	List<Document> 									apDocSelServ(Document document);
	// 문서 양식 목록 문서목록
	List<Document> 									docListServ();

	// 다운로드 (1. 문서 2. 기안첨부파일)
	Document 										apDownDocServ(int docCode);
	// 결재/반려/완료 페이지 요청
	Draft 											hvContServ(int dftCode);
	Draft 											apDownDftServ(int dftCode);
	
	Map<String, Object> 							apAprSelServ(int aprCode);
	Map<String, Object> 							temContNameServ(List<Draft> draft);
	Map<String, Object> 							temContDepServ(List<Draft> draft);
	Map<String, Object> 							temContPtServ(List<Draft> draft);
	
	// 임시 목록 문서구분 select가져오기
	String 											temDocSeleServ(int dftCode);

	// 결재 승인/반려 요청
	int 											apProAddServ(Draft draft, Progress progress, int dftCode);
	// 문서 양식 등록(1.문서등록 2.select document[ajax]
	int 											apDocAddServ(Document document, String uploadPath);
	// [ajax] 기안 페이지 결재선 등록
	int 											apAprAddServ(Approval approval);
	// 기안 등록
	int 											apAddServ(Draft draft, Progress progress, String uploadPath);	
}