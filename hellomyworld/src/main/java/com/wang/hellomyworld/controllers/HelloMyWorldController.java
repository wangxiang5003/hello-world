package com.wang.hellomyworld.controllers;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloMyWorldController {
	@Autowired
	ServletContext context;
	
	@RequestMapping("/helloWorld")
	public ModelAndView hello() {
		
		File f= new File(context.getRealPath("/img"));
		String [] filelist = f.list();
		Map<String, Object> viewMap = new HashMap<>();
		viewMap.put("filelist", Arrays.asList(filelist));
		return new ModelAndView("helloMyWorld", viewMap);
	}
	
}
