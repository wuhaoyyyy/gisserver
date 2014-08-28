package com.who.gisserver.common;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * cookie工具�?
 * @author ThinkGem
 *
 */
public class CookieUtils {

	/**
	 * 获得指定Cookie的�?
	 * @param request 请求对象
	 * @param response 响应对象
	 * @param name 名字
	 * @param isRemove 是否移除
	 * @return �?
	 */
	public static String getCookie(HttpServletRequest request, HttpServletResponse response, String name, boolean isRemove) {
		String value = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(name)) {
					try {
						value = URLDecoder.decode(cookie.getValue(), "utf-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					if (isRemove) {
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
			}
		}
		return value;
	}
	
	/**
	 * 获得指定Cookie的�?，并删除�?
	 * @param name 名称
	 * @return �?
	 */
	public static String getCookie(HttpServletRequest request, HttpServletResponse response, String name) {
		return getCookie(request, response, name, true);
	}
	/**
	 * 获得指定Cookie的�?
	 * @param name 名称
	 * @return �?
	 */
	public static String getCookie(HttpServletRequest request, String name) {
		return getCookie(request, null, name, false);
	}
	
	/**
	 * 设置 Cookie
	 * @param name 名称
	 * @param value �?
	 * @param maxAge 生存时间（单位秒�?
	 */
	public static void setCookie(HttpServletResponse response, String name, String value, int maxAge) {
		Cookie cookie = new Cookie(name, null);
        if(StringUtils.isNotBlank(SpringContextHolder.getApplicationContext().getApplicationName())){
            cookie.setPath(SpringContextHolder.getApplicationContext().getApplicationName());
        }else{
            cookie.setPath("/");
        }
		cookie.setMaxAge(maxAge);
		try {
			cookie.setValue(URLEncoder.encode(value, "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.addCookie(cookie);
	}
	
	/**
	 * 设置 Cookie（生成时间为1天）
	 * @param name 名称
	 * @param value �?
	 */
	public static void setCookie(HttpServletResponse response, String name, String value) {
		setCookie(response, name, value, 60*60*24);
	}

}