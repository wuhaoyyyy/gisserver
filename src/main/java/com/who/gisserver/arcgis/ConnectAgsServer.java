package com.who.gisserver.arcgis;

import java.io.IOException;
import java.util.ArrayList;

import com.esri.arcgis.interop.AutomationException;
import com.esri.arcgis.server.IEnumServerObjectConfiguration;
import com.esri.arcgis.server.IServerObjectAdmin;
import com.esri.arcgis.server.IServerObjectConfiguration;
import com.esri.arcgis.server.IServerObjectManager;
import com.esri.arcgis.server.ServerConnection;
import com.esri.arcgis.system.ServerInitializer;

public class ConnectAgsServer {
	
	ServerConnection serverConn;
	public ConnectAgsServer(String ip,String user,String psw) {
		try {
			ServerInitializer serverInitializer=new ServerInitializer();
			serverInitializer.initializeServer(ip,user,psw);
			serverConn=new ServerConnection();
			serverConn.connect(ip);

		} catch (AutomationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<String> getServerNameList()
	{
		ArrayList<String> serverNames=new ArrayList<String>();
		try {
			IServerObjectManager som=serverConn.getServerObjectManager();
			IServerObjectAdmin serverAdmin= serverConn.getServerObjectAdmin();
			IEnumServerObjectConfiguration enumServerObjectConfiguration=serverAdmin.getConfigurations();
			IServerObjectConfiguration serverObjectConfiguration=enumServerObjectConfiguration.next();
			String serverName;
			while(serverObjectConfiguration!=null)
			{
				serverName= serverObjectConfiguration.getName();
				serverNames.add(serverName);
				serverObjectConfiguration=enumServerObjectConfiguration.next();
			}
			
		} catch (AutomationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return serverNames;
	}

	
	
}
