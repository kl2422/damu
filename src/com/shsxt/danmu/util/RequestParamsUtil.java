package com.shsxt.danmu.util;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.IOUtils;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * 从request中获取参数
 */
public class RequestParamsUtil {

    /**
     * 参数转对象
     * @param request
     * @param clazz
     * @param <T>
     * @return
     */
    public static <T> T requestToBean(HttpServletRequest request, Class<T> clazz) {
        try {
            T bean = clazz.newInstance();   //实例化随意类型   
            Enumeration<String> en = request.getParameterNames();   //获得参数的一个列举    
            while (en.hasMoreElements()) {         //遍历列举来获取所有的参数  
                String name = en.nextElement();
                String value = request.getParameter(name);
                //注意这里导入的是  import org.apache.commons.beanutils.BeanUtils;
                BeanUtils.setProperty(bean, name, value);
            }
            return bean;
        } catch (Exception e) {
            throw new RuntimeException(e);  //如果错误 则向上抛运行时异常  
        }
    }

    /**
     * 从request流中获取参数：如果是基于restful风格的请求比如put、delete等，
     * 请求参数一般放入request body中 这样request.getParameter()获取不到，
     * 只能通过流获取
     * @param request
     * @return
     */
    public static Map<String, String> formatParams(HttpServletRequest request) {

        try {
            // 获取请求的参数字符串userName=abc&userPwd=1234
            String params = IOUtils.toString(request.getInputStream(), "utf-8");
            params = URLDecoder.decode(params, "UTF-8");
            Map<String, String> mapParams = new HashMap<>();
            String[] arrSplit = params.split("&");
            for(String strSplit : arrSplit) {
                String[] arrSplitEqual = strSplit.split("=");
                //解析出键值
                if(arrSplitEqual.length < 1) {
                    continue;
                }
                //正确解析
                String val = URLDecoder.decode(arrSplitEqual[1], "utf-8");
                mapParams.put(arrSplitEqual[0], val);
            }
            return mapParams;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 从request流中获取参数：如果是基于restful风格的请求比如put、delete等，
     * 请求参数一般放入request body中 这样request.getParameter()获取不到，
     * 只能通过流获取
     * @param request
     * @param clazz
     * @param <T>
     * @return
     */
    public static <T> T formatParams(HttpServletRequest request, Class<T> clazz) {
        try {
            // 获取请求的参数字符串userName=abc&userPwd=1234
            String params = IOUtils.toString(request.getInputStream(), "utf-8");
            T bean = clazz.newInstance();   //实例化随意类型
            String[] arrSplit = params.split("&");
            for(String strSplit : arrSplit) {
                String[] arrSplitEqual = strSplit.split("=");
                //解析出键值
                if(arrSplitEqual.length < 1) {
                    continue;
                }
                //注意这里导入的是  import org.apache.commons.beanutils.BeanUtils;
                String val = URLDecoder.decode(arrSplitEqual[1], "utf-8");
                BeanUtils.setProperty(bean, arrSplitEqual[0], val);
            }
            return bean;
        } catch (Exception e) {
            throw new RuntimeException(e);  //如果错误 则向上抛运行时异常
        }
    }
}