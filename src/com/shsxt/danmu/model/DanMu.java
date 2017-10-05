package com.shsxt.danmu.model;

import com.shsxt.danmu.base.BaseModel;

/**
 * 弹幕内容实体
 */
@SuppressWarnings("serial")
public class DanMu extends BaseModel {
	
	// 弹幕内容 是json数据
	private String danmu;
	// 文章id
	private Integer articleId;


	public String getDanmu() {
		return danmu;
	}

	public void setDanmu(String danmu) {
		this.danmu = danmu;
	}

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

}
