package com.kos.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kos.menu.service.menuService;

@Controller
public class menuController {
	
	@Autowired
	menuService service;
	
	@RequestMapping("/menu/detail")
	public String menuDetail() throws Exception {
		return "/menu/menu_detail";
	}

}
