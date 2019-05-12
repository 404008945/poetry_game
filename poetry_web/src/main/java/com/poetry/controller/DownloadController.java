package com.poetry.controller;

import com.poetry.entity.User;
import com.poetry.service.UserService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Controller
public class DownloadController {

    @Autowired
    private UserService userService;
    @RequestMapping(value="/downloadImg")
    public ResponseEntity<byte[]> download(@RequestParam("imgSrc") String imgSrc, HttpServletRequest request) throws IOException, InterruptedException{
//	System.out.println(musicService.selectByPrimaryKey(id));
        //
        String path=	request.getServletContext().getRealPath("/image/");
        String fileName=imgSrc;///获取到图片的
        System.out.println(fileName);
        String downloadName=fileName;//采用相同的名字
        File file=new File(path,fileName);
        HttpHeaders headers=new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", new String(downloadName.getBytes("UTF-8"),"iso-8859-1"));
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);
    }
}
