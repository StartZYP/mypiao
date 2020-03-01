<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>超级票务系统</title>
		<link rel="stylesheet" href="<%=basePath %>/layui/css/layui.css" media="all">
	</head>
	<body>
		<div class="layui-row" style="margin: 0 auto;width: 80%; height: 80px;">
		    <div class="layui-col-md9">
		      <ul class="layui-nav" lay-filter="">
				  <li class="layui-nav-item"><a href="<%=basePath %>/user/index">主页</a></li>
		          <li class="layui-nav-item"><a href="<%=basePath %>/product/list">最新售票发布</a></li>
		      </ul>
		    </div>
			<div class="layui-col-md3">
				<c:if test="${sessionScope.get('username')==null}">
					<ul class="layui-nav">
						<li class="layui-nav-item"><a href="<%=basePath %>/user/loginpage">登陆</a></li>
						<li class="layui-nav-item"><a href="<%=basePath %>/user/loginpage">注册</a></li>
					</ul>
				</c:if>
				<ul class="layui-nav">
					<c:if test="${sessionScope.get('username')!=null}">
						<li class="layui-nav-item">
							<a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">${sessionScope.get('username')}</a>
							<dl class="layui-nav-child">
								<dd><a href="<%=basePath %>/foder/mybuy">我的购买</a></dd>
								<dd><a href="<%=basePath %>/user/info">个人信息</a></dd>
								<dd><a href="<%=basePath %>/user/logout">退出登录</a></dd>
							</dl>
						</li>
					</c:if>
					<%--<c:if test="${sessionScope.get('username')=='admin'}">--%>
						<%--<li class="layui-nav-item"><a href="<%=basePath %>/user/loginpage">管理系统</a></li>--%>
					<%--</c:if>--%>
				</ul>
			</div>
		  </div>
		  <div style="margin: 0 auto;" class="layui-carousel" id="test1" >
		    <div carousel-item="">
		        <div><img style="width: 100%; height: 100%;" src="<%=basePath %>/img/lunbo/1.jpg"></div>
		        <div><img style="width: 100%; height: 100%;" src="<%=basePath %>/img/lunbo/2.jpg"></div>
		        <div><img style="width: 100%; height: 100%;" src="<%=basePath %>/img/lunbo/3.jpg"></div>
		      </div>
		  </div> 
		  
		  <div style="padding: 20px; background-color: #F2F2F2;width: 80%;margin: 0 auto;margin-top: 20px;">
		    <div class="layui-row layui-col-space15">
		      <div class="layui-col-md6">
		        <div class="layui-card">
		          <div class="layui-card-header">最新票务</div>
		          <div class="layui-card-body">
		            [韶关] MY BEAUTIFUL LIVE  杨千嬅世界巡回演唱会-韶关<br>
		            从而映衬出边框投影
		          </div>
		        </div>
		      </div>
		      <div class="layui-col-md6">
		        <div class="layui-card">
		          <div class="layui-card-header">网站公告</div>
		          <div class="layui-card-body">
		            下周将维护票务系统<br>
		            新增各类功能
		          </div>
		        </div>
		      </div>
		      <div class="layui-col-md12">
		        <div class="layui-card">
		          <div class="layui-card-header">2020任贤齐"齐迹"巡回演唱会 呼和浩特站</div>
		          <div class="layui-card-body">
		            许巍"无尽光芒"巡回演唱会-太原站
		          </div>
		        </div>
		      </div>
		    </div>
		  </div> 
		  
		 <div style="margin: 0 auto;width: 80%; height: 60px;margin-top: 30px;" class="layui-fluid">
		   <fieldset class="layui-elem-field layui-field-title">
		     <legend>票务网站网站关于</legend>
		   </fieldset>
		   <div class="layui-row">
		     <div class="layui-col-sm3">
		       <div class="grid-demo grid-demo-bg1">新手指南</div>
		     </div>
		     <div class="layui-col-sm3">
		       <div class="grid-demo">发票说明</div>
		     </div>
		     <div class="layui-col-sm3">
		       <div class="grid-demo grid-demo-bg1">公司关于</div>
		     </div>
		     <div class="layui-col-sm3">
		       <div class="grid-demo">售价投诉</div>
		     </div>
		   </div>
		 </div>
		 
		  <script src="<%=basePath %>/layui/layui.all.js"></script>
		  <script>
		  layui.use('carousel', function(){
		    var carousel = layui.carousel;
		    //建造实例
		    carousel.render({
		      elem: '#test1'
		      ,width: '80%' //设置容器宽度
		      ,arrow: 'always'
			  
		      //,anim: 'updown' //切换动画方式
		    });
		  });
		  </script>
	</body>
</html>
