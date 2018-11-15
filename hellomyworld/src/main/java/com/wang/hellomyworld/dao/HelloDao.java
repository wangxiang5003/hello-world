package com.wang.hellomyworld.dao;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class HelloDao {
	private static String sqlGetImgMap = "select * from hello ";
	private static String sqlInsertImg = "insert into hello (img, img_name) values (:img,:imgName)";
	private static String sqlGetImgCount = "select count(*) from hello";

	@Autowired
	@Qualifier("helloDAO")
	private NamedParameterJdbcTemplate jdbcTemplate = null;

	public int getImgCount() {
		Map<String, String> paramMap = new HashMap<>();
		return jdbcTemplate.queryForObject(sqlGetImgCount, paramMap, Integer.class);
	}

	public List<Map<String, Object>> getImgMap() {
		Map<String, String> paramMap = new HashMap<>();
		return jdbcTemplate.queryForList(sqlGetImgMap, paramMap);
	}

	public void saveImg(List<FileInputStream> inList, List<String> nameList) {
		Map<String, Object> param = new HashMap<>();
		param.put("img", inList);
		param.put("imgName", nameList);
		jdbcTemplate.update(sqlInsertImg, param);
	}
}