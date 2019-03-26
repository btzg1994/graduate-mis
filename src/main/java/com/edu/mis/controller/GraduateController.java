package com.edu.mis.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.edu.mis.model.Graduate;
import com.edu.mis.service.GraduateService;
import com.github.gserv.serv.commons.util.JsonMapper;

import util.FileUtil;

@RestController
@RequestMapping("b/graduate")
public class GraduateController {

	@Resource
	private GraduateService graduateService;
	
	@RequestMapping("save")
	public String save(Graduate graduate,MultipartFile file,HttpSession session){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			graduate.setCreateTime(new Date());
			String path = FileUtil.saveFile(file, session);
			graduate.setImgUrl(path);
			int i = graduateService.save(graduate);
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
			
			int i = graduateService.delete(key);
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
	public String update(Graduate graduate,MultipartFile file,HttpSession session){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			String path = FileUtil.saveFile(file, session);
			graduate.setImgUrl(path);
			int i = graduateService.updateNotNull(graduate);
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
			List<Graduate> list = graduateService.selectAll();
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

			Graduate graduate = graduateService.selectByKey(key);
			rsp.put("status","success");
			rsp.put("msg","成功");
			rsp.put("obj", graduate);
		} catch (Exception e) {
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		
		return JsonMapper.toJsonString(rsp);
	}
	
	
	// -------------------------------------------------
	@RequestMapping("selectByCondition")
	public String selectByCondition(String name,String idcard,String gender,String phone,String id){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			Integer g = null;
			if(StringUtils.isBlank(gender) || !StringUtils.isNumeric(gender)){
				
			}else{
				g =Integer.parseInt(gender);
			}
			
			Graduate graduate = new Graduate();
			graduate.setName(name);
			graduate.setGender(g);
			graduate.setPhone(phone);
			graduate.setIdcard(idcard);
			graduate.setId(id);
			
			List<Graduate> list = graduateService.selectByCondition(graduate);
			rsp.put("status","success");
			rsp.put("msg","成功");
			rsp.put("list", list);
		} catch (Exception e) {
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		
		return JsonMapper.toJsonString(rsp);
		
	}
	
}
