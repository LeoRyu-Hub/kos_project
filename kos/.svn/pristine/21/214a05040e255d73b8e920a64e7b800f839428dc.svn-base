package com.kos.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.kos.vo.main.mainInfoVO;

@Repository
public interface mainDao {
	
	public List<mainInfoVO> selectMenuList(mainInfoVO vo) throws Exception;
	public int selectTotalMenuPageCnt(mainInfoVO vo) throws Exception;
	public mainInfoVO selectMenuInfo(@ModelAttribute mainInfoVO vo) throws Exception;
	public mainInfoVO selectMemberInfo(@ModelAttribute mainInfoVO vo) throws Exception;
	public int insertMember(@ModelAttribute mainInfoVO vo) throws Exception;
	public int insertPoint(@ModelAttribute mainInfoVO vo) throws Exception;
	public int useMemberPoint(@ModelAttribute mainInfoVO vo) throws Exception;
	public int usePoint(@ModelAttribute mainInfoVO vo) throws Exception;
	public int earnMemberPoint(@ModelAttribute mainInfoVO vo) throws Exception;
	public int earnPoint(@ModelAttribute mainInfoVO vo) throws Exception;
	public int insertOrder(@ModelAttribute mainInfoVO vo) throws Exception;
	public String createNewOrderNo(@ModelAttribute mainInfoVO vo) throws Exception;
	public int insertOrderMenu(@ModelAttribute mainInfoVO vo) throws Exception;
	
}
