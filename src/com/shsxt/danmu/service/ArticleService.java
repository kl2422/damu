package com.shsxt.danmu.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.apache.commons.lang3.time.DateFormatUtils;

import com.shsxt.danmu.dao.ArticleDao;
import com.shsxt.danmu.dto.ArticleDto;
import com.shsxt.danmu.exception.ParamException;
import com.shsxt.danmu.model.Article;
import com.shsxt.danmu.model.User;
import com.shsxt.danmu.util.PageList;
import com.shsxt.danmu.util.Paginator;
import com.shsxt.danmu.util.StringUtil;
import com.shsxt.danmu.vo.TagVo;

public class ArticleService {
	
	private ArticleDao articleDao = new ArticleDao();
	private UserService userService = new UserService();
	
	/**
	 * 分页查询
	 * @param articleDto
	 * @return
	 */
	public PageList<Article> selectForPage(ArticleDto articleDto) {
		Long total = articleDao.count(articleDto);
		if (total == null || total == 0) { // 如果没值直接返回
			return new PageList<>();
		}
		articleDto.setSort("update_date.desc");
		List<Article> datas = articleDao.selectForPage(articleDto);

		// 格式化数据
		formatArticles(datas);

		Paginator paginator = new Paginator(articleDto.getPage(), articleDto.getPageSize(), total);
		PageList<Article> pageInfo = new PageList<>(datas, paginator);
		return pageInfo;
	}

	/**
	 * 获取热门的三篇文章
	 * @return
	 */
    public List<Article> findHotArticles() {
		ArticleDto articleDto = new ArticleDto();
		articleDto.setPageSize(3);
		articleDto.setSort("hits.desc");
		List<Article> result = articleDao.selectForPage(articleDto);
		for (Article article: result) {
			Date uptDate = article.getUpdateDate();
			if (uptDate == null) {
				continue;
			}
			String dateStr = DateFormatUtils.format(article.getUpdateDate(), "MMM d", Locale.ENGLISH);
			article.setMonth(dateStr.split(" ")[0]);
			article.setDay(Integer.parseInt(dateStr.split(" ")[1]));
		}
		return result;
    }

	/**
	 * 获取所有的tag标签
	 * @return
	 */
	public List<TagVo> findAllTags(String queryTag) {

		// 去重
		Set<String> tagsRemoveDuplicates = queryTags();

		List<String> queryTags = new ArrayList<>();
		if (StringUtil.isNotEmpty(queryTag)) {
			queryTags = Arrays.asList( queryTag.split(","));
		}

		// 格式化
		List<TagVo> results = format(tagsRemoveDuplicates, queryTags);
		return results;
	}

	/**
	 * 根据ID获取详情
	 * @param id
	 * @return
	 */
	public Article finById(Integer id) {
		if (id == null || id < 1) {
			throw new ParamException("请选择一个视频进行查看");
		}
		Article article = articleDao.findById(id);
		formatSigleArticle(article);
		return article;
	}

	/**
	 * 添加或者修改
	 * @param article
	 */
	public void addOrUpdate(Article article, String loginUserName) {

		// 基本参数验证
		checkParam(article, loginUserName);

		// 通过登录用户名获取用户id
		User user = userService.findByUserName(loginUserName.trim());
		if (user == null) {
			throw new ParamException(201, "请登录");
		}
		if (article.getId() == null) { // 添加
			article.setUserId(user.getId());
			String tags = article.getTags();
			if (tags.indexOf(",") != 0) {
				tags = "," + tags + ",";
			}
			articleDao.insert(article);
			return;
		}
		// 修改
		// 先根据ID查询记录是否存在 在赋值，在更新
		update(article);
	}

	/**
	 * 删除视频
	 * @param id
	 * @param loginUserName
	 */
	public void delete(Integer id, String loginUserName) {
		if (id == null || id < 1) {
			throw new ParamException("请选择要删除的视频");
		}
		// 通过登录用户名获取用户id
		User user = userService.findByUserName(loginUserName.trim());
		if (user == null) {
			throw new ParamException(201, "请登录");
		}
		articleDao.delete(id, user.getId());
	}

