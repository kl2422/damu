package com.shsxt.danmu.web;

import com.shsxt.danmu.constant.Constant;
import com.shsxt.danmu.dto.ArticleDto;
import com.shsxt.danmu.dto.UserDto;
import com.shsxt.danmu.exception.ParamException;
import com.shsxt.danmu.model.Article;
import com.shsxt.danmu.model.User;
import com.shsxt.danmu.service.ArticleService;
import com.shsxt.danmu.service.UserService;
import com.shsxt.danmu.util.JsonUtil;
import com.shsxt.danmu.util.PageList;
import com.shsxt.danmu.util.RequestParamsUtil;
import com.shsxt.danmu.vo.LoginUserIdentity;
import com.shsxt.danmu.vo.ResultInfo;
import com.shsxt.danmu.vo.TagVo;
import com.shsxt.danmu.vo.UserVo;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页
 */
@SuppressWarnings("serial")
@WebServlet("/user")
public class UserServlet extends HttpServlet {
	
	private UserService userService = new UserService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 跳转修改用户信息的页面
		LoginUserIdentity loginUserIdentity = (LoginUserIdentity)request.getSession()
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
	 * @see HttpServlet#doPut(HttpServletRequest request, HttpServletResponse response)
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
	}
}
