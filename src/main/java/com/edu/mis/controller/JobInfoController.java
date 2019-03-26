package com.edu.mis.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.mis.entity.ChartData;
import com.edu.mis.model.JobInfo;
import com.edu.mis.service.JobInfoService;
import com.github.gserv.serv.commons.util.JsonMapper;

@RestController
@RequestMapping("b/jobinfo")
public class JobInfoController {

	@Resource
	private JobInfoService jobinfoService;
	
	@RequestMapping("save")
	public String save(JobInfo jobinfo){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			int i = jobinfoService.save(jobinfo);
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
			
			int i = jobinfoService.delete(parseInt);
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
	public String update(JobInfo jobinfo){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			
			int i = jobinfoService.updateNotNull(jobinfo);
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
			List<JobInfo> list = jobinfoService.selectAll();
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

			JobInfo jobinfo = jobinfoService.selectByKey(parseInt);
			rsp.put("status","success");
			rsp.put("msg","成功");
			rsp.put("obj", jobinfo);
		} catch (Exception e) {
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		
		return JsonMapper.toJsonString(rsp);
	}
	
	//----------------------------------------
	
	@RequestMapping("get_chart_data")
	public String getChartData(Integer type,Integer instituteId,Integer departmentId){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			ChartData data = jobinfoService.mkChartData(type, instituteId, departmentId);
			rsp.put("status","success");
			rsp.put("msg","成功");
			rsp.put("chartData", data);
		} catch (Exception e) {
			e.printStackTrace();
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		
		return JsonMapper.toJsonString(rsp);
	}
	
	
	
}
