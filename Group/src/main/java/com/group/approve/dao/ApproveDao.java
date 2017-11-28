package com.group.approve.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.approve.vo.Approval;
import com.group.approve.vo.Document;
import com.group.approve.vo.Draft;
import com.group.approve.vo.Progress;
import com.group.user.vo.Department;
import com.group.user.vo.Position;
import com.group.user.vo.UserVO;


@Repository
public class ApproveDao {

	private static final Logger log = LoggerFactory.getLogger(ApproveDao.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 기안 페이지 요청 : 1-1.draft
	public List<Document> selectAllDoc() {
		
		return sqlSession.selectList("AprDAO.selectAllDoc");
	}

	// 기안 페이지 요청 : 1-2.department
	public List<Department> selectAllApDep() {
		
		return sqlSession.selectList("acDAO.selectDp");
	}

	// 기안 페이지 요청 : 1-3. position
	public List<Position> selectAllApPos() {
		
		return sqlSession.selectList("acDAO.selectPt");
	}

	// [ajax] 기안 페이지 요청 : 1-4. 사원번호[이름] 가져오기
	public List<UserVO> selectByApMm(Map<String, Integer> map) {
		
		log.debug("ApproveDAOImpl selectByApMm map : " + map);
		
		return sqlSession.selectList("AprDAO.selectContMm", map);
	}

	// [ajax] 개인별 결재선 등록
	public int insertApr(Approval approval) {
		
		log.debug("ApproveDAOImpl insertApr approval : " + approval);
	
		return sqlSession.insert("AprDAO.insertApr", approval);
	}

	// [ajax] 개인별 결재라인 가져오기
	public List<Approval> selectAllApr(int mmCode) {
		
		log.debug("ApproveDAOImpl selectAllApr mmCode : " + mmCode);
		
		return sqlSession.selectList("AprDAO.selectByApr", mmCode);
	}

	// [ajax] pk값 결재라인 가져오기
	public List<Approval> selectbyReApr(int aprCode) {
		
		log.debug("ApproveDAOImpl selectbyReApr aprCode : " + aprCode);
		
		return sqlSession.selectList("AprDAO.selectByReApr", aprCode);
	}

	// 기안 등록 1-1 : draft
	public int insertDft(Draft draft) {
		
		log.debug("ApproveDAOImpl insertDft draft : " + draft);
		
		return sqlSession.insert("AprDAO.insertDft", draft);
	}

	// 기안 등록 1-2 : progress
	public int insertPg(Progress progress) {
		
		log.debug("ApproveDAOImpl insertPg progress : " + progress);
		
		return sqlSession.insert("AprDAO.insertPg", progress);
	}

	// 결재 신청 폼 : dftCode로 결재 신청 정보 가져오기
	public Draft selectContHv(int dftCode) {
		
		log.debug("ApproveDAOImpl selectContHv dftCode : " + dftCode);
		
		return sqlSession.selectOne("AprDAO.selectContHv", dftCode);
	}

	// 결재 신청 폼 : proReason/proApproval 가져오기
	public Progress selectDetailHv(int dftCode) {
		
		log.debug("ApproveDAOImpl selectDetailHv dftCode : " + dftCode);
		
		return sqlSession.selectOne("AprDAO.selectDetailHv", dftCode);
	}

	// 결재 요청 : 1단계 : progress update
	public int modifyPro(Progress progress) {
		
		log.debug("ApproveDAOImpl modifyPro progress : " + progress);
		
		return sqlSession.update("AprDAO.updatePro", progress);
	}

	// 결재 요청 : 2단계 : draft update
	public int modifyDft(Draft draft) {
		
		log.debug("ApproveDAOImpl modifyDft draft : " + draft);
		
		return sqlSession.update("AprDAO.updateDft", draft);
	}

	// 결재 요청 : 2단계 - 2 : progress의 pro_approval update
	public int modifyProApv(Progress progress) {
		
		log.debug("ApproveDAOImpl modifyProApv progress : " + progress);
		
		return sqlSession.update("AprDAO.updateProApv", progress);
	}

	// 결재 요청 결재자 가져오기 && [상세보기] :
	public Draft selectCountHv(int dftCode) {
		
		log.debug("ApproveDAOImpl selectCountHv dftCode : " + dftCode);
		
		return sqlSession.selectOne("AprDAO.selectContHv", dftCode);
	}

	// 결재 요청 : 기안자 이름 가져오기
	public String selectDetailMm(int mmCode) {
		
		log.debug("ApproveDAOImpl selectDetailMm mmCode : " + mmCode);
		
		return sqlSession.selectOne("AprDAO.selectByMm", mmCode);
	}

	// 결재 요청 : 기안자 부서 가져오기
	public String selectDetailDp(int mmCode) {
		
		log.debug("ApproveDAOImpl selectDetailDp mmCode : " + mmCode);
		
		return sqlSession.selectOne("AprDAO.selectByDp", mmCode);
	}

	// 결재 요청 : 기안자 직급 가져오기
	public String selectDetailPt(int mmCode) {
		
		log.debug("ApproveDAOImpl selectDetailPt mmCode : " + mmCode);
		
		return sqlSession.selectOne("AprDAO.selectByPt", mmCode);
	}

	// 결재 요청 : 결재자 이름 가져오기
	public String selectDetailPMn(int proApproval) {
		
		log.debug("ApproveDAOImpl selectDetailPMn proApproval : " + proApproval);
		
		return sqlSession.selectOne("AprDAO.selectByPMm", proApproval);
	}

	// 결재 요청 : 결재자 부서 가져오기
	public String selectDetailPDp(int proApproval) {
		
		log.debug("ApproveDAOImpl selectDetailPDp proApproval : " + proApproval);
		
		return sqlSession.selectOne("AprDAO.selectByPDp", proApproval);
	}

	// 결재 요청 : 결재자 직급 가져오기
	public String selectDetailPPt(int proApproval) {
		
		log.debug("ApproveDAOImpl selectDetailPPt proApproval : " + proApproval);
		
		return sqlSession.selectOne("AprDAO.selectByPPt", proApproval);
	}

	// 임시 목록
	public List<Draft> selectAllTem(int mmCode) {
		
		log.debug("ApproveDAOImpl selectAllTem mmCode : " + mmCode);
		
		return sqlSession.selectList("AprDAO.selectAllTem", mmCode);
	}
	
	// 임시 목록 [문서분류가져오기]
	public String selectDetailDoc(int dftCode) {
		
		log.debug("ApproveDAOImpl selectDetailDoc dftCode : " + dftCode);
		
		return sqlSession.selectOne("AprDAO.selectByDoc", dftCode);
	}

	// 임시 [상세보기]
	public List<Draft> selectContTem(int dftCode) {
		
		log.debug("ApproveDAOImpl selectContTem dftCode : " + dftCode);
		
		return sqlSession.selectList("AprDAO.selectContHv", dftCode);
	}

	// ------총 결재 목록 : intro 목록
	public List<Draft> selectAllPg(int mmCode) {
		
		log.debug("ApproveDAOImpl selectAllPg mmCode : " + mmCode);
		
		return sqlSession.selectList("AprDAO.selectAllPg", mmCode);
	}

	// ----- 총 목록 : 대기
	public List<Draft> selectByHv(Map<String, Integer> map) {
	
		log.debug("ApproveDAOImpl selectByHv map : " + map);
		
		return sqlSession.selectList("AprDAO.selectByHv", map);
	}

	// ----- 총 목록: 반려/완료
	public List<Draft> selectByReCom(Map<String, Integer> map) {
		
		log.debug("ApproveDAOImpl selectByReCom map : " + map);
		
		return sqlSession.selectList("AprDAO.selectByReCom", map);
	}

	// 결재 목록 : 결재자 결재 가능 목록
	public String selectByApr(int mmCode) {
		
		log.debug("ApproveDAOImpl selectByApr mmCode : " + mmCode);
		
		return sqlSession.selectOne("", mmCode);
	}

	// 문서 양식 등록
	public int insertDoc(Document document) {
		
		log.debug("ApproveDAOImpl insertDoc document : " + document);
		
		return sqlSession.insert("AprDAO.insertDoc", document);
	}

	// 문서 양식 등록후 select
	public List<Document> selectListByDoc(Document document) {
		
		log.debug("ApproveDAOImpl selectListByDoc document : " + document);
		
		return sqlSession.selectList("AprDAO.selectListByDoc", document);
	}

	// 문서 양식 다운로드
	public Document selectListByDoc(int docCode) {
		
		log.debug("ApproveDAOImpl selectListByDoc docCode : " + docCode);
		
		return sqlSession.selectOne("AprDAO.selectListByDoc", docCode);
	}

	// 개인별 결재선 정보 가져오기
	public Map<String, Object> selectByPersonal(int mmCode) {
		
		log.debug("ApproveDAOImpl selectByPersonal mmCode : " + mmCode);
		
		return sqlSession.selectOne("AprDAO.selectByPersonal", mmCode);
	}

	// 결재목록 : 검색
	public List<Draft> selectBySearchGroup(Draft draft) {
		
		log.debug("ApproveDAOImpl selectBySearchGroup draft : " + draft);
		
		return sqlSession.selectList("AprDAO.selectBySearchGroup", draft);
	}

	// 문서양식 : 검색
	public List<Document> selectBySearchDoc(String docFileGroup) {
		
		log.debug("ApproveDAOImpl selectBySearchDoc docFileGroup : " + docFileGroup);
		
		return sqlSession.selectList("AprDAO.selectBySearchDocGroup", docFileGroup);
	}

	// 임시 목록 : 검색
	public List<Draft> selectBySearchTem(Draft draft) {
		
		log.debug("ApproveDAOImpl selectBySearchTem draft : " + draft);
		
		return sqlSession.selectList("AprDAO.selectBySearchTemGroup", draft);
	}
}