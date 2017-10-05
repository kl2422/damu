package com.shsxt.danmu.dao;

import com.shsxt.danmu.model.Wisdom;
import com.shsxt.danmu.util.DBUtil;

/**
 * Created by TW on 2017/9/29.
 */
public class WisdomDao {

    public Wisdom findUserWisdom(Integer userId) {
        String sql = "select text, author, user_id from t_wisdom where user_id = ?";
        return DBUtil.queryBean(Wisdom.class, sql, userId);
    }
    
    public int updateWisdom(Wisdom wisdom){
    	String sql = "update t_wisdom set text=? , author=? , is_valid=1, update_date=sysdate()";
    	return DBUtil.update(sql, wisdom.getText(),wisdom.getAuthor());
    }
    
    public int insertWisdom(Wisdom wisdom){
    	String sql = "insert into t_wisdom(text,author,user_id, is_valid,create_date,update_date) "
    			+ "values(?,?,?,sysdate(),sysdate())";
    	return DBUtil.update(sql, wisdom.getText(),wisdom.getAuthor(),wisdom.getUserId());
    }
}















