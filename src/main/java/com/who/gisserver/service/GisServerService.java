package com.who.gisserver.service;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.esri.arcgis.interop.AutomationException;
import com.esri.arcgis.server.IEnumServerObjectConfiguration;
import com.esri.arcgis.server.IServerObjectAdmin;
import com.esri.arcgis.server.IServerObjectConfiguration;
import com.esri.arcgis.server.IServerObjectManager;
import com.esri.arcgis.server.ServerConnection;
import com.esri.arcgis.server.esriConfigurationStatus;
import com.who.gisserver.model.ArcgisService;

@Service
@Transactional
public class GisServerService {
	
	public void getGisService(){
		
	}
	public ArrayList<ArcgisService> getServerNameList(ServerConnection serverConn)
	{
		ArrayList<ArcgisService> services=new ArrayList<ArcgisService>();
		try {
			IServerObjectManager som=serverConn.getServerObjectManager();
			IServerObjectAdmin serverAdmin= serverConn.getServerObjectAdmin();
			IEnumServerObjectConfiguration enumServerObjectConfiguration=serverAdmin.getConfigurations();
			IServerObjectConfiguration serverObjectConfiguration=enumServerObjectConfiguration.next();
			while(serverObjectConfiguration!=null)
			{
				ArcgisService as=new ArcgisService();
				String name=serverObjectConfiguration.getName();
				String type=serverObjectConfiguration.getTypeName();
				if(serverAdmin.getConfigurationStatus(name,type).getStatus()==esriConfigurationStatus.esriCSStarted){
					as.setStatus("已启动");
				}
				else if(serverAdmin.getConfigurationStatus(name,type).getStatus()==esriConfigurationStatus.esriCSStopped){
					as.setStatus("已停止ֹ");
				}
				as.setName(name);
				as.setType(type);
				services.add(as);
				serverObjectConfiguration=enumServerObjectConfiguration.next();
			}
			
		} catch (AutomationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return services;
	}
	
	public void serviceoperation(ServerConnection serverConn,String name,String type,String operation)
	{
		try {
			IServerObjectManager som=serverConn.getServerObjectManager();
			IServerObjectAdmin serverAdmin= serverConn.getServerObjectAdmin();
			if(operation.equals("start")){
				serverAdmin.startConfiguration(name, type);
			}
			else if(operation.equals("stop")){
				serverAdmin.stopConfiguration(name, type);
			}
		} catch (AutomationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
