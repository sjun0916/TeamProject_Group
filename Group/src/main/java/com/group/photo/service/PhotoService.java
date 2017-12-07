package com.group.photo.service;

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

import com.group.board.vo.FileVO;
import com.group.board.vo.SearchVO;
import com.group.photo.vo.PhotoVO;


@Service
public class PhotoService {
	 @Autowired
	    private SqlSessionTemplate sqlSession;    
	    @Autowired
	    private DataSourceTransactionManager txManager;
	        
	    public Integer selectPhotoCount(SearchVO param) {
	        return sqlSession.selectOne("selectPhotoCount", param);
	    }
	    
	    public List<?> selectPhotoList(SearchVO param) {
	        return sqlSession.selectList("selectPhotoList", param);
	    }
	    //메인 뷰 사진첩 리스트 생성
	    public List<?> selectPhotoList2() {
	        return sqlSession.selectList("selectPhotoList2");
	    }
	    

	    
	    /**
	     * 글 저장.
	     */ 
	    public void insertPhoto(PhotoVO param, List<FileVO> filelist, String[] filenum) {
	        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
	        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
	        TransactionStatus status = txManager.getTransaction(def);
	        
	        try {
	            if (param.getPhotonum() == null || "".equals(param.getPhotonum())) {
	                 sqlSession.insert("insertPhoto", param);
	            } else {
	                sqlSession.update("updatePhoto", param);
	            }
	            
	            if (filenum != null) {
	                HashMap<String, String[]> fparam = new HashMap<String, String[]>();
	                fparam.put("photofilenum", filenum);
	                sqlSession.insert("deletePhotoFile", fparam);
	            }
	            
	            for (FileVO f : filelist) {
	                f.setParentPK(param.getPhotonum());
	                sqlSession.insert("insertPhotoFile", f);
	            }
	            txManager.commit(status);
	        } catch (TransactionException ex) {
	            txManager.rollback(status);
	            System.out.println("데이터 저장 오류: " + ex.toString());
	        }            
	    }
	 
	    public PhotoVO selectPhotoOne(String param) {
	        return sqlSession.selectOne("selectPhotoOne", param);
	    }
	    

	    public void deletePhotoOne(String param) {
	        sqlSession.delete("deletePhotoOne", param);
	    }
	    
	    public List<?> selectPhotoFileList(String param) {
	        return sqlSession.selectList("selectPhotoFileList", param);
	    }
	    
	    
	    /**
	     * 댓글. 
	     */
	   

}
