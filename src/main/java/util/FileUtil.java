package util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.github.gserv.serv.commons.util.Tools;

public class FileUtil {

	
	public static String saveFile(MultipartFile uploadFile,HttpSession session) throws IllegalStateException, IOException{
        //获取上传文件名
        String filename = uploadFile.getOriginalFilename();
        //获取Web-inf下的files文件夹的绝对路径作为前半部分路径
        String orderNum = Tools.getOrderNum();
        String leftPath = session.getServletContext().getRealPath("/WEB-INF/files/") +File.separator+ orderNum;
        File p = new File(leftPath);
        if(!p.exists()){
        	p.mkdirs();
        }
        //将文件的前半部分路径与文件名拼接
        File file = new File(leftPath, filename);
    	uploadFile.transferTo(file);
		return "/WEB-INF/files/" + orderNum + "/" + filename;
	}
	
}
