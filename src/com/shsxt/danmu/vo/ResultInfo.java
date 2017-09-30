package com.shsxt.danmu.vo;


import com.shsxt.danmu.util.Paginator;

/**
 * 结果类 用于返回信息
 */
public class ResultInfo {
	
	private Integer code;
	private String msg;
	private Object result;
	private Paginator paginator; // 分页对象
	
	public ResultInfo() {
	}
	
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
}
