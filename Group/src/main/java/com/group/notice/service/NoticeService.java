package com.group.notice.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.group.notice.vo.FileVO;
import com.group.board.vo.SearchVO;
import com.group.notice.vo.NoticeVO;


@Service
public class NoticeService {
	 @Autowired
	    private SqlSessionTemplate sqlSession;    
	    @Autowired
	    private DataSourceTransactionManager txManager;
	        
	    public Integer selectNoticeCount(SearchVO param) {
	        return sqlSession.selectOne("selectNoticeCount", param);
	    }
	    
	    public List<?> selectNoticeList(SearchVO param) {
	        return sqlSession.selectList("selectNoticeList", param);
	    }
	    
	    public List<?> selectNoticeList2() {
	        return sqlSession.selectList("selectNoticeList2");
	    }
	    public List<?> selectNoticeList3() {
	        return sqlSession.selectList("selectNoticeList3");
	    }
	    
	    /**
	     * 글 저장.
	     */ 
	    public void insertNotice(NoticeVO param, List<FileVO> filelist, String[] filenum) {
	        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
	        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
	        TransactionStatus status = txManager.getTransaction(def);
	        
	        try {
	            if (param.getNoticenum() == null || "".equals(param.getNoticenum())) {
	                 sqlSession.insert("insertNotice", param);
	            } else {
	                sqlSession.update("updateNotice", param);
	            }
	            
	            if (filenum != null) {
	                HashMap<String, String[]> fparam = new HashMap<String, String[]>();
	                fparam.put("filenum", filenum);
	                sqlSession.insert("deleteNoticeFile", fparam);
	            }
	            
	            for (FileVO f : filelist) {
	                f.setParentPK(param.getNoticenum());
	                sqlSession.insert("insertNoticeFile", f);
	            }
	            txManager.commit(status);
	        } catch (TransactionException ex) {
	            txManager.rollback(status);
	            System.out.println("데이터 저장 오류: " + ex.toString());
	        }            
	    }
	 
	    public NoticeVO selectNoticeOne(String param) {
	        return sqlSession.selectOne("selectNoticeOne", param);
	    }
	    
	    public void updateNoticeRead(String param) {
	        sqlSession.insert("updateNoticeRead", param);
	    }
	    
	    public void deleteNoticeOne(String param) {
	        sqlSession.delete("deleteNoticeOne", param);
	    }
	    
	    public List<?> selectNoticeFileList(String param) {
	        return sqlSession.selectList("selectNoticeFileList", param);
	    }
	    
	    
	    /**
	     * 댓글. 
	     */
	   

}
