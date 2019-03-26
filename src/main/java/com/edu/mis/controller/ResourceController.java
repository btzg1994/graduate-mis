package com.edu.mis.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author ypc
 *
 * @description 将素材以流的方式发送至用户浏览器
 * 2018年7月10日
 *
 */
@Controller
public class ResourceController {

	

	@RequestMapping("file2stream")
	public void fileToStream(String url,HttpServletResponse response,HttpSession session) {
		String path = session.getServletContext().getRealPath(url);
		File file = new File(path);
		if (file.exists()) {
			try {
				FileInputStream is = new FileInputStream(file);
				int i = is.available(); // 得到文件大小
				byte data[] = new byte[i];
				is.read(data); // 读数据
				is.close();
				/*response.setContentType("image/*");*/ // 设置返回的文件类型
				OutputStream toClient = response.getOutputStream(); // 得到向客户端输出二进制数据的对象
				toClient.write(data); // 输出数据
				toClient.close();
			} catch (Exception e) {
				
			}
		}
	}
}
