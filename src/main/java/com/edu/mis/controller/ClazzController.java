package com.edu.mis.controller;

import java.util.HashMap;
import java.util.List;


import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.mis.model.Clazz;
import com.edu.mis.service.ClazzService;
import com.github.gserv.serv.commons.util.JsonMapper;

@RestController
@RequestMapping("b/clazz")
public class ClazzController {

	@Autowired
	private ClazzService clazzService;
	
	@RequestMapping("save")
	public String save(Clazz clazz){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			int i = clazzService.save(clazz);
			if(i == 1){
				rsp.put("status","success");
				rsp.put("msg","成功");
			}else{
				rsp.put("status","failureure");
				rsp.put("msg","失败");
			}
			
		} catch (Exception e) {
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		return JsonMapper.toJsonString(rsp);
		
	}
	
	@RequestMapping("delete")
	public String delete(String key){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			
			if(StringUtils.isBlank(key) || !StringUtils.isNumeric(key)){
				rsp.put("status","failure");
				rsp.put("msg","入参格式异常");
				return JsonMapper.toJsonString(rsp);
			}
			int parseInt = Integer.parseInt(key);
			
			int i = clazzService.delete(parseInt);
			if(i == 1){
				rsp.put("status","success");
				rsp.put("msg","成功");
			}else{
				rsp.put("status","failure");
				rsp.put("msg","失败");
			}
			
		} catch (Exception e) {
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		return JsonMapper.toJsonString(rsp);
	}
	
	
	@RequestMapping("update")
	public String update(Clazz clazz){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			
			int i = clazzService.updateNotNull(clazz);
			if(i == 1){
				rsp.put("status","success");
				rsp.put("msg","成功");
			}else{
				rsp.put("status","failure");
				rsp.put("msg","失败");
			}
			
		} catch (Exception e) {
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		return JsonMapper.toJsonString(rsp);
	}
	

	@RequestMapping("selectAll")
	public String selectAll(){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			List<Clazz> list = clazzService.selectAll();
			rsp.put("status","success");
			rsp.put("msg","成功");
			rsp.put("list",list);
		} catch (Exception e) {
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		return JsonMapper.toJsonString(rsp);
	}
	
	@RequestMapping("selectByKey")
	public String selectByKey(String key){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			if(StringUtils.isBlank(key) || !StringUtils.isNumeric(key)){
				rsp.put("status","failure");
				rsp.put("msg","入参格式异常");
				return JsonMapper.toJsonString(rsp);
			}
			int parseInt = Integer.parseInt(key);

			Clazz clazz = clazzService.selectByKey(parseInt);
			rsp.put("status","success");
			rsp.put("msg","成功");
			rsp.put("obj", clazz);
		} catch (Exception e) {
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		return JsonMapper.toJsonString(rsp);
	}
	
}
