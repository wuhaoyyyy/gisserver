package com.who.gisserver.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.who.gisserver.dao.UserinfoDao;
import com.who.gisserver.model.Userinfo;
import com.who.gisserver.service.UserService;
@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserinfoDao userinfoDao;
	
	public List<Userinfo> getAllUser() {
		// TODO Auto-generated method stub
		return userinfoDao.getAllUser();
	}

}
