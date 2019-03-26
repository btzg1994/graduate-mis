package com.edu.mis.entity;

import java.util.List;
import java.util.Map;

public class ChartData {
	
	private String title;
	
	private List<String> legend;
	
	private List<NameValueEntity> mixValueArray;
	
	private List<String> xArray;
	
	private List<Integer> valueArray;

	public ChartData() {
	}
	
	
	
	public ChartData(String title, List<String> legend, List<NameValueEntity> mixValueArray, List<String> xArray,
			List<Integer> valueArray) {
		super();
		this.title = title;
		this.legend = legend;
		this.mixValueArray = mixValueArray;
		this.xArray = xArray;
		this.valueArray = valueArray;
	}





	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<String> getLegend() {
		return legend;
	}

	public void setLegend(List<String> legend) {
		this.legend = legend;
	}

	public List<NameValueEntity> getMixValueArray() {
		return mixValueArray;
	}

	public void setMixValueArray(List<NameValueEntity> mixValueArray) {
		this.mixValueArray = mixValueArray;
	}

	public List<String> getxArray() {
		return xArray;
	}

	public void setxArray(List<String> xArray) {
		this.xArray = xArray;
	}

	public List<Integer> getValueArray() {
		return valueArray;
	}

	public void setValueArray(List<Integer> valueArray) {
		this.valueArray = valueArray;
	}
	
	
}
