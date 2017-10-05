package com.shsxt.danmu.model;

import com.shsxt.danmu.base.BaseModel;

import java.beans.Transient;
import java.util.List;

/**
 * 文章实体
 */
@SuppressWarnings("serial")
public class Article extends BaseModel {
	
	// 标题
	private String title; 
	// 描述
	private String content;
	// 视频
	private String video;
	// 用户id
	private Integer userId;
	// 点击数
	private Integer hits;
	// 标签
	private String tags;
	// 作者
	private String author;

	private String month; // 几月

	private Integer day; // 几号

	private List<String> tagList; // 标签

	private String updateDateStr; // 格式化日期

	public String getUpdateDateStr() {
		return updateDateStr;
	}

	public void setUpdateDateStr(String updateDateStr) {
		this.updateDateStr = updateDateStr;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	
	public Integer getHits() {
		return hits;
	}

	public void setHits(Integer hits) {
		this.hits = hits;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public List<String> getTagList() {
		return tagList;
	}

	public void setTagList(List<String> tagList) {
		this.tagList = tagList;
	}
}
