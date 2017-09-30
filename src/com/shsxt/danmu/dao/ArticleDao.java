package com.shsxt.danmu.dao;

import java.util.List;

import com.shsxt.danmu.dto.ArticleDto;
import com.shsxt.danmu.model.Article;
import com.shsxt.danmu.util.DBUtil;
import com.shsxt.danmu.util.StringUtil;

public class ArticleDao {
	
	/**
	 * 获取总记录条数
	 * @param articleDto
	 * @return
	 */
	public Long count(ArticleDto articleDto) {
		String sql = "select count(1) as amount from t_article where is_valid = 1";
		// 根据title或者content模糊匹配
		if (StringUtil.isNotEmpty(articleDto.getSearchKey())) {
			sql += " and (content like '%"+ articleDto.getSearchKey() 
				+ "%' or title like '%"+ articleDto.getSearchKey() +"%')";
		}
		// 标签搜索 逗号分隔 可以查询多个eg:动画,好玩
		sql = buildTagQuerySql(articleDto.getTags(), sql);
		return (Long) DBUtil.queryColumn("amount", sql);
	}
	
	/**
	 * 分页获取内容
	 * @param articleDto
	 * @return
	 */
	public List<Article> selectForPage(ArticleDto articleDto) {
		String sql = "select t1.*, t2.user_name as author from t_article t1 " +
				" left join t_user t2 on t1.user_id = t2.id where t1.is_valid = 1";

		// 根据用户ID查询
		if (articleDto.getUserId() != null) {
			sql += " and t1.user_id = " + articleDto.getUserId();
		}
		// 根据title或者content模糊匹配
		if (StringUtil.isNotEmpty(articleDto.getSearchKey())) {
			sql += " and (content like '%"+ articleDto.getSearchKey() 
				+ "%' or title like '%"+ articleDto.getSearchKey() +"%')";
		}

		// 标签搜索 逗号分隔 可以查询多个eg:动画,好玩
		sql = buildTagQuerySql(articleDto.getTags(), sql);

		if (StringUtil.isNotEmpty(articleDto.getSort()) && articleDto.getSort().contains(".")) {
			String sort = articleDto.getSort();
			String[] sorts= sort.split("\\.");
			sql += " order by " + sorts[0] + " " + sorts[1];
		}
		sql += " limit ?, ?";
		int startNum = articleDto.getPageSize() * (articleDto.getPage() - 1);
		return DBUtil.queryBeanList(Article.class, sql, startNum, articleDto.getPageSize());
	}

	/**
	 * 获取所有的tag标签
	 * @return
	 */
	public List<String> findAllTags() {
		String sql = "select tags from t_article where is_valid = 1";
		List<String> tags = DBUtil.queryColumnList("tags", sql);
		return tags;
	}

	/**
	 * 格式化tagsql
	 * @param tags
	 * @param sql
	 */
	private String buildTagQuerySql(String tags, String sql) {
		if (!StringUtil.isNotEmpty(tags)) { // 逗号分隔 可以查询多个eg:动画,好玩
			return sql;
		}
		if (tags.contains(",")) {
			String[] tagarr = tags.split(",");
			String tagsql = "";
			for (String tag: tagarr) {
				tagsql += "tags like '%,"+ tag + ",%' or ";
			}
			sql += " and (" + tagsql.substring(0, tagsql.lastIndexOf("or ")) + ") ";
		} else {
			sql += " and tags like '%,"+ tags + ",%'";
		}
		return sql;
	}

	/**
	 * 根据id获取详情
	 * @param id
	 * @return
	 */
	public Article findById(Integer id) {
		String sql = "select * from t_article where id = ? and is_valid = 1";
		Article article = DBUtil.queryBean(Article.class, sql, id);
		return article;
	}

	/**
	 * 添加
	 * @param article
	 */
	public void insert(Article article) {
		String sql = "insert into t_article (title, content, vedio, user_id, hits, tags, is_valid, create_date, update_date) " +
				" values (?, ?, ?, ?, 0, ?, 1, now(), now())";
		DBUtil.update(sql, article.getTitle(), article.getContent(),
				article.getVideo(), article.getUserId(), article.getTags());
	}

	/**
	 * 更新
	 * @param article
	 */
	public void update(Article article) {
		String sql = "update t_article set title = ?, content = ?, vedio = ?, " +
				"user_id = ?, tags = ?, update_date = now() where id = ?";
		DBUtil.update(sql, article.getTitle(), article.getContent(),
				article.getVideo(), article.getUserId(), article.getTags(), article.getId());
	}
}
