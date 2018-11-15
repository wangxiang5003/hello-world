package com.wang.hellomyworld.controllers;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AddPhotoController {
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/addPhoto")
	public ModelAndView view() {
		return new ModelAndView("addPhoto");
	}
	@RequestMapping(value = "/actionAdd", method = RequestMethod.POST)
	public void addPhoto(@RequestParam("name") String name,
	        @RequestParam("file") MultipartFile file) {
		
		 if (!file.isEmpty()) {
	            try {
	            	InputStream is = file.getInputStream();
					
	            	BufferedInputStream in=null;
	                BufferedOutputStream out=null;
	                in=new BufferedInputStream(is);
	                System.out.println(context.getRealPath("/img/")+name);
	                out=new BufferedOutputStream(new FileOutputStream(context.getRealPath("/img/")+name));
	                int len=-1;
	                byte[] b=new byte[1024];
	                while((len=in.read(b))!=-1){
	                    out.write(b,0,len);
	                }
	                in.close();
	                out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	       } else {
	    	   
	       }
	}
}
