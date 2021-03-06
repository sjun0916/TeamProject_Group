package com.group.user.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	private static String SAVE_PATH = "C:\\Test";
	private static String PREFIX_URL = "C:\\Test\\images";
	private String savePath = "";

	// 파일저장
	public String restore(MultipartFile multipartFile) {

		String url = "";
		String saveFileName = "";
		try {
			String originalFileName = multipartFile.getOriginalFilename();
			
			if (originalFileName == null || originalFileName.equals("")) {
				return url;
			}
			
			String extName = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());	
			Long size = multipartFile.getSize();
			saveFileName = genSaveFileName( extName );
			
			System.out.println( "#######" + originalFileName );
			System.out.println( "#######" + extName );
			System.out.println( "#######" + saveFileName );
			System.out.println( "#######" + size );
			
			writeFile( multipartFile, savePath, saveFileName );
			
			url = savePath + saveFileName;
			
		} catch( IOException ex ) {
			throw new RuntimeException( ex );
		}
		
		return saveFileName;
	}

	// 파일 저장 경로 생성
    public void makeBasePath(String path) {
        File dir = new File(path); 
        if (!dir.exists()) {
            dir.mkdirs();
        }
    }
	
	private void writeFile(
		MultipartFile multipartFile, String path, String saveFileName ) throws IOException {
		makeBasePath(path);
		byte[] fileData = multipartFile.getBytes();
		
		FileOutputStream fos
			= new FileOutputStream( savePath + "/" + saveFileName );
		fos.write( fileData );
		fos.close();
	}
	
	// 파일 이름 가져오기
	private String genSaveFileName( String extName ) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get( Calendar.YEAR );
		fileName += calendar.get( Calendar.MONTH );
		fileName += calendar.get( Calendar.DATE );
		fileName += calendar.get( Calendar.HOUR );
		fileName += calendar.get( Calendar.MINUTE );
		fileName += calendar.get( Calendar.SECOND );
		fileName += calendar.get( Calendar.MILLISECOND );
		fileName += extName;
		
		return fileName;
	}
	
	// 저장 경로
	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
}
