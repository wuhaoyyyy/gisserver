package com.who.gisserver.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.who.gisserver.model.Userinfo;
import com.who.gisserver.service.LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
    @RequestMapping(value="login/info/{info}")
    public ModelAndView login(HttpServletRequest request,HttpServletResponse response,@ModelAttribute("command") Userinfo command, @PathVariable String info ){
        String username = command.getUsername();
        ModelAndView mv = new ModelAndView("/index","aa","LOGIN SUCCESS, " + username+"  参数1："+info);
        return mv;
    }
    
    @RequestMapping(value="login.do")
    public ModelAndView login2(HttpServletRequest request,HttpServletResponse response,@ModelAttribute("user") Userinfo user){
        String username = user.getUsername();
        ModelAndView mv = new ModelAndView("/index","aa","LOGIN SUCCESS, " + username);
        if(loginService.login(user))  
        	return mv;
        else return null;
    }
    
    @RequestMapping(value="login3",method=RequestMethod.POST)
    public String login3(@ModelAttribute("user") Userinfo user,ModelMap map)
    {
    	if(loginService.login(user)){
    		map.addAttribute("11","11");
    		map.addAttribute("user",user);
    		map.addAttribute("menus",loginService.getAllMenu());
    		return "/home";
    	}
    	else return "redirect:login4";
    }
    @RequestMapping(value="login4")
    public String login4()
    {
		return "/login";
    }
    
}