package com.kos.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kos.member.service.memberService;

@Controller
public class memberController {
	
	@Autowired
	memberService service;
	
	@RequestMapping("/member/pwd")
	public String memberPwd() throws Exception {
		return "/member/member_pwd";
	}
	
	@RequestMapping("/member/point")
	public String memberPoint() throws Exception {
		return "/member/member_point";
	}

}
