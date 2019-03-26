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

import com.edu.mis.model.Article;
import com.edu.mis.service.ArticleService;
import com.github.gserv.serv.commons.util.JsonMapper;

import util.FileUtil;

@RestController
@RequestMapping("b/article")
public class ArticleController {

	@Resource
	private ArticleService articleService;
	
	@RequestMapping("save")
	public String save(Article article,MultipartFile file,HttpSession session){
		
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			article.setCreateTime(new Date());
			String path = FileUtil.saveFile(file, session);
			article.setImgUrl(path);
			int i = articleService.save(article);
			if(i == 1){
				rsp.put("status","success");
				rsp.put("msg","成功");
			}else{
				rsp.put("status","failure");
				rsp.put("msg","失败");
			}
			
		} catch (Exception e) {
			System.out.println(e);
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		System.out.println(JsonMapper.toJsonString(rsp));
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
			
			int i = articleService.delete(parseInt);
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
	public String update(Article article,MultipartFile file,HttpSession session){
		HashMap<String, Object> rsp = new HashMap<String,Object>();
		try {
			String path = FileUtil.saveFile(file, session);
			article.setImgUrl(path);
			int i = articleService.updateNotNull(article);
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
			List<Article> list = articleService.selectAll();
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

			Article article = articleService.selectByKey(parseInt);
			rsp.put("status","success");
			rsp.put("msg","成功");
			rsp.put("obj", article);
		} catch (Exception e) {
			rsp.put("status","failure");
			rsp.put("msg","系统异常");
		}
		
		return JsonMapper.toJsonString(rsp);
	}
	
	
	
	
	
	// -------------------------
	@RequestMapping("upload_img")
	public void uploadImg(MultipartFile file,Integer id){
		
	}
	
	
	
	
	
	
}
