package com.who.gisserver.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.esri.arcgis.server.ServerConnection;
import com.who.gisserver.model.ArcgisService;
import com.who.gisserver.service.GisServerService;

@Controller
public class ServiceController {
	
	@Autowired
	private GisServerService gisServerService;
	
	@RequestMapping(value="/service/{info}")
    public ModelAndView service(HttpServletRequest request,HttpServletResponse response, @PathVariable String info,ModelMap model){
		ServerConnection serverConn=(ServerConnection)request.getSession().getServletContext().getAttribute("GISSERVER");
		
		ModelAndView mv = new ModelAndView();
        switch(Service.getService(info)){
	        case explore:
	        	mv=new ModelAndView("/pages/services/explore");
	        	break;
	        case add:
	        	mv=new ModelAndView("/pages/services/add");
	        	break;
	        case manager:
	        	mv=new ModelAndView("/pages/services/manager");
	        	break;
        }
        ArrayList<ArcgisService> agsservices=gisServerService.getServerNameList(serverConn);
        model.addAttribute("agsservices", agsservices);
        return mv;
    }
	@RequestMapping(value="/serviceoperation/{name}/{type}/{operation}")
    public ModelAndView serviceoperation(HttpServletRequest request,HttpServletResponse response, @PathVariable String name, @PathVariable String type, @PathVariable String operation,ModelMap model){
		ServerConnection serverConn=(ServerConnection)request.getSession().getServletContext().getAttribute("GISSERVER");
		
		ModelAndView mv = new ModelAndView("/pages/services/explore");
		gisServerService.serviceoperation(serverConn, name, type,operation);
        ArrayList<ArcgisService> agsservices=gisServerService.getServerNameList(serverConn);
        model.addAttribute("agsservices", agsservices);
        return mv;
    }
	public enum Service {  
		explore,add,manager;
		
	     public static Service getService(String animal){  
	        return valueOf(animal.toLowerCase());  
	     }      
	 }

}
