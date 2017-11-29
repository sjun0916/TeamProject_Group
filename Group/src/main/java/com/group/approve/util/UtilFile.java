package com.group.approve.util;

/**
 * @author EUNBEE GO
 * @since 2017.03.14
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.view.AbstractView;



//@Component > @Service
//			: 스프링 프레임워크가 관리하는 컴포넌트의 일반적 타입 
//			: 개발자가 직접 조작이 가능한 클래스의 경우 해당 어노테이션을 붙임
//			: ( <=> @Bean : 개발자가 조작이 불가능한 외부 라이브러리를 Bean으로 등록시 사용)
@Component
public class UtilFile extends AbstractView {
	String fileName = "";
	
//	프로젝트 내 지정된 경로에 파일을 저장하는 메소드
	public String fileUpload(MultipartHttpServletRequest request,
										MultipartFile uploadFile, Object obj) {
		String path = "";
		String fileName = "";
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		try {
			fileName = uploadFile.getOriginalFilename();
			byte[] bytes = uploadFile.getBytes();
			path = getSaveLocation(request, obj);
			
			System.out.println("UtilFile fileUpload fileName : " + fileName);
			System.out.println("UtilFile fileUpload uploadPath : " + path);
			
			File file = new File(path);
			
//			파일명이 중복으로 존재할 경우
			if (fileName != null && !fileName.equals("")) {
				if (file.exists()) {
//					파일명 뒤에 업로드 시간 초단위로 붙여서 중복 방지
					fileName = System.currentTimeMillis() + "_" + fileName;
					
					file = new File(path + fileName);
				}
			}
			
			System.out.println("UtilFile fileUpload final fileName : " + fileName);
			System.out.println("UtilFile fileUpload file : " + file);
			
			out = new FileOutputStream(file);
			
			System.out.println("UtilFile fileUpload out : " + out);
			
			out.write(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return path + fileName;
	}
	
//  파일이름 가져오는 메소드
	public String getFileName(){
		
		System.out.println(fileName);
		
		return fileName;
	}
	
//	업로드 파일 저장 경로 얻는 메소드
	private String getSaveLocation(MultipartHttpServletRequest request, Object obj) {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String attachPath = "resources/files/";
		
		System.out.println("UtilFile getSaveLocation path : " + uploadPath + attachPath);
		
		return uploadPath + attachPath;
	}

//	파일 다운로드
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
						HttpServletResponse response) throws Exception {
		
		setContentType("application/download; charset=utf-8");
		
		File file = (File) model.get("downloadFile");
		
		response.setContentType(getContentType());
		response.setContentLength((int) file.length()); 
		
		String header = request.getHeader("User-Agent");
		boolean b = header.indexOf("MSIE") > -1;
		String fileName = null;
		
		if (b) {
			fileName = URLEncoder.encode(file.getName(), "utf-8");
		} else {
			fileName = new String(file.getName().getBytes("utf-8"), "iso-8859-1");
		}
		
		response.setHeader("Conent-Disposition", "attachment); filename=\"" + fileName + "\";");
		response.setHeader("Content-Transter-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(file);
			
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException ioe) {
					ioe.printStackTrace();
				}
			}
			
			out.flush();
		}
	}
}