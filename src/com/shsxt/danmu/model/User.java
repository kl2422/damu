package com.shsxt.danmu.model;

import com.shsxt.danmu.base.BaseModel;

/**
 * 用户实体
 */
@SuppressWarnings("serial")
public class User extends BaseModel {
	
	// 用户名
	private String userName;
	// 用户密码
	private String userPwd;
	// 邮箱
	private String email;
	// 头像
	private String headImage;
	// 心情
	private String mood;
	// 博客名称
	private String blogName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getHeadImage() {
		return headImage;
	}

	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}

	public String getMood() {
		return mood;
	}

	public void setMood(String mood) {
		this.mood = mood;
	}

	public String getBlogName() {
		return blogName;
	}

	public void setBlogName(String blogName) {
		this.blogName = blogName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
