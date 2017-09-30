package com.shsxt.danmu.model;

import com.shsxt.danmu.base.BaseModel;

/**
 * 名言名句
 *
 */
@SuppressWarnings("serial")
public class Wisdom extends BaseModel {
	
	private String text; // 名句内容
	private String author; // 作者
	private String userId; // 用户Id
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
