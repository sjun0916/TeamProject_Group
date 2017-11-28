package com.group.approval.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.approval.dao.ApproveDAO;
import com.group.approval.vo.Approval;
import com.group.approval.vo.Document;
import com.group.approval.vo.Draft;
import com.group.approval.vo.Progress;
import com.group.user.vo.Department;
import com.group.user.vo.Position;
import com.group.user.vo.UserVO;



@Service
public class ApproveServiceImpl implements ApproveService {

	private static final Logger log = LoggerFactory.getLogger(ApproveServiceImpl.class);
	
	@Autowired
	private ApproveDAO approveDAO;

	// ----- 메서드 : 현재 시간 출력
	Date today = new Date();
	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);

	// ----- 메서드 : 결재 목록 이름 셋팅
	public List<Draft> setName(List<Draft> pgList) {
		
		log.debug("ApproveServiceImpl setName pgList : " + pgList);

		for (int i = 0; i < pgList.size(); i++) {
			String mmName = approveDAO.selectDetailMm(pgList.get(i).getMmCode());
			String pMmName = approveDAO.selectDetailPMn(pgList.get(i).getProApproval());

			pgList.get(i).setMmName(mmName);
			pgList.get(i).setpMmName(pMmName);
			
			log.debug("ApproveServiceImpl setName pgList.get(i).getMmName : " + pgList.get(i).getMmName());
			log.debug("ApproveServiceImpl setName pgList.get(i).getpMmName : " + pgList.get(i).getpMmName());
		}
		
		log.debug("ApproveServiceImpl setName final pgList : " + pgList);
		
		return pgList;
	}

	// 기안 요청 : GET ---- DOCUMENT
	@Override
	public List<Document> apAddSelServ() {
		
		return approveDAO.selectAllDoc();
	}

	// 기안 요청 : GET ---- Department
	@Override
	public List<Department> apAddMmSelServ() {
		
		return approveDAO.selectAllApDep();
	}

	// 기안 요청 : GET ---- POSITION
	@Override
	public List<Position> apADDPosSelServ() {
		
		return approveDAO.selectAllApPos();
	}

	// --- [AJAX] 직급/부서명 가져오기 : GET
	@Override
	public List<UserVO> apMmAddServ(Position position, Department department) {

		log.debug("ApproveServiceImpl apMmAddServ position : " + position);
		log.debug("ApproveServiceImpl apMmAddServ department : " + department);
		
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("dpCode", department.getDpCode());
		map.put("ptCode", position.getPtCode());
		
		return approveDAO.selectByApMm(map);
	}
	
	// --- [AJAZ] 결재라인 가져오기 mmCode : POST
	@Override
	public List<Approval> apAprListServ(int mmCode) {

		List<Approval> apr = approveDAO.selectAllApr(mmCode);
		
		for (int i = 0; i < apr.size(); i++) {
			apr.get(i).setAprName1(approveDAO.selectDetailMm(apr.get(i).getAprApproval1()));
			apr.get(i).setAprName2(approveDAO.selectDetailMm(apr.get(i).getAprApproval2()));
			apr.get(i).setAprName3(approveDAO.selectDetailMm(apr.get(i).getAprApproval3()));
		}
			
		log.debug("ApproveServiceImpl apAprListServ apr : " + apr);
			
		return apr;
	}

	// --- [AJAX] 결재라인 등록 : POST
	@Override
	public int apAprAddServ(Approval approval) {
		
		log.debug("ApproveServiceImpl apAprAddServ approval : " + approval);
		
		return approveDAO.insertApr(approval);
	}

	// --- [AJAZ] 결재라인 가져오기 : 사원조회 : POST
	@Override
	public Map<String, Object> apAprSelServ(int aprCode) {

		Map<String, Object> map1 = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		Map<String, Object> map3 = new HashMap<String, Object>();
		Map<String, Object> totalMap = new HashMap<String, Object>();

		List<Approval> apr = approveDAO.selectbyReApr(aprCode);
		
		log.debug("ApproveServiceImpl apAprSelServ apr : " + apr);

		totalMap.put("map1", approveDAO.selectByPersonal(apr.get(0).getAprApproval1()));
		totalMap.put("map2", approveDAO.selectByPersonal(apr.get(0).getAprApproval2()));
		totalMap.put("map3", approveDAO.selectByPersonal(apr.get(0).getAprApproval3()));

		log.debug("ApproveServiceImpl apAprSelServ totalMap : " + totalMap);

		return totalMap;
	}

	// 기안 등록 : POST
	@Override
	public int apAddServ(Draft draft, Progress progress, String uploadPath) {
		
		log.debug("ApproveServiceImpl apAddServ draft : " + draft);
		log.debug("ApproveServiceImpl apAddServ progress : " + progress);
		log.debug("ApproveServiceImpl apAddServ uploadPath : " + uploadPath);
		
		draft.setDftFileOri(uploadPath.substring(uploadPath.lastIndexOf("/")));
		draft.setDftFilePath(uploadPath);
		draft.setAprCode(draft.getAprCode());
		draft.setDftDegree(1);
		draft.setDftDate(formatter.format(today));
		draft.setDftFinalState(draft.getDftDegree() + "차미결재대기");

		int result = approveDAO.insertDft(draft);
		
		log.debug("ApproveServiceImpl apAddServ middle :" + result);

		if (result != 0) {
			progress.setProTime(draft.getDftDate());
			progress.setDftCode(draft.getDftCode());
			progress.setProTurn(draft.getDftDegree());
			progress.setProPersonState(false);
			progress.setProState(0);
			progress.setProApproval(draft.getAprApproval1());

			int resultPg = approveDAO.insertPg(progress);
			
			result = resultPg;

			log.debug("ApproveServiceImpl apAddServ result : " + result);

		} else {
			log.debug("ApproveServiceImpl apAddServ result is not null...");
		}
		
		log.debug("ApproveServiceImpl apAddServ final result :" + result);
		
		return result;
	}

	// [총 결재 목록]진행 목록 :GET ---- ######수정######
	@Override
	public List<Draft> pgListServ(int apProgress, int mmCode) {
		
		log.debug("ApproveServiceImpl pgListServ apProgress : " + apProgress);
		log.debug("ApproveServiceImpl pgListServ mmCode : " + mmCode);

		// 전체 리스트
		List<Draft> pgList = new ArrayList<Draft>();
		// 조건별 리스트 목록
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int progress;

		if (apProgress == 1) {// 결재 대기 목록
			progress = 0;

			map.put("progress", progress);
			map.put("mmCode", mmCode);
			
			pgList = approveDAO.selectByHv(map);
			pgList = setName(pgList);
			
			log.debug("ApproveServiceImpl pgListServ pgList : " + pgList);

		} else if (apProgress == 2) {// 결재 반려 목록
			
			progress = 2;
			
			map.put("progress", progress);
			map.put("mmCode", mmCode);
			
			pgList = approveDAO.selectByReCom(map);// 다른 검색 조건
			pgList = setName(pgList);
			
			log.debug("ApproveServiceImpl pgListServ pgList : " + pgList);

		} else if (apProgress == 3) {// 결재 완료 목록
			
			progress = 1;
			
			map.put("progress", progress);
			map.put("mmCode", mmCode);
			
			pgList = approveDAO.selectByReCom(map); // 다른 검색 조건
			pgList = setName(pgList);
			
			log.debug("ApproveServiceImpl pgListServ pgList : " + pgList);
		
		// 전체목록
		} else {
			pgList = approveDAO.selectAllPg(mmCode);
			// 사원정보 셋팅
			pgList = setName(pgList);
			
			log.debug("ApproveServiceImpl pgListServ pgList : " + pgList);
		}
		
		return pgList;
	}

	// 결재 신청[승인/반려] Form
	@Override
	public Draft hvContServ(int dftCode) {
		log.debug("ApproveServiceImpl hvContServ dftCode : " + dftCode);

		Draft draft = new Draft();
		Progress progress = new Progress();

		// -----결재 신청 정보 가져오기
		draft = approveDAO.selectContHv(dftCode);
		
		log.debug("ApproveServiceImpl hvContServ draft : " + draft);

		if (draft != null) {
			log.debug("ApproveServiceImpl hvContServ draft is not null ...");
			
			// -----결재자 정보 가져오기 : progress의 pro_approval 컬럼에서 가져온다
			progress = approveDAO.selectDetailHv(dftCode);
			
			log.debug("ApproveServiceImpl hvContServ progress : " + progress);

			draft.setProApproval(progress.getProApproval());
			draft.setProReason(progress.getProReason());

			draft.setMmName(approveDAO.selectDetailMm(draft.getMmCode()));
			draft.setDpName(approveDAO.selectDetailDp(draft.getMmCode()));
			draft.setPtName(approveDAO.selectDetailPt(draft.getMmCode()));
			draft.setProApprovalName(approveDAO.selectDetailPMn(progress.getProApproval()));
			draft.setpDpName(approveDAO.selectDetailPDp(progress.getProApproval()));
			draft.setpPtName(approveDAO.selectDetailPPt(progress.getProApproval()));

			
			// 각 조건마다 다른 View
			switch (progress.getProState()) {
				case 0:
					// 대기
					draft.setUrl("/approve/ap_haveContent");
					break;
				case 1:
					// 승인
					draft.setUrl("/approve/ap_comContent");
					break;
				case 2:
					// 반려
					draft.setUrl("/approve/ap_returnContent");
					break;
			}
		} else {
			log.debug("ApproveServiceImpl hvContServ draft is null ...");
		}

		return draft;
	}

	// 결재 요청[승인/반려] *** 중복코드 메소드화 ***
	@Override
	public int apProAddServ(Draft draft, Progress progress, int dftCode) {
		log.debug("ApproveServiceImpl apProAddServ draft : " + draft);
		log.debug("ApproveServiceImpl apProAddServ progress : " + progress);
		log.debug("ApproveServiceImpl apProAddServ dftCode : " + dftCode);
		
		int result = 0;
		int totalCount = 0;

		// -----결재자 가져오기
		draft = approveDAO.selectCountHv(dftCode);
		
		log.debug("ApproveServiceImpl apProAddServ draft : " + draft);

		// -----결재 시간/결재여부 setting
		progress.setProRealTime(formatter.format(today));
		progress.setProPersonState(true);

		// 결재자가 1명일 경우
		if (draft.getAprApproval1() != 0 && draft.getAprApproval2() == 0 
										&& draft.getAprApproval3() == 0) {
			totalCount = 1;

			if (progress.getProState() == 1) {// ----- 승인
				// ----- 승인 progress update
				result = approveDAO.modifyPro(progress);

				// ----- 승인 : draft update
				draft.setDftFinalState(draft.getDftDegree() + "차결재최종승인");
			
				result = approveDAO.modifyDft(draft);
			// ----- 반려
			} else if (progress.getProState() == 2) {
				// ----- 반려 : progress update
				result = approveDAO.modifyPro(progress);

				// ----- 반려 : daft update
				draft.setDftFinalState(draft.getDftDegree() + "차결재반려");
			
				result = approveDAO.modifyDft(draft);
				// log.debug("serv dftModfy 반려> test3");
			}
			
		// 결재자가 2명일 경우
		} else if (draft.getAprApproval1() != 0 && draft.getAprApproval2() != 0 
												&& draft.getAprApproval3() == 0) {
			totalCount = 2;
			
			// ----- totalCount와 degree를 비교
			// ----- if(degree < totalCount)
			// ----- dftFinalState/dftdegree/proApproval update
			log.debug("ApproveServiceImpl apProAddServ draft is 2 ...");

			// 2-1 진행중인 결재일 경우
			if (draft.getDftDegree() < totalCount) {
				// ----- 다음 결재를 위해서 미결재로 setting
				progress.setProPersonState(false);
				
				result = approveDAO.modifyPro(progress);

				// ----- 승인
				if (progress.getProState() == 1) {
					draft.setDftDegree(draft.getDftDegree() + 1);
					draft.setDftFinalState(draft.getDftDegree() + "차미결재대기");
					
					result = approveDAO.modifyDft(draft);

					// ----- progress에 proTurn에 draft의 dftDegree[+1] UPDATE
					progress.setProTurn(draft.getDftDegree());
					progress.setProState(0);
					
					// ----- progress 다음 결재자 등록
					switch (progress.getProTurn()) {
						case 2:
							progress.setProApproval(draft.getAprApproval2());
							break;
	
						case 3:
							progress.setProApproval(draft.getAprApproval3());
							break;
					}

					result = approveDAO.modifyProApv(progress);
					
				} else if (progress.getProState() == 2) {// ----- 반려
					draft.setDftFinalState(draft.getDftDegree() + "차결재반려");
	
					result = approveDAO.modifyDft(draft);	
				}
				
				log.debug("ApproveServiceImpl apProAddServ result : " + result);

			// 2-2 최종 결재일 경우
			} else if (draft.getDftDegree() == totalCount) {
				if (progress.getProState() == 1) {// ----- 승인
					// ----- 승인 progress update
					result = approveDAO.modifyPro(progress);

					// ----- 승인 : draft update
					draft.setDftFinalState(draft.getDftDegree() + "차결재최종승인");
					
					result = approveDAO.modifyDft(draft);
				} else if (progress.getProState() == 2) {// ----- 반려
					// ----- 반려 : progress update
					result = approveDAO.modifyPro(progress);

					// ----- 반려 : daft update
					draft.setDftFinalState(draft.getDftDegree() + "차결재반려");
					
					result = approveDAO.modifyDft(draft);
					
				}
				
				log.debug("ApproveServiceImpl apProAddServ result : " + result);
			}

		// 결재자가 3명일 경우
		} else if (draft.getAprApproval1() != 0 && draft.getAprApproval2() != 0 && draft.getAprApproval3() != 0) {
			totalCount = 3;
		
			// totalCount와 degree를 비교 후 최종승인
			// ----- if(degree < totalCount)
			// ----- dftFinalState update
			log.debug("ApproveServiceImpl apProAddServ draft is 3...");

			// ----- 진행중일 경우
			if (draft.getDftDegree() < totalCount) {
				// ----- 다음 결재를 위해서 미결재로 setting
				progress.setProPersonState(false);
				
				result = approveDAO.modifyPro(progress);

				if (progress.getProState() == 1) {// ----- 승인
					draft.setDftDegree(draft.getDftDegree() + 1);
					draft.setDftFinalState(draft.getDftDegree() + "차미결재대기");
				
					result = approveDAO.modifyDft(draft);

					// ----- progress에 proTurn에 draft의 dftDegree[+1] UPDATE
					progress.setProTurn(draft.getDftDegree());
					progress.setProState(0);

					// ----- progress 다음 결재자 등록
					switch (progress.getProTurn()) {
						case 2 :
							progress.setProApproval(draft.getAprApproval2());
							break;
						case 3 :
							progress.setProApproval(draft.getAprApproval3());
							break;
					}

					result = approveDAO.modifyProApv(progress);
					
				} else if (progress.getProState() == 2) {// ----- 반려
					
					draft.setDftFinalState(draft.getDftDegree() + "차결재반려");
					
					result = approveDAO.modifyDft(draft);
				}
				
				log.debug("ApproveServiceImpl apProAddServ result : " + result);

			// ----- 최종 결재일 경우
			} else if (draft.getDftDegree() == totalCount) {
				
				// ----- 승인
				if (progress.getProState() == 1) {
					// ----- 승인 progress update
					result = approveDAO.modifyPro(progress);

					// ----- 승인 : draft update
					draft.setDftFinalState(draft.getDftDegree() + "차결재최종승인");
					
					result = approveDAO.modifyDft(draft);
				} else if (progress.getProState() == 2) {// ----- 반려
					// ----- 반려 : progress update
					result = approveDAO.modifyPro(progress);

					// ----- 반려 : daft update
					draft.setDftFinalState(draft.getDftDegree() + "차결재반려");
					
					result = approveDAO.modifyDft(draft);
				}
				
				log.debug("ApproveServiceImpl apProAddServ result : " + result);
			}

		} else {
			totalCount = 0;
			
			log.debug("serv apProAddServ error> test ");
		}
		
		log.debug("ApproveServiceImpl apProAddServ final result : " + result);

		return result;
	}

	// 임시 목록
	@Override
	public List<Draft> temListServ(int mmCode) {
		
		log.debug("ApproveServiceImpl temListServ mmCode : " + mmCode);
		
		List<Draft> temList = approveDAO.selectAllTem(mmCode);
		
		log.debug("ApproveServiceImpl temListServ temList : " + temList);
		
		for (int i = 0; i < temList.size(); i++) {
			String mmName = approveDAO.selectDetailMm(temList.get(i).getMmCode());
			String dpName = approveDAO.selectDetailDp(temList.get(i).getMmCode());
			String docFileGroup = approveDAO.selectDetailDoc(temList.get(i).getDftCode());
			
			temList.get(i).setMmName(mmName);
			temList.get(i).setDpName(dpName);
			temList.get(i).setDocFileGroup(docFileGroup);
		}
		
		log.debug("ApproveServiceImpl temListServ final temList : " + temList);

		return temList;
	}

	// 임시문서 상세보기
	@Override
	public List<Draft> temContServ(int dftCode) {
		
		log.debug("ApproveServiceImpl temContServ dftCode : " + dftCode);
		
		List<Draft> temContent = approveDAO.selectContTem(dftCode);
		
		log.debug("ApproveServiceImpl temContServ temContent : " + temContent);
		
		String mmName = approveDAO.selectDetailMm(temContent.get(0).getMmCode());

		temContent.get(0).setMmName(mmName);
		
		log.debug("ApproveServiceImpl temContServ temContent.get(0).getMmName : " + temContent.get(0).getMmName());
		
		return temContent;
	}

	// 임시문서 상세보기 (문서값 가져오기)
	@Override
	public String temDocSeleServ(int dftCode) {
		
		log.debug("ApproveServiceImpl temDocSeleServ dftCode : " + dftCode);
		
		return approveDAO.selectDetailDoc(dftCode);
	}

	// 임시 상세보기 (이름값 가져오기)
	@Override
	public Map<String, Object> temContNameServ(List<Draft> draft) {

		log.debug("ApproveServiceImpl temContNameServ draft : " + draft);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("name1", approveDAO.selectDetailMm(draft.get(0).getAprApproval1()));
		map.put("name2", approveDAO.selectDetailMm(draft.get(0).getAprApproval2()));
		map.put("name3", approveDAO.selectDetailMm(draft.get(0).getAprApproval3()));

		log.debug("ApproveServiceImpl temContNameServ map : " + map);
		
		return map;
	}

	// 임시 상세보기 (직급명 가져오기)
	@Override
	public Map<String, Object> temContPtServ(List<Draft> draft) {
		
		log.debug("ApproveServiceImpl temContPtServ draft : " + draft);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pt1", approveDAO.selectDetailPt(draft.get(0).getAprApproval1()));
		map.put("pt2", approveDAO.selectDetailPt(draft.get(0).getAprApproval2()));
		map.put("pt3", approveDAO.selectDetailPt(draft.get(0).getAprApproval3()));
		
		log.debug("ApproveServiceImpl temContPtServ map : " + map);

		return map;
	}

	// 임시 상세보기 (부서명 가져오기)
	@Override
	public Map<String, Object> temContDepServ(List<Draft> draft) {

		log.debug("ApproveServiceImpl temContDepServ draft : " + draft);
		
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("dep1", approveDAO.selectDetailDp(draft.get(0).getAprApproval1()));
		map.put("dep2", approveDAO.selectDetailDp(draft.get(0).getAprApproval2()));
		map.put("dep3", approveDAO.selectDetailDp(draft.get(0).getAprApproval3()));

		log.debug("ApproveServiceImpl temContDepServ map : " + map);
		
		return map;
	}

	// 문서 양식 등록
	@Override
	public int apDocAddServ(Document document, String uploadPath) {
		
		log.debug("ApproveServiceImpl apDocAddServ document : " + document + ", uploadPath : " + uploadPath);

		int result = 0;

		/* 파일 업로드시에 파일분류/이름/경로 저장 */
		document.setDocFileGroup(document.getDocFileGroup());
		document.setDocFileOri(uploadPath.substring(uploadPath.lastIndexOf("_") + 1, uploadPath.lastIndexOf(".")));
		document.setDocFilePath(uploadPath);

		result = approveDAO.insertDoc(document);
		
		log.debug("ApproveServiceImpl apDocAddServ result : " + result);

		return result;
	}

	// 문서 보관함 양식 insert 후select값 가져오기
	@Override
	public List<Document> apDocSelServ(Document document) {
		
		log.debug("ApproveServiceImpl apDocSelServ document : " + document);
		
		return approveDAO.selectListByDoc(document);
	}

	// 문서 보관함 목록
	@Override
	public List<Document> docListServ() {
		
		return approveDAO.selectAllDoc();
	}

	// 문서 보관함 : 다운로드
	@Override
	public Document apDownDocServ(int docCode) {
		
		log.debug("ApproveServiceImpl apDownDocServ docCode : " + docCode);
		
		return approveDAO.selectListByDoc(docCode);
	}

	// 결재 문서 : 첨부파일 다운로드
	@Override
	public Draft apDownDftServ(int dftCode) {
		
		log.debug("ApproveServiceImpl apDownDftServ dftCode : " + dftCode);
		
		return approveDAO.selectContHv(dftCode);
	}

	// 목록 검색 : 결재 목록
	@Override
	public List<Draft> apSearchServ(Draft draft, String docFileGroup) {

		log.debug("ApproveServiceImpl apSearchServ draft : " + draft + ", docFileGroup : " + docFileGroup);
		
		List<Draft> resultDft = new ArrayList<Draft>();
		
		draft.setDocFileGroup(docFileGroup); // 문서분류세팅

		resultDft = approveDAO.selectBySearchGroup(draft);
		resultDft = setName(resultDft); // 사원이름 셋팅
		
		log.debug("ApproveServiceImpl apSearchServ resultDft : " + resultDft);

		return resultDft;
	}

	// 목록 검색 : 문서 양식함
	@Override
	public List<Document> apSearchDocServ(String docFileGroup) {
		
		log.debug("ApproveServiceImpl apSearchDocServ docFileGroup : " + docFileGroup);
		
		return approveDAO.selectBySearchDoc(docFileGroup);
	}

	@Override
	public List<Draft> apSearchDftServ(Draft draft) {
		
		log.debug("ApproveServiceImpl apSearchDftServ draft : " + draft);
		
		return approveDAO.selectBySearchTem(draft);
	}
}