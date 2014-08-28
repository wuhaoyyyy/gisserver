package com.who.gisserver.service;

import java.util.List;

import com.who.gisserver.dao.MenuDao;
import com.who.gisserver.dao.UserinfoDao;
import com.who.gisserver.model.Menu;
import com.who.gisserver.model.Userinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class LoginService {
	
	/*private User user;
	public LoginService(User user){
		this.user=user;
	}*/
	@Autowired
	private UserinfoDao userinfoDao;
	@Autowired
	private MenuDao menuDao;
	
	public boolean login(Userinfo userinfo){
		return userinfoDao.exists(userinfo);
	}

	public List<Menu> getAllMenu(){
		return menuDao.getAllMenu();
	}
}
