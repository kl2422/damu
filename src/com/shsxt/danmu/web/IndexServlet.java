package com.shsxt.danmu.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shsxt.danmu.dto.ArticleDto;
import com.shsxt.danmu.model.Article;
import com.shsxt.danmu.service.ArticleService;
import com.shsxt.danmu.util.PageList;
import com.shsxt.danmu.util.RequestParamsUtil;
import com.shsxt.danmu.vo.TagVo;

/**
 * 首页
 */
@SuppressWarnings("serial")
@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	
	private ArticleService articleService = new ArticleService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArticleDto articleDto = RequestParamsUtil.requestToBean(request, ArticleDto.class);
		// 分页获取文章
		PageList<Article> result = articleService.selectForPage(articleDto);
		request.setAttribute("result", result);
		request.setAttribute("paginator", result.getPaginator());

		// 获取热门的三篇文章
		List<Article> hotArticles = articleService.findHotArticles();
		request.setAttribute("hotArticles", hotArticles);

		// 获取所有tags标签
		List<TagVo> tags = articleService.findAllTags(articleDto.getTags());
		request.setAttribute("tags", tags);

		// 查询参数返回
		request.setAttribute("articleDto", articleDto);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
