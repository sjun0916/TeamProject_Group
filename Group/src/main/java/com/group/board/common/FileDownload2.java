package com.group.board.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileDownload2 {

    /**
     * 파일(첨부파일, 이미지등) 다운로드.
     */
    @RequestMapping(value = "fileDownload2")
    public void fileDownload2(HttpServletRequest request,HttpServletResponse response) {
        String path =  request.getServletContext().getRealPath("/imgUpload"); 
       
        String filename = request.getParameter("filename");
        String downname = request.getParameter("downname");
        String realPath = "";
        System.out.println("downname: "+downname);
        if (filename == null || "".equals(filename)) {
            filename = downname;
        }
        
        try {
            filename = URLEncoder.encode(filename, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            System.out.println("UnsupportedEncodingException");
        }
        
        realPath = path +"\\" +downname.substring(0,4) + "\\"+downname;
System.out.println(realPath);
        File file1 = new File(realPath);
        if (!file1.exists()) {
            return ;
        }
        
        // 파일명 지정
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realPath);

            int ncount = 0;
            byte[] bytes = new byte[512];

            while ((ncount = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.close();
        } catch (FileNotFoundException ex) {
            System.out.println("FileNotFoundException");
        } catch (IOException ex) {
            System.out.println("IOException");
        }
    }
    
}
