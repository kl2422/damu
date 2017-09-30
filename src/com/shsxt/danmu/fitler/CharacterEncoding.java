package com.shsxt.danmu.fitler;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class Encoding
 */
@WebFilter("/*")
public class CharacterEncoding implements Filter {

    /**
     * Default constructor. 
     */
    public CharacterEncoding() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		//1)、基于Http协议的
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		//2)、处理Post
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		//静态资源不用字符集处理
		String path = req.getRequestURI();
		if(path.contains("/statics")){
			chain.doFilter(req, resp); //放行
			return ;
		}	
		
		
		//3)、处理get
		//a)、获取服务器的版本
		String serverInfo = req.getServletContext().getServerInfo();
		//Apache Tomcat/7.0.69  
		//Apache Tomcat/8.0.35
		System.out.println(serverInfo);
		//String  str="Apache Tomcat/7.0.69 "; //Apache Tomcat/8.0.35
		//使用正则表达式
		Pattern pattern = Pattern.compile("cat/(\\d+)");
		//匹配
		Matcher matcher = pattern.matcher(serverInfo);
		int version = 8;
		if(matcher.find()){
			version =Integer.parseInt(matcher.group(1));
		}		
		//b)、获取请求方式  如果是 8 放行 8以下 需要进行中文处理
		if(req.getMethod().equalsIgnoreCase("get") && version < 8){
			//请求包装器
			chain.doFilter(new MyWrapper(req), resp);
			return ;
		}
		
		chain.doFilter(req, resp);
		return ;
		
	}
	
	class MyWrapper extends HttpServletRequestWrapper{
		private HttpServletRequest request;
		public MyWrapper(HttpServletRequest request) {
			super(request);
			this.request =request;
		}
		//重写 getParameter
		@Override
		public String getParameter(String name) {
			String value =request.getParameter(name);
			try {
				if(null!=value){
					value =new String(value.getBytes("ISO-8859-1"),"UTF-8");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}			
			return value;
		}
	}
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
