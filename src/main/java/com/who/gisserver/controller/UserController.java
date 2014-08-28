package com.who.gisserver.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.who.gisserver.common.Page;
import com.who.gisserver.service.SystemService;
import com.who.gisserver.model.Userinfo;
@Controller
public class UserController {
	

	@Autowired
	private SystemService systemService;
	@RequestMapping(value="/user/{info}")
    public ModelAndView service(HttpServletRequest request,HttpServletResponse response, @PathVariable String info,ModelMap model){
		ModelAndView mv = new ModelAndView();
        switch(User.getUser(info)){
	        case manager:
	        	Page<Userinfo> page = systemService.findUser(new Page<Userinfo>(request, response)); 
	            model.addAttribute("page", page);
	        	mv=new ModelAndView("/pages/user/manager");
	        	break;
	        case privilige:
	        	mv=new ModelAndView("/pages/user/privilige");
	        	break;
	        case syswatch:
	        	mv=new ModelAndView("/pages/user/syswatch");
	        	break;
        }
        return mv;
    }
	
	public enum User {  
		manager,privilige,syswatch;
		
	     public static User getUser(String animal){  
	        return valueOf(animal.toLowerCase());  
	     }      
	 }
	
}
