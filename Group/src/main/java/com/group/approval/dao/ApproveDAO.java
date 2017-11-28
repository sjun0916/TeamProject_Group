package com.group.approval.dao;

import java.util.List;
import java.util.Map;

import com.group.approval.vo.Approval;
import com.group.approval.vo.Document;
import com.group.approval.vo.Draft;
import com.group.approval.vo.Progress;
import com.group.user.vo.Department;
import com.group.user.vo.Position;
import com.group.user.vo.UserVO;


public interface ApproveDAO {

	// 기안 페이지 요청[문서/부서/직급/'AJAX':결재선사원불러오기]
	List<Document> 									selectAllDoc();
	List<Department> 								selectAllApDep();
	List<Position> 									selectAllApPos();
	List<UserVO> 									selectByApMm(Map<String, Integer> map);
	// 개인별 결재라인 가져오기
	List<Approval> 									selectAllApr(int mmCode);
	// pk값으로 결재라인 검색
	List<Approval> 									selectbyReApr(int aprCode);
	// 임시 목록
	List<Draft> 									selectAllTem(int mmCode);
	// 임시 상세보기
	List<Draft> 									selectContTem(int dftCode);
	// -----총 목록 : intro 목록
	List<Draft> 									selectAllPg(int mmCode);
	List<Document> 									selectListByDoc(Document document);
	// -----총 목록 : 대기/반려/완료
	List<Draft> 									selectByHv(Map<String, Integer> map);
	List<Draft> 									selectByReCom(Map<String, Integer> map);
	// 결재 목록 : 검색
	List<Draft> 									selectBySearchGroup(Draft draft);
	List<Document> 									selectBySearchDoc(String docFileGroup);
	List<Draft>										selectBySearchTem(Draft draft);

	// 결재[대기/완료/반려] 신청 폼(draft + progress)
	Draft 											selectContHv(int dftCode);
	Draft 											selectCountHv(int dftCode);
	
	Document 										selectListByDoc(int docCode);	
	
	Progress										selectDetailHv(int dftCode);

	// 직원별 정보가져오기
	Map<String, Object>								selectByPersonal(int mmCode);

	String 											selectDetailMm(int mmCode);
	String 											selectDetailDp(int mmCode);
	String 											selectDetailPt(int mmCode);
	String 											selectDetailPMn(int proApproval);
	String 											selectDetailPDp(int proApproval);
	String 											selectDetailPPt(int proApproval);
	// 결재 목록 : 결재 대기 목록 결재자값 가져오기
	String 											selectByApr(int mmCode);
	String 											selectDetailDoc(int dftCode);
	
	// 결재 요청 (1차 progress: 승인/반려 여부)
	int 											modifyPro(Progress progress);
	// 결재 요청 (2-1차 draft 업데이트
	int												modifyDft(Draft draft);
	// 결재 요청 (2-2차 : 결재자 update)
	int 											modifyProApv(Progress progress);
	// 결재 요청 (approval COUNT)
	/* Draft selectCountHv(int dftCode); */
	// 문서 양식 등록
	int 											insertDoc(Document document);
	// 개인별 결재라인 등록
	int 											insertApr(Approval approval);
	// 기안 등록( draft + progress)
	int 											insertDft(Draft draft);
	int 											insertPg(Progress progress);
}