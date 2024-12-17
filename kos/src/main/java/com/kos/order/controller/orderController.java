package com.kos.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kos.order.service.orderService;

@Controller
public class orderController {
	
	@Autowired
	orderService service;
	
	@RequestMapping("/order/before")
	public String before() throws Exception {
		return "/order/order_before";
	}
	
	@RequestMapping("/order/list")
	public String orderList() throws Exception {
		return "/order/order_list";
	}
	
	@RequestMapping("/order/pay")
	public String pay() throws Exception {
		return "/order/order_pay";
	}


}
