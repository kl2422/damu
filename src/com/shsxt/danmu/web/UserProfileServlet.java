package com.shsxt.danmu.web;

import com.shsxt.danmu.constant.Constant;
import com.shsxt.danmu.model.User;
import com.shsxt.danmu.service.UserService;
import com.shsxt.danmu.util.StringUtil;
import com.shsxt.danmu.vo.LoginUserIdentity;
import com.shsxt.danmu.vo.UserVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by TW on 2017/9/29.
 */
@WebServlet("/profile")
public class UserProfileServlet extends HttpServlet {

    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("userId");
        boolean isLogin = false;
        UserVo userVo = null;
        try {
            if (StringUtil.isNotEmpty(userId)) { // 如果有值代表是从文章列表中点击进入
                userVo = userService.findById(Integer.parseInt(userId));
            } else { // 登录后查询自己的个人中心
                isLogin = true;
                // 从session中获取登录用户名
                LoginUserIdentity loginUserIdentity = (LoginUserIdentity)request.getSession()
                        .getAttribute(Constant.LOGIN_USER_KEY);
                if (loginUserIdentity == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }

                userVo = userService.findUserProfile(loginUserIdentity.getUserName());
            }
            request.setAttribute("isLogin", isLogin);
            request.setAttribute("userVo", userVo);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }

    }
}