	/**
	 * 增加点击量
	 * @param id
	 */
	public void updateHits(Integer id) {
		if (id == null || id < 1) {
			throw new ParamException("请选择要删除的视频");
		}
		articleDao.updateHits(id);
	}

	/**
	 * 格式化结果集
	 * @param articles
	 */
	private void formatArticles (List<Article> articles) {
		for(Article article: articles) {
			if (article == null) {
				continue;
			}
			formatSigleArticle(article);
		}
	}

	/**
	 * 格式化单个
	 * @param article
	 */
	private void formatSigleArticle(Article article) {
		String tags = article.getTags(); // ,abc,bcd,
		if (StringUtil.isNotEmpty(tags)) {
			tags = tags.substring(tags.indexOf(",") + 1, tags.lastIndexOf(","));
			article.setTags(tags);
			String[] tagArr = tags.split(",");
			List<String> tagList = Arrays.asList(tagArr);
			article.setTagList(tagList);
		}

		Date updateDate = article.getUpdateDate();
		if (updateDate != null) {
			String updateDateStr = DateFormatUtils.format(updateDate, "yyyy-MM-dd HH:mm");
			article.setUpdateDateStr(updateDateStr);
		}
	}

	/**
	 * 去重
	 * @return
	 */
	private Set<String> queryTags() {
		List<String> tags = articleDao.findAllTags(); // 有可能是[",热门,abc", "动画"] 这样的数组
		if (tags == null || tags.size() < 1) {
			return Collections.emptySet();
		}

		// 去重
		Set<String> tagsRemoveDuplicate = new HashSet<>();
		for (String tag : tags) { // ,动画,好玩
			String[] tagArr = tag.split(",");
			if (tagArr.length > 2) {
				for(String tg : tagArr) {
					if (StringUtil.isNotEmpty(tg)) {
						tagsRemoveDuplicate.add(tg);
					}
				}
			} else {
				tagsRemoveDuplicate.add(tagArr[1]);
			}
		}
		return tagsRemoveDuplicate;
	}

	/**
	 * 格式化结果
	 * @param tags
	 * @param queryTags
	 * @return
	 */
	private List<TagVo> format(Set<String> tags, List<String> queryTags) {
		List<TagVo> results = new ArrayList<>();
		for (String tag: tags) {
			TagVo tagVo = new TagVo();
			tagVo.setTag(tag);
			if (queryTags.contains(tag)) {
				tagVo.setSelected(true);
			} else {
				tagVo.setSelected(false);
			}
			results.add(tagVo);
		}
		return results;
	}

	/**
	 * 基本参数验证
	 * @param article
	 * @param loginUserName
	 */
	private static void checkParam(Article article, String loginUserName) {
		if (StringUtil.isEmpty(loginUserName)) {
			throw new ParamException(200, "请登录");
		}
		String title = article.getTitle();
		if (StringUtil.isEmpty(title)) {
			throw new ParamException("请输入标题");
		}
		if (title.trim().length() > 20) {
			throw new ParamException("标题最多20个字，请重新输入");
		}
		String content = article.getContent();
		if (StringUtil.isEmpty(content)) {
			throw new ParamException("请输入描述");
		}
		if (content.trim().length() > 1000) {
			throw new ParamException("内容最多800个字，请重新输入");
		}
		String vedio = article.getVideo();
		if (StringUtil.isEmpty(title)) {
			throw new ParamException("请上传视频");
		}
		String tags = article.getTags();
		if (StringUtil.isEmpty(title)) {
			throw new ParamException("请输入标签");
		}
		if (tags.trim().length() > 100) {
			throw new ParamException("标签最多100个字");
		}
	}

	/**
	 * 更新
	 * @param article
	 */
	private void update(Article article) {
		Article articleFromDb = articleDao.findById(article.getId());
		if (articleFromDb == null) {
			throw new ParamException("该记录不存在，请重试");
		}
		try {
			articleFromDb.setTitle(article.getTitle());
			String tags = article.getTags();
			if (tags.indexOf(",") != 0) {
				tags = "," + tags + ",";
			}
			articleFromDb.setTags(tags);
			articleFromDb.setVideo(article.getVideo());
			articleFromDb.setContent(article.getContent());
		} catch (Exception e) {
			e.printStackTrace();
		}
		articleDao.update(articleFromDb);
	}

}
