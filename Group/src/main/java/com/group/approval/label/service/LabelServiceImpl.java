package com.group.approval.label.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.group.approval.label.dao.LabelDao;
import com.group.approval.label.vo.LabelVo;


@Service("labelService")
public class LabelServiceImpl implements LabelService {
	@Resource(name="labelDao")
	LabelDao dao;
	
	@Override
	public List<LabelVo> selectLabel(String id) {
		List<LabelVo> list = null;
		try {
			list = dao.selectLabel(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertlabel(LabelVo vo) {

		try {
			dao.insertlabel(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public int selectone(int num) {
		// TODO Auto-generated method stub
		int a = 0;
		try {
		a =dao.selectone(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public List<LabelVo> highlabel(String id) {
		List<LabelVo> list = null;
		try {
			list = dao.highlabel(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public void insertlow(LabelVo vo) {
		try {
			dao.insertlow(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<LabelVo> lowinfo(int num) {
		List<LabelVo> list = null;
		try {
			list = dao.lowinfo(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void modifylabel(LabelVo vo) {
		// TODO Auto-generated method stub
		try {
			dao.modifylabel(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public LabelVo viewdetail(int num) {
		LabelVo vo = null;
		try {
			vo = dao.viewdetail(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public void deletelabel(int num) {
		// TODO Auto-generated method stub
		try {
			dao.deletelabel(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public int highModify(int gnum) {
		// TODO Auto-generated method stub
		int a = 0;
		
		try {
			a= dao.highModify(gnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public LabelVo lowinfo2(int gnum) {
		LabelVo vo = null;
		
		try {
			vo = dao.lowinfo2(gnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public void deletelabelGnum(int gnum) {
		// TODO Auto-generated method stub
		try {
			dao.deletelabelGnum(gnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void updatedocu(LabelVo vo) {
		// TODO Auto-generated method stub
		try {
			dao.updatedocu(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<LabelVo> labelnumlist() {
		List<LabelVo> list = null;
				
				try {
					list = dao.labelnumlist();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
		return list;
	}

	
	

}
