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
import com.edu.mis.model.Teacher;
import com.edu.mis.service.TeacherService;
import com.github.gserv.serv.commons.util.JsonMapper;

import util.FileUtil;

@RestController
@RequestMapping("b/teacher")
public class TeacherController {

	@Resource
	private TeacherService teacherService;
	
	@RequestMapping("save")
	public String save(Teacher teacher,MultipartFile file,HttpSession session){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			String path = FileUtil.saveFile(file, session);
			teacher.setImgUrl(path);
			teacher.setCreateTime(new Date());
			int i = teacherService.save(teacher);
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
			
			int i = teacherService.delete(key);
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
	public String update(Teacher teacher,MultipartFile file,HttpSession session){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			String path = FileUtil.saveFile(file, session);
			teacher.setImgUrl(path);
			int i = teacherService.updateNotNull(teacher);
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
			List<Teacher> list = teacherService.selectAll();
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

			Teacher teacher = teacherService.selectByKey(key);
			rsp.put("status","success");
			rsp.put("msg","成功");
			rsp.put("obj", teacher);
		} catch (Exception e) {
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		
		return JsonMapper.toJsonString(rsp);
	}
	
	// -------------------------------------------------------------
	@RequestMapping("selectByCondition")
	public String selectByCondition(String name,String gender,String phone,String id){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			Integer g = null;
			if(StringUtils.isBlank(gender) || !StringUtils.isNumeric(gender)){
				
			}else{
				g =Integer.parseInt(gender);
			}
			Teacher teacher = new Teacher();
			teacher.setName(name);
			teacher.setGender(g);
			teacher.setPhone(phone);
			teacher.setId(id);
			
			List<Teacher> list = teacherService.selectByCondition(teacher);
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
