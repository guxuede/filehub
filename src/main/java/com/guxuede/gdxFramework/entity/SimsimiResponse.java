package com.guxuede.gdxFramework.entity;

public class SimsimiResponse {
	//{"response":"我还小","id":24006720,"result":100,"msg":"OK."}
	private int result;
	private int id;
	private String response;
	private String msg;
	
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
