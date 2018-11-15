package com.wang.hellomyworld.controllers;

import com.wang.hellomyworld.dao.HelloDao;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
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
	@Autowired
	HelloDao dao;

	@RequestMapping({ "/helloWorld" })
	public ModelAndView hello() {
		int count = dao.getImgCount();

		File f = new File(context.getRealPath("/img"));
		String[] filelist = f.list();
		
		if(f.list()==null) {
			f.mkdir();
		}
		if (filelist.length != count) {
			consistentImg(filelist);
			f = new File(context.getRealPath("/img"));
			filelist = f.list();
		}

		Map<String, Object> viewMap = new HashMap<>();
		viewMap.put("filelist", Arrays.asList(filelist));
		return new ModelAndView("helloMyWorld", viewMap);
	}

	private void consistentImg(String[] fileNameList) {
		List<Map<String, Object>> list = dao.getImgMap();
		List<String> fNList = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			fNList.add((String)list.get(i).get("img_name"));
		}
		for (int i = 0; i < fileNameList.length; i++) {
			if (fNList.contains(fileNameList[i])) {
				fNList.remove(fileNameList[i]);
			}
		}
		if (fNList.size() != 0) {
			transFormToServer(list, fNList);
		}
	}

	private void transFormToServer(List<Map<String, Object>> list, List<String> fNList) {
		List<byte[]> bsList = new ArrayList<>();
		for (int i = 0; i < fNList.size(); i++) {
			for (int j = 0; j < list.size(); j++) {
				if (((String) fNList.get(i)).equals(list.get(j).get("img_name"))) {
					byte[] in = (byte[])list.get(j).get("img");
					bsList.add(in);
					break;
				}
			}
		}
		for (int i = 0; i < bsList.size(); i++) {
			try {
				BufferedOutputStream out = new BufferedOutputStream(
						new FileOutputStream(context.getRealPath("/img/") + (String) fNList.get(i)));
				out.write((byte[]) bsList.get(i), 0, ((byte[]) bsList.get(i)).length);
				out.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}