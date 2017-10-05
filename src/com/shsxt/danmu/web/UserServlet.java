package com.shsxt.danmu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shsxt.danmu.constant.Constant;
import com.shsxt.danmu.dto.UserDto;
import com.shsxt.danmu.exception.ParamException;
import com.shsxt.danmu.model.Wisdom;
import com.shsxt.danmu.service.UserService;
import com.shsxt.danmu.util.JsonUtil;
import com.shsxt.danmu.util.RequestParamsUtil;
import com.shsxt.danmu.util.StringUtil;
import com.shsxt.danmu.vo.LoginUserIdentity;
import com.shsxt.danmu.vo.ResultInfo;
import com.shsxt.danmu.vo.UserVo;

/**
 * 首页
 */
@SuppressWarnings("serial")
@WebServlet("/user")
public class UserServlet extends HttpServlet {

	private UserService userService = new UserService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 跳转修改用户信息的页面
		LoginUserIdentity loginUserIdentity = (LoginUserIdentity) request.getSession()
				.getAttribute(Constant.LOGIN_USER_KEY);
		try {
			UserVo user = userService.findUserProfile(loginUserIdentity.getUserName());
			request.setAttribute("userVo", user);
			request.getRequestDispatcher("user-edit.jsp").forward(request, response);
		} catch (Exception e) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ResultInfo resultInfo = new ResultInfo();
			try {
				UserDto user = RequestParamsUtil.formatParams(request, UserDto.class);
				LoginUserIdentity loginUserIdentity = userService.signUp(user.getUserName(), user.getUserPwd());
				request.getSession().setAttribute(Constant.LOGIN_USER_KEY, loginUserIdentity);
				resultInfo.setCode(200);
				resultInfo.setMsg(Constant.SUCCESS_MSG);
				resultInfo.setResult(loginUserIdentity);
			} catch (ParamException ex) {
				resultInfo.setCode(ex.getErrorCode());
				resultInfo.setMsg(ex.getMessage());
			} catch (Exception ex) {
				resultInfo.setCode(Constant.FAILED_CODE);
				resultInfo.setMsg(ex.getMessage());
			}
			JsonUtil.toJson(resultInfo, response);
	}

	/**
	 * 登录 修改用户信息
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		if(StringUtil.isEmpty(id)){
			// 登录
			String userName = request.getParameter("userName");
			String userPwd = request.getParameter("userPwd");
			ResultInfo resultInfo = new ResultInfo();
			try {
				LoginUserIdentity loginUserIdentity = userService.signIn(userName, userPwd);
				request.getSession().setAttribute(Constant.LOGIN_USER_KEY, loginUserIdentity);
				resultInfo.setCode(200);
				resultInfo.setMsg(Constant.SUCCESS_MSG);
				resultInfo.setResult(loginUserIdentity);
			} catch (ParamException ex) {
				resultInfo.setCode(ex.getErrorCode());
				resultInfo.setMsg(ex.getMessage());
			} catch (Exception ex) {
				resultInfo.setCode(Constant.FAILED_CODE);
				resultInfo.setMsg(ex.getMessage());
			}
			JsonUtil.toJson(resultInfo, response);
			
		}else{
			updateUserInfo(request,response);
		}

	}

	/**
	 * 修改用户信息
	 * 
	 * @param request
	 * @param response
	 */
	private void updateUserInfo(HttpServletRequest request, HttpServletResponse response) {
		
		ResultInfo resultInfo = new ResultInfo();
		/*
		 * if(StringUtil.isNotEmpty(user.getUserName())){
		 * userService.updateBasicInfo(user); }else
		 * if(StringUtil.isNotEmpty(user.getUserPwd())){
		 * userService.updatePassword(user); }else
		 * if(StringUtil.isNotEmpty(user.getBlogName())){
		 * userService.updateBlogName(user); }
		 */
		String oldPwd = request.getParameter("oldPwd");
		UserVo user = RequestParamsUtil.requestToBean(request,UserVo.class);
		Wisdom wisdom = RequestParamsUtil.requestToBean(request,Wisdom.class);
		user.setWisdom(wisdom);
		
		boolean flag = userService.updateBasicInfo(user, oldPwd);
		if(flag){
			LoginUserIdentity u = (LoginUserIdentity) request.getSession().getAttribute(Constant.LOGIN_USER_KEY);
			if(StringUtil.isNotEmpty(user.getUserName())){
				u.setUserName(user.getUserName());
			}
				
			resultInfo.setCode(200);
			resultInfo.setMsg("修改成功");
		}
		JsonUtil.toJson(resultInfo, response);

	}
	
}
