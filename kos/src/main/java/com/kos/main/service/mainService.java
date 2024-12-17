package com.kos.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.kos.main.dao.mainDao;
import com.kos.vo.main.mainInfoVO;

@Service
public class mainService {

	@Autowired
	mainDao dao;

	public List<mainInfoVO> selectMenuList(mainInfoVO vo) throws Exception {
		return dao.selectMenuList(vo);
	}

	public int selectTotalMenuPageCnt(mainInfoVO vo) throws Exception {
		return dao.selectTotalMenuPageCnt(vo);
	}

	public mainInfoVO selectMenuInfo(@ModelAttribute mainInfoVO vo) throws Exception {
		return dao.selectMenuInfo(vo);
	}

	public mainInfoVO selectMemberInfo(@ModelAttribute mainInfoVO vo) throws Exception {
		return dao.selectMemberInfo(vo);
	}
	
	public int insertMember(@ModelAttribute mainInfoVO vo) throws Exception{		
		return dao.insertMember(vo);
	}
	
	public int insertPoint(@ModelAttribute mainInfoVO vo) throws Exception{		
		return dao.insertPoint(vo);
	}
	
	public int useMemberPoint(@ModelAttribute mainInfoVO vo) throws Exception{		
		return dao.useMemberPoint(vo);
	}
	
	public int usePoint(@ModelAttribute mainInfoVO vo) throws Exception{		
		return dao.usePoint(vo);
	}
	
	public int earnMemberPoint(@ModelAttribute mainInfoVO vo) throws Exception{		
		return dao.earnMemberPoint(vo);
	}
	
	public int earnPoint(@ModelAttribute mainInfoVO vo) throws Exception{		
		return dao.earnPoint(vo);
	}
	
	public int insertOrder(@ModelAttribute mainInfoVO vo) throws Exception{		
		return dao.insertOrder(vo);
	}
	
	public String createNewOrderNo(@ModelAttribute mainInfoVO vo) throws Exception{		
		return dao.createNewOrderNo(vo);
	}
	
	public int insertOrderMenu(@ModelAttribute mainInfoVO vo) throws Exception {
		return dao.insertOrderMenu(vo);
	}
}
