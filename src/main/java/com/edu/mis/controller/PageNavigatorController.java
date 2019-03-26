package com.edu.mis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.edu.mis.model.Graduate;
import com.github.gserv.serv.commons.encry.AESUtils;

@Controller
@RequestMapping("page")
public class PageNavigatorController {
	
	@RequestMapping("to")
	public String to(@RequestParam("target") String target){
		return target;
	}
	public static void main(String[] args) {
		Integer a = 128;
		Integer c = 128;
		int b = 12000009;
		System.err.println(c == a);
	}
	@RequestMapping("index")
	public String index(){
		return "index";
	}
	@RequestMapping("f/index")
	public String front(){
		return "/front/index";
	}
	
	@RequestMapping("f/to")
	public String fTo(@RequestParam("target") String target){
		return "/front/"+target;
	}
	
	@RequestMapping("test")
	@ResponseBody
	public String test11(MultipartFile file,Graduate graduate){
		return "123";
	}
	
	@RequestMapping("login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("welcome")
	public String welcome(){
		return "welcome";
	}
	
}
