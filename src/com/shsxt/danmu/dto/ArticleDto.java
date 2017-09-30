package com.shsxt.danmu.dto;

import com.shsxt.danmu.constant.Constant;

public class ArticleDto {
	
	private String searchKey;
	private String tags;
	private Integer userId;
	
	private int page;
	private int pageSize;
	private String sort; // id.desc
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public int getPage() {
		if (page == 0) {
			page = Constant.PAGE;
		}
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		if (pageSize == 0) {
			pageSize = Constant.PAGE_SIZE;
		}
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
