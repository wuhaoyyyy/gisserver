package com.who.gisserver.listener;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.esri.arcgis.server.ServerConnection;
import com.esri.arcgis.system.ServerInitializer;

public class AppListener implements ServletContextListener {

	public void contextInitialized(ServletContextEvent sce) {
	   try {
		    ServletContext sc = sce.getServletContext();
		    Enumeration parameters = sc.getInitParameterNames();
		    while(parameters.hasMoreElements()) {
			     String parameter = (String)parameters.nextElement();
			     sc.setAttribute(parameter, sc.getInitParameter(parameter));
		    }
		  
		    ServerConnection serverConn;
		    ServerInitializer serverInitializer=new ServerInitializer();
			serverInitializer.initializeServer(sc.getAttribute("arcgis_ip").toString(),sc.getAttribute("arcgis_username").toString(),sc.getAttribute("arcgis_password").toString());
			serverConn=new ServerConnection();
			serverConn.connect(sc.getAttribute("arcgis_ip").toString());
			sc.setAttribute("GISSERVER",serverConn);
	   } 
	   catch(Exception e) {
	      System.out.println("Listener load error:" + e.getMessage());
	   }
	}

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}
}