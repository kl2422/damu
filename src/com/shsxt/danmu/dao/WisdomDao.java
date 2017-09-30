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
}
