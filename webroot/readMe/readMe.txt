一、项目说明
	
		用户发表视频，查看制品，评论视频，给视频加标签
		
二、功能说明

	1、用户登录注册
	
	2、用户个人信息修改
	
	3、视频列表展示
	
	4、视频分类查询展示
	
	5、视频编辑
	
三、流程简介

	1、登录  （login.jsp） --> user（servlet） --> profile
		
		已经登录过的（从其他地方来），根据id查询即可
		
		此时为登录过来：user中已经做了登录（存放了session），则获取session中的数据，并根据name获取Vo
		
		profile.jsp 
		
	2、profile.jsp展示用户信息（名称，说明，名言），用户所有视频信息，分页
	
		profile.jsp --> search框-> index(servlet) --> index.jsp
		
		article(servlet) 
		
		profile(servlet)
		
	
			
		
		
		
		
		
*****  用户信息修改
*****  头像上传
		
		
1、用户信息修改
	
	profile.jsp --> user(get servlet)
			
		查询数据，回显（userVo）--> user-edit.jsp
		
		修改信息后还需要同时更新session中的信息
		


ajax请求不能使用request.getQueryString?????????????

	