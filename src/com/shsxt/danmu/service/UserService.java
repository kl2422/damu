package com.shsxt.danmu.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.shsxt.danmu.dao.UserDao;
import com.shsxt.danmu.dao.WisdomDao;
import com.shsxt.danmu.exception.ParamException;
import com.shsxt.danmu.model.User;
import com.shsxt.danmu.model.Wisdom;
import com.shsxt.danmu.util.StringUtil;
import com.shsxt.danmu.vo.LoginUserIdentity;
import com.shsxt.danmu.vo.UserVo;

/**
 * Created by TW on 2017/9/29.
 */
public class UserService {

	UserDao userDao = new UserDao();

	WisdomDao wisdomDao = new WisdomDao();

	public boolean updateBasicInfo(UserVo user, String oldPwd) {
		UserVo temp = this.findById(user.getId());
		Map<String, Object> params = new HashMap<String, Object>();
		if (temp != null) {
			if (StringUtil.isNotEmpty(user.getUserName())) {
				// 修改基本信息
				String user_name = user.getUserName();
				params.put("user_name", user_name);
				String email = user.getEmail();
				params.put("email", email);
				String mood = user.getMood();
				params.put("mood", mood);
				String blog_name = user.getBlogName();
				params.put("blog_name", blog_name);
				int result = userDao.update(params, user.getId());
				return result > 0 ? true : false;

			} else if (StringUtil.isNotEmpty(user.getUserPwd())) {
				// 修改密码
				if (temp.getUserPwd().equals(oldPwd)) {
					String user_pwd = user.getUserPwd();
					params.put("user_pwd", user_pwd);
					int result = userDao.update(params, user.getId());
					return result > 0 ? true : false;

				}
				// 旧密码错误
				return false;

			} else if (StringUtil.isNotEmpty(user.getBlogName())) {
				// 修改名言, 如果已经存在->修改，不存在->添加
				Wisdom tempWisdom = wisdomDao.findUserWisdom(user.getId());
				if(tempWisdom==null){
					//添加
					return wisdomDao.insertWisdom(user.getWisdom())>0?true:false;
					
				}else{
					// 修改
					return wisdomDao.updateWisdom(user.getWisdom())>0?true:false;
				}
			}

		}
			return false;
	}

	/**
	 * 注册
	 * 
	 * @param userName
	 * @param userPwd
	 * @return
	 */
	public LoginUserIdentity signUp(String userName, String userPwd) {

		// 基本参数验证
		checkParams(userName, userPwd);

		// 用户名唯一验证
		User user = userDao.findByUserName(userName.trim());
		if (user != null) {
			throw new ParamException("该账户已注册, 请登陆");
		}
		// 插入数据库
		userDao.insert(userName.trim(), userPwd);
		// 返回注册实体
		LoginUserIdentity loginUserIdentity = buildLoginUserIdentity(userName, userPwd);
		return loginUserIdentity;

	}

	/**
	 * 登陆
	 * 
	 * @param userName
	 * @param userPwd
	 * @return
	 */
	public LoginUserIdentity signIn(String userName, String userPwd) {

		// 基本参数验证
		checkParams(userName, userPwd);

		// 验证用户名密码是否正确
		User user = userDao.checkLoginUser(userName.trim(), userPwd);
		if (user == null) {
			throw new ParamException("账户输入有误，请重新输入");
		}

		// 返回登陆实体
		LoginUserIdentity loginUserIdentity = buildLoginUserIdentity(userName, userPwd);
		return loginUserIdentity;
	}

	/**
	 * 查询登录用户的信息
	 * 
	 * @param userName
	 * @return
	 */
	public UserVo findUserProfile(String userName) throws Exception {
		User user = userDao.findByUserName(userName);
		UserVo userVo = new UserVo();
		// copy属性
		BeanUtils.copyProperties(userVo, user);
		// 查询用户的名言名句
		Wisdom wisdom = wisdomDao.findUserWisdom(user.getId());
		if (wisdom != null) {
			userVo.setWisdom(wisdom);
		}
		return userVo;
	}

	/**
	 * 根据用户名查询
	 * 
	 * @param userName
	 * @return
	 */
	public User findByUserName(String userName) {
		User user = userDao.findByUserName(userName);
		return user;
	}

	/**
	 * 根据用户ID查询
	 * 
	 * @param userId
	 * @return
	 */
	public UserVo findById(Integer userId) {
		try {
			User user = userDao.findById(userId);
			UserVo userVo = new UserVo();
			// copy属性
			BeanUtils.copyProperties(userVo, user);
			// 查询用户的名言名句
			Wisdom wisdom = wisdomDao.findUserWisdom(user.getId());
			if (wisdom != null) {
				userVo.setWisdom(wisdom);
			}
			return userVo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 用户名 密码非空验证
	 * 
	 * @param userName
	 * @param userPwd
	 */
	private void checkParams(String userName, String userPwd) {
		if (!StringUtil.isNotEmpty(userName)) {
			throw new ParamException("请输入用户名");
		}
		if (!StringUtil.isNotEmpty(userPwd)) {
			throw new ParamException("请输入密码");
		}
	}

	/**
	 * 构建登录、注册实体
	 * 
	 * @param userName
	 * @param email
	 * @return
	 */
	private LoginUserIdentity buildLoginUserIdentity(String userName, String email) {
		LoginUserIdentity loginUserIdentity = new LoginUserIdentity();
		loginUserIdentity.setEmail(email.trim());
		loginUserIdentity.setUserName(userName.trim());
		return loginUserIdentity;
	}

}
