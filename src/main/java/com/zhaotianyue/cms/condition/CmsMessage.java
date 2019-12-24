package com.zhaotianyue.cms.condition;

import java.io.Serializable;
//ajax返回消息对象,并提交是否错误,如果错误就不提交数据,只提示错误信息
public class CmsMessage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4837689890711238025L;

	private int code; // 里面写CmsError的常量
	private String error;//错误提示信息
	private Object data;//数据
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "CmsMessage [code=" + code + ", error=" + error + ", data=" + data + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + code;
		result = prime * result + ((data == null) ? 0 : data.hashCode());
		result = prime * result + ((error == null) ? 0 : error.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CmsMessage other = (CmsMessage) obj;
		if (code != other.code)
			return false;
		if (data == null) {
			if (other.data != null)
				return false;
		} else if (!data.equals(other.data))
			return false;
		if (error == null) {
			if (other.error != null)
				return false;
		} else if (!error.equals(other.error))
			return false;
		return true;
	}
	public CmsMessage(int code, String error, Object data) {
		super();
		this.code = code;
		this.error = error;
		this.data = data;
	}
	public CmsMessage() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
