package com.who.gisserver.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

// Generated 2014-4-29 21:52:31 by Hibernate Tools 3.4.0.CR1

/**
 * Menu generated by hbm2java
 */

@Entity
@Table(name = "menu")
@DynamicInsert @DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Menu implements java.io.Serializable {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "menuid", nullable = false)
	private int menuid;
	private String menuname;
	private String menutype;
	private Integer parentid;
	private String icon;
	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Menu() {
	}

	public Menu(int menuid, String menuname, String menutype) {
		this.menuid = menuid;
		this.menuname = menuname;
		this.menutype = menutype;
	}

	public Menu(int menuid, String menuname, String menutype, Integer parentid) {
		this.menuid = menuid;
		this.menuname = menuname;
		this.menutype = menutype;
		this.parentid = parentid;
	}

	public int getMenuid() {
		return this.menuid;
	}

	public void setMenuid(int menuid) {
		this.menuid = menuid;
	}

	public String getMenuname() {
		return this.menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public String getMenutype() {
		return this.menutype;
	}

	public void setMenutype(String menutype) {
		this.menutype = menutype;
	}

	public Integer getParentid() {
		return this.parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

}
