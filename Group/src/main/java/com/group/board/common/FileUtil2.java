package com.group.board.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.group.board.vo.FileVO;
//Photo
public class FileUtil2 {
	
	private String conPath;
    /**
     * 파일 업로드.
     */
    public List<FileVO> saveAllFiles(List<MultipartFile> upfiles) {
//        String filePath = "c:\\workspace\\fileupload\\"; 
    	String filePath = conPath;
    	System.out.println("servletContextpath: "+filePath);
    	
        List<FileVO> filelist = new ArrayList<FileVO>();

        for (MultipartFile uploadfile : upfiles ) {
            if (uploadfile.getSize() == 0) {
                continue;
            }
           
            String tmpfile = getFileExtension(uploadfile.getOriginalFilename());
            String newName = getNewName();
            String realName = newName+tmpfile;
            
            saveFile(uploadfile, filePath + "/" + newName.substring(0,4) + "/",
            		realName);
           
            FileVO filedo = new FileVO();
            filedo.setFilename(uploadfile.getOriginalFilename());
            filedo.setRealname(realName);
            filedo.setFilesize(uploadfile.getSize());
            filelist.add(filedo);
            //FileVO에 넣고 filelist(List<FileVO>)에 추가시켜서 리셋
        }
        return filelist;
    }    
    
    /**
     * 파일 저장 경로 생성.
     */
    public void makeBasePath(String path) {
        File dir = new File(path); 
        if (!dir.exists()) {
            dir.mkdirs();
        }
    }

    /**
     * 실제 파일 저장.
     */
    public String saveFile(MultipartFile file, String basePath, String fileName){
        if (file == null || file.getName().equals("") || file.getSize() < 1) {
            return null;
        }
     
        makeBasePath(basePath);
        String serverFullPath = basePath + fileName;
  
        File file1 = new File(serverFullPath);
        try {
            file.transferTo(file1);
        } catch (IllegalStateException ex) {
            System.out.println("IllegalStateException: " + ex.toString());
        } catch (IOException ex) {
            System.out.println("IOException: " + ex.toString());
        }
        
        return serverFullPath;
    }
    
    /**
     * 날짜로 새로운 파일명 부여.
     */
    public String getNewName() {
        SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        return ft.format(new Date()) + (int) (Math.random() * 10);
    }
    
    public String getFileExtension(String filename) {
          Integer mid = filename.lastIndexOf(".");
          return filename.substring(mid, filename.length());
    }

    public String getRealPath(String path, String filename) {
        return path + filename.substring(0,4) + "/";
    }

	public String getConPath() {
		return conPath;
	}

	public void setConPath(String conPath) {
		this.conPath = conPath;
	}
}
