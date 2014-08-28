package com.who.gisserver.service;

import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.who.gisserver.dao.UserinfoDao;
import com.who.gisserver.dao.UserroleDao;
import com.who.gisserver.dao.MenuDao;
import com.who.gisserver.model.Userinfo;
import com.who.gisserver.common.Page;
/**
 * 系统管理，安全相关实体的管理�?包括用户、角色�?菜单.
 * @author ThinkGem
 */
@Service
@Transactional(readOnly = true)
public class SystemService  extends BaseService {

	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	public static final int SALT_SIZE = 8;
	
	@Autowired
	private UserinfoDao userDao;
	@Autowired
	private UserroleDao roleDao;
	@Autowired
	private MenuDao menuDao;
	//-- User Service --//
	
	public Page<Userinfo> findUser(Page<Userinfo> page) {
		DetachedCriteria dc = userDao.createDetachedCriteria();

		dc.add(Restrictions.isNotNull("username"));

			dc.addOrder(Order.asc("username"));
		return userDao.find(page, dc);
	}
	
	

}
