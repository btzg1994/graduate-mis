package com.edu.mis.entity;

public class NameValueEntity {

	private String name;
	
	private Integer value;
	
	public NameValueEntity() {
	}

	
	public NameValueEntity(String name, Integer value) {
		super();
		this.name = name;
		this.value = value;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}
	
	
}
