package com.shsxt.danmu.web;

import com.shsxt.danmu.constant.Constant;
import com.shsxt.danmu.util.JsonUtil;
import com.shsxt.danmu.vo.ResultInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //解析请求
        try {
            ResultInfo resultInfo = new ResultInfo();
            Part part = request.getPart("file");
            // 目的地
            String filePath = "statics/upload";
            String path = request.getServletContext().getRealPath(filePath);
            File up = new File(path);
            if(!up.exists()){
                up.mkdirs();
            }
            // tomcat7获取文件名
            String cd = part.getHeader("Content-Disposition");
            //截取不同类型的文件需要自行判断
            String fileName = cd.substring(cd.lastIndexOf("=") + 2, cd.length() - 1);
            part.write(path + "/" + fileName); // 上传的路径 + 名字
            resultInfo.setCode(Constant.SUCCESS_CODE);
            resultInfo.setResult(filePath + "/" + fileName); // 返回全路径
            JsonUtil.toJson(resultInfo, response);
        } catch (Exception e) {
            e.printStackTrace();
            ResultInfo resultInfo = new ResultInfo();
            resultInfo.setCode(Constant.SUCCESS_CODE);
            resultInfo.setMsg("上传失败");
            JsonUtil.toJson(resultInfo, response);
        }
    }
}  