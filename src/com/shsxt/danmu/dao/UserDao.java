package com.shsxt.danmu.dao;

import com.shsxt.danmu.model.User;
import com.shsxt.danmu.util.DBUtil;

/**
 * Created by TW on 2017/9/29.
 */
public class UserDao {

    public User findByUserName(String userName) {
        String sql = "select id, user_name, user_pwd, email, header_image,"
                    + " mood, blog_name from t_user where user_name = ?";
        User user = DBUtil.queryBean(User.class, sql, userName);
        return user;
    }
    public User findById(Integer userId) {
        String sql = "select id, user_name, user_pwd, email, header_image,"
                + " mood, blog_name from t_user where id = ?";
        User user = DBUtil.queryBean(User.class, sql, userId);
        return user;
    }

    public void insert(String userName, String userPwd) {
        String sql = "insert into t_user (user_name, user_pwd, is_valid, create_date, update_date) " +
                " values (?, ?, 1, now(), now())";
        DBUtil.update(sql, userName, userPwd);
    }

    public User checkLoginUser(String userName, String userPwd) {
        String sql = "select id, user_name, user_pwd, email from t_user " +
                " where (user_name = ? or email = ?) and user_pwd = ?";
        User user = DBUtil.queryBean(User.class, sql, userName, userName, userPwd);
        return user;
    }
}
