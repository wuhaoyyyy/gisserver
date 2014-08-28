package com.who.gisserver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.who.gisserver.dao.MenuDao;
import com.who.gisserver.model.Menu;
import com.who.gisserver.model.Userinfo;
import com.who.gisserver.service.LoginService;

@Controller
public class MenuController {
	
	@Autowired
	private LoginService loginService;
	public MenuController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("getMenu")
	public List<Menu> getMenuByUser(ModelMap map)
	{
		//Userinfo user=(Userinfo) map.get("user");
//		if(user.getUsername()=="admin")
//		{
//			map.put("menu", loginService.getAllMenu());
			return loginService.getAllMenu();
//		}
//		else return null;
	}

}
