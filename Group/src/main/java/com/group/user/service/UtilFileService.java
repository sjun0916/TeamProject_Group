package com.group.user.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//@Component > @Service
//			: 스프링 프레임워크가 관리하는 컴포넌트의 일반적 타입 
//			: 개발자가 직접 조작이 가능한 클래스의 경우 해당 어노테이션을 붙임
//			: ( <=> @Bean : 개발자가 조작이 불가능한 외부 라이브러리를 Bean으로 등록시 사용)
@Service
public class UtilFileService {
	String fileName = "";
	
//	프로젝트 내 지정된 경로에 파일을 저장하는 메소드
	public String fileUpload(MultipartHttpServletRequest request,
										MultipartFile uploadFile) {
		String path = "";
		String fileName = "";
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		try {
			fileName = uploadFile.getOriginalFilename();
			byte[] bytes = uploadFile.getBytes();
			path = getSaveLocation(request);
			
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
	private String getSaveLocation(MultipartHttpServletRequest request) {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String attachPath = "resources/profile/";
		
		System.out.println("UtilFile getSaveLocation path : " + uploadPath + attachPath);
		
		return uploadPath + attachPath;
	}
}