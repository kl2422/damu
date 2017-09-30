package com.shsxt.danmu.base;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class BaseModel implements Serializable {
	
	// 主键
	private Integer id;
	// 是否有效0=无效 1=有效
	private Integer isValid;
	// 创建时间
	private Date createDate;
	// 最后一次修改时间
	private Date updateDate;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getIsValid() {
		return isValid;
	}
	public void setIsValid(Integer isValid) {
		this.isValid = isValid;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
}
