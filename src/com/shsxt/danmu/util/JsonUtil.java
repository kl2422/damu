package com.shsxt.danmu.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.druid.support.json.JSONUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

public class JsonUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(JsonUtil.class);
	
	public static void toJson(Object obj, HttpServletResponse resp) {
		PrintWriter pw = null;
		try {
			pw = resp.getWriter();
			String result = new Gson().toJson(obj);
			pw.write(result);
			pw.flush();
		} catch (IOException e) {
			logger.error("传送错误：{}", e);
		} finally {

			if(pw != null) {
				pw.close();
			}
		}
	}
}
