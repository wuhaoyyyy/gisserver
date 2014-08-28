package com.who.gisserver.dao;

// Generated 2014-4-29 22:35:46 by Hibernate Tools 3.4.0.CR1
import java.util.List;

import org.springframework.stereotype.Repository;

import com.who.gisserver.model.*;


@Repository
public class MenuDao extends BaseDao<Menu>{
	public MenuDao() {
		// TODO Auto-generated constructor stub
	}
	public List<Menu> getAllMenu() {
		String sql="select m from Menu m";
		return find(sql);
	}
}
