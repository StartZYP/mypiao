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
		<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
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
		  
		  <div style="margin: 0 auto;width: 80%; height: 200px;" class="layui-row">
		      <div class="layui-col-xs12 layui-col-md8">
		        <div class="grid-demo grid-demo-bg1">
					<div class="layui-carousel" id="test1" >
					  <div carousel-item="">
					      <div><img style="width: 100%; height: 100%;" src="<%=basePath %>/img/lunbo/1.jpg"></div>
					      <div><img style="width: 100%; height: 100%;" src="<%=basePath %>/img/lunbo/2.jpg"></div>
					      <div><img style="width: 100%; height: 100%;" src="<%=basePath %>/img/lunbo/3.jpg"></div>
					    </div>
					</div> 
				</div>
		      </div>

				  <div  class="layui-col-xs6 layui-col-md4">
					  <div style="margin-top: 80px;" class="grid-demo">
						  <form class="layui-form" id="loginfrom" action="<%=basePath %>user/" method="post">
							  <div class="layui-form-item">
								  <div style="color: red;margin: 0 auto;"><b>${sessionScope.get('msg')}</b></div>
								  <label class="layui-form-label">用户名</label>
								  <div class="layui-input-block">
									  <input type="text" name="username" lay-verify="title"  autocomplete="off" placeholder="请输入用户名" class="layui-input">
								  </div>
							  </div>

							  <div class="layui-form-item">
								  <label class="layui-form-label">密码  .</label>
								  <div class="layui-input-block">
									  <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
								  </div>
							  </div>
							  <button type="submit" lay-filter="login" lay-submit="" style="margin-left: 110px;" class="layui-btn layui-btn-normal">登陆</button>
							  <button type="submit" lay-filter="reg" lay-submit="" style="margin-left: 30px;" class="layui-btn layui-btn-normal">注册</button>

						  </form>

					  </div>
				  </div>

		    </div>
		  
		  
		  
		 <div style="margin: 0 auto;width: 80%; height: 60px;margin-top: 100px;" class="layui-fluid">
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
		      ,width: '100%' //设置容器宽度
		      ,arrow: 'always'
		  			  
		      //,anim: 'updown' //切换动画方式
		    });
		  });

		  layui.use(['form'], function() {
			  var form = layui.form;
			  //自定义验证规则
			  form.verify({
				  title: function(value){
					  if(value.length < 5&&value!=null){
						  return '用户名必须大于五个字符，且不等于空';
					  }
				  }
				  ,pass: [
					  /^[\S]{6,12}$/
					  ,'密码必须6到12位，且不能出现空格'
				  ]
			  });





			  form.on('submit(reg)', function(data){
				  $.ajax({
					  //以键值对发送
                      url:"./register",//请求地址
                      async: false,
					  type:"post",//请求的方式
					  data:data.field,//传递的参数
					  dataType:"html",//返回值类型
					  success(result) {
						  window.location.reload();
					  },
					  error(err) {
						  console.log(err);
					  }
				  });

				  return false;
			  });

              form.on('submit(login)', function(data){
                  $.ajax({
                      //以键值对发送
                      "url":"./login",//请求地址
                      "type":"post",//请求的方式
                      "data":data.field,//传递的参数
                      "dataType":"html",
					  async: false,
					  success(result) {
						  window.location.reload();
					  },
					  error(err) {
						  console.log(err);
					  }
                  });
                  return false;
              });
		  });

		  layui.use('element', function(){
			  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

			  //监听导航点击
			  element.on('nav(demo)', function(elem){
				  //console.log(elem)
				  layer.msg(elem.text());
			  });
		  });
		  </script>
	</body>
</html>
