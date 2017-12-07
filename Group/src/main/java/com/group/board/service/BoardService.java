package com.group.board.service;

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

import com.group.board.vo.BoardReplyVO;
import com.group.board.vo.BoardVO;
import com.group.board.vo.FileVO;
import com.group.board.vo.SearchVO;

@Service
public class BoardService {

    @Autowired
    private SqlSessionTemplate sqlSession;    
    @Autowired
    private DataSourceTransactionManager txManager;
        
    public Integer selectBoardCount(SearchVO param) {
        return sqlSession.selectOne("selectBoardCount", param);
    }
    
    public List<?> selectBoardList(SearchVO param) {
        return sqlSession.selectList("selectBoardList", param);
    }
    //메인뷰 부서게시판 리스트생성
    public List<?> selectBoardList2(String departname) {
        return sqlSession.selectList("selectBoardList2", departname);
    }
    
    /**
     * 글 저장.
     */ 
    public void insertBoard(BoardVO param, List<FileVO> filelist, String[] filenum) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        
        try {
            if (param.getBoardnum() == null || "".equals(param.getBoardnum())) {
                 sqlSession.insert("insertBoard", param);
            } else {
                sqlSession.update("updateBoard", param);
            }
            
            if (filenum != null) {
                HashMap<String, String[]> fparam = new HashMap<String, String[]>();
                fparam.put("filenum", filenum);
                sqlSession.insert("deleteBoardFile", fparam);
            }
            
            for (FileVO f : filelist) {
                f.setParentPK(param.getBoardnum());
                sqlSession.insert("insertBoardFile", f);
            }
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            System.out.println("데이터 저장 오류: " + ex.toString());
        }            
    }
 
    public BoardVO selectBoardOne(String param) {
        return sqlSession.selectOne("selectBoardOne", param);
    }
    
    public void updateBoardRead(String param) {
        sqlSession.insert("updateBoardRead", param);
    }
    
    public void deleteBoardOne(String param) {
        sqlSession.delete("deleteBoardOne", param);
    }
    
    public List<?> selectBoardFileList(String param) {
        return sqlSession.selectList("selectBoardFileList", param);
    }
    
    
    /**
     * 댓글. 
     */
    public List<?> selectBoardReplyList(String param) {
        return sqlSession.selectList("selectBoardReplyList", param);
    }
     
    public void insertBoardReply(BoardReplyVO param) {
        if (param.getRenum()==null || "".equals(param.getRenum())) {
            sqlSession.insert("insertBoardReply", param);
        } else {
            sqlSession.insert("updateBoardReply", param);
        }
    }   
    
    public void deleteBoardReply(String param) {
        sqlSession.delete("deleteBoardReply", param);
    }    
}
