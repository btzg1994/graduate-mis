package com.edu.mis.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.mis.model.Department;
import com.edu.mis.service.DepartmentService;
import com.github.gserv.serv.commons.util.JsonMapper;

@RestController
@RequestMapping("b/department")
public class DepartmentController {

	@Resource
	private DepartmentService departmentService;
	
	@RequestMapping("save")
	public String save(Department department){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			int i = departmentService.save(department);
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
			
			int i = departmentService.delete(parseInt);
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
	public String update(Department department){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			
			int i = departmentService.updateNotNull(department);
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
			List<Department> list = departmentService.selectAll();
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

			Department department = departmentService.selectByKey(parseInt);
			rsp.put("status","success");
			rsp.put("msg","成功");
			rsp.put("obj", department);
		} catch (Exception e) {
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		return JsonMapper.toJsonString(rsp);
	}
	
}
