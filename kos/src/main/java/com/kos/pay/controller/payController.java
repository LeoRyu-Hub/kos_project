package com.kos.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kos.pay.service.payService;

@Controller
public class payController {
	
	@Autowired
	payService service;
	
	@RequestMapping("/pay/creditcard")
	public String menuDetail() throws Exception {
		return "/pay/pay_creditcard";
	}
	
	@RequestMapping("/pay/end")
	public String payEnd() throws Exception {
		return "/pay/pay_end";
	}

}
