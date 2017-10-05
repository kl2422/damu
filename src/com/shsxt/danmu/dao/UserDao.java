package com.shsxt.danmu.dao;

import java.util.Map;
import java.util.Set;

import com.shsxt.danmu.model.User;
import com.shsxt.danmu.util.DBUtil;

/**
 * Created by TW on 2017/9/29.
 */
public class UserDao {
	/**
	 * 修改用户
	 * @param params   key->名字；value->值  （<id,1>） 
	 * @return
	 */
	public int update(Map<String,Object> params,Integer id){
		StringBuilder sql = new StringBuilder("update t_user set ");
		Set<String> paramNames = params.keySet();
		Object[] paramValues = new Object[paramNames.size()+1];
		int i = 0;
		for(String temp : paramNames){
			sql.append(temp + "=?,");
			paramValues[i] = params.get(temp);
			i++;
		}
		int idx = sql.lastIndexOf(",");
		sql = new StringBuilder(sql.substring(0,idx));
		
		sql.append(" where id=? ");
		paramValues[i] = id;
		
		int result = DBUtil.update(sql.toString(), paramValues);
		
		return result;
	}
	

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
