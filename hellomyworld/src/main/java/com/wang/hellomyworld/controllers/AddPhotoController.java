package com.wang.hellomyworld.controllers;

import com.wang.hellomyworld.dao.HelloDao;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
	@Autowired
	HelloDao dao;

	@RequestMapping("/addPhoto")
	public ModelAndView view() {
		return new ModelAndView("addPhoto");
	}

	@RequestMapping(value ="/actionAdd", method = RequestMethod.POST)
	public ModelAndView addPhoto(@RequestParam("name") String name, @RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				byte[] fileBytes= file.getBytes();
				BufferedOutputStream out = null;
				out = new BufferedOutputStream(new FileOutputStream(context.getRealPath("/img/") + name));
				out.write(fileBytes, 0, fileBytes.length);
				out.close();

				FileInputStream fis = new FileInputStream(context.getRealPath("/img/") + name);
				List<FileInputStream> fisList = new ArrayList<>();
				fisList.add(fis);
				List<String> nameList = new ArrayList<>();
				nameList.add(name);
				dao.saveImg(fisList, nameList);
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
				return new ModelAndView("addPhoto", "message", "surprise! error occurs");
			}

		} else {
			return new ModelAndView("addPhoto", "message", "surprise! error occurs");
		}
		return new ModelAndView("addPhoto", "message", "upload Success");
	}
}
