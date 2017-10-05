package com.shsxt.danmu.dto;

import java.io.Serializable;

/**
 * Created by TW on 2017/9/29.
 */
public class UserDto implements Serializable {
    private String userName;
    private String userPwd;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }
}
