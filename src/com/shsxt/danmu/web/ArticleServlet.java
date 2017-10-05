package com.shsxt.danmu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shsxt.danmu.constant.Constant;
import com.shsxt.danmu.dto.ArticleDto;
import com.shsxt.danmu.exception.ParamException;
import com.shsxt.danmu.model.Article;
import com.shsxt.danmu.service.ArticleService;
import com.shsxt.danmu.service.UserService;
import com.shsxt.danmu.util.JsonUtil;
import com.shsxt.danmu.util.PageList;
import com.shsxt.danmu.util.Paginator;
import com.shsxt.danmu.util.RequestParamsUtil;
import com.shsxt.danmu.util.StringUtil;
import com.shsxt.danmu.vo.LoginUserIdentity;
import com.shsxt.danmu.vo.ResultInfo;
import com.shsxt.danmu.vo.UserVo;

/**
 * 首页
 */
@SuppressWarnings("serial")
@WebServlet("/article")
public class ArticleServlet extends HttpServlet {
	
	private ArticleService articleService = new ArticleService();
	private UserService userService = new UserService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String articleId = request.getParameter("id");
		if (StringUtil.isNotEmpty(articleId)) {
			findById(request, response, articleId);
		} else {
			selectForPage(request, response);
		}
	}

	/**
	 * 添加
	 * @see HttpServlet#doPut(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Article article = RequestParamsUtil.formatParams(request, Article.class);
		addOrUpdate(response, request, article);
	}

	/**
	 * 修改
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Article article = RequestParamsUtil.requestToBean(request, Article.class);
		addOrUpdate(response, request, article);
	}

	/**
	 * 修改
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Article article = RequestParamsUtil.formatParams(request, Article.class);
		ResultInfo resultInfo = new ResultInfo();
		try {
			LoginUserIdentity loginUserIdentity = (LoginUserIdentity)request.getSession()
					.getAttribute(Constant.LOGIN_USER_KEY);
			articleService.delete(article.getId(), loginUserIdentity.getUserName());
			resultInfo.setCode(200);
			resultInfo.setMsg(Constant.SUCCESS_MSG);
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
	 * 根据ID查询
	 * @param request
	 * @param response
	 * @param articleId
	 * @throws ServletException
	 * @throws IOException
	 */
	private void findById(HttpServletRequest request, HttpServletResponse response, String articleId)
			throws ServletException, IOException {

		Article article = articleService.finById(Integer.parseInt(articleId));
		String actType = request.getParameter("actType"); // 查询类型 没有代表查询 有就代表修改
		if (StringUtil.isNotEmpty(actType)) {
			ResultInfo resultInfo = new ResultInfo();
			resultInfo.setResult(article);
			resultInfo.setMsg(Constant.SUCCESS_MSG);
			resultInfo.setCode(Constant.SUCCESS_CODE);
			JsonUtil.toJson(resultInfo, response);
			return;
		}

		request.setAttribute("article", article);
		// 获取用户信息
		UserVo userVo = userService.findById(article.getUserId());
		request.setAttribute("userVo", userVo);

		// 判断此用户是否为登录用户
		boolean isLogin = false;
		LoginUserIdentity loginUserIdentity = (LoginUserIdentity)request.getSession()
				.getAttribute(Constant.LOGIN_USER_KEY);
		if (loginUserIdentity != null && loginUserIdentity.getUserName().equals(article.getAuthor())) {
			isLogin = true;
		}
		request.setAttribute("isLogin", isLogin);
		// 更新点击量
		articleService.updateHits(article.getId());
		request.getRequestDispatcher("article-detail.jsp").forward(request, response);
	}

	/**
	 * 分页查询
	 * @param request
	 * @param response
	 */
	private void selectForPage(HttpServletRequest request, HttpServletResponse response) {
		ArticleDto articleDto = RequestParamsUtil.requestToBean(request, ArticleDto.class);
		// 分页获取文章
		PageList<Article> result = articleService.selectForPage(articleDto);
		Paginator paginator = result.getPaginator();
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setResult(result);
		resultInfo.setMsg(Constant.SUCCESS_MSG);
		resultInfo.setCode(Constant.SUCCESS_CODE);
		resultInfo.setPaginator(paginator);
		JsonUtil.toJson(resultInfo, response);
	}

	/**
	 * 添加或修改
	 * @param response
	 * @param article
	 */
	private void addOrUpdate(HttpServletResponse response,
							 HttpServletRequest request, Article article) {
		ResultInfo resultInfo = new ResultInfo();
		try {
			LoginUserIdentity loginUserIdentity = (LoginUserIdentity)request.getSession()
					.getAttribute(Constant.LOGIN_USER_KEY);
			articleService.addOrUpdate(article, loginUserIdentity.getUserName());
			resultInfo.setCode(200);
			resultInfo.setMsg(Constant.SUCCESS_MSG);
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
