package com.shsxt.danmu.web;

import com.shsxt.danmu.constant.Constant;
import com.shsxt.danmu.util.JsonUtil;
import com.shsxt.danmu.vo.ResultInfo;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

@WebServlet("/upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //检查我们是否有文件上传请求
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if(isMultipart){
            //为基于磁盘的文件项创建工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();

            //设置工厂约束
            factory.setSizeThreshold(2*1024);
            //factory.setRepository();

            //创建一个新的文件上传处理程序
            ServletFileUpload upload = new ServletFileUpload(factory);

            //设置整体请求大小约束
            upload.setSizeMax(500*1024*1024);

            //为基于磁盘的文件项创建工厂, 一行抵多行
            //DiskFileItemFactory factory = new DiskFileItemFactory(yourMaxMemorySize，yourTempDirectory);

            //解析请求
            try {
                ResultInfo resultInfo = new ResultInfo();
                Part part = request.getPart("file");
                //处理文件上传
                String fileName = part.getName(); // 上传的文件的名字
                // 目的地
                String path = request.getSession().getServletContext().getRealPath("upload");
                File up = new File(path);
                if(!up.exists()){
                    up.mkdirs();
                }
                String cd = part.getHeader("Content-Disposition");
                //截取不同类型的文件需要自行判断
                String filename = cd.substring(cd.lastIndexOf("=") + 2, cd.length() - 1);
                part.write(path + "/" + filename); // 上传的路径 + 名字
                resultInfo.setCode(Constant.SUCCESS_CODE);
                resultInfo.setResult(fileName);
                JsonUtil.toJson(resultInfo, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}  