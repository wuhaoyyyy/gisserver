package com.who.gisserver.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.who.gisserver.common.Page;
import com.who.gisserver.model.Userinfo;

@Repository
public class UserinfoDao extends BaseDao<Userinfo>{
	public UserinfoDao() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean exists(Userinfo user)
	{
		String sql="select u from Userinfo u where u.username='"+user.getUsername()+"' and u.userpsw='"+user.getUserpsw()+"'"; 
		return exists(sql);
	}
	public List<Userinfo> getAllUser()
	{
		String sql="select u from Userinfo u "; 
		return find(sql);
	}
	
	
	
	
}
