package com.shsxt.danmu.service;

import com.shsxt.danmu.dao.UserDao;
import com.shsxt.danmu.dao.WisdomDao;
import com.shsxt.danmu.exception.ParamException;
import com.shsxt.danmu.model.User;
import com.shsxt.danmu.model.Wisdom;
import com.shsxt.danmu.util.StringUtil;
import com.shsxt.danmu.vo.LoginUserIdentity;
import com.shsxt.danmu.vo.UserVo;
import org.apache.commons.beanutils.BeanUtils;

/**
 * Created by TW on 2017/9/29.
 */
public class UserService {

    UserDao userDao = new UserDao();

    WisdomDao wisdomDao = new WisdomDao();

    /**
     * 注册
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
     * @param userName
     * @return
     */
    public User findByUserName(String userName) {
        User user = userDao.findByUserName(userName);
        return user;
    }

    /**
     * 根据用户ID查询
     * @param userId
     * @return
     */
    public UserVo findById(Integer userId)  {
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
