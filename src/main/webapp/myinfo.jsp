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
		  
		  
		  
		<div style="margin: 0 auto;width: 80%;height: 600px;">
			<div style="margin: 0 auto;width: 80%;">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				  <legend>个人信息</legend>
				</fieldset>
				<form class="layui-form" >
						<div class="layui-form-item">
							<label class="layui-form-label">用户姓名</label>
							<div class="layui-input-block">
							      <input value="${sessionScope.get("info").getRealname()}" type="text" name="pname" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入姓名" autocomplete="off" class="layui-input">
							</div>
						</div>
						<br />
						<div class="layui-form-item">
							<label class="layui-form-label">地址</label>
							<div class="layui-input-block">
							      <input value="${sessionScope.get("info").getAddr()}" type="text" name="addr" lay-verify="required" lay-reqtext="必填项，岂能为空？" placeholder="请输入你的地址" autocomplete="off" class="layui-input">
							</div>
						</div>
						<br />
						<div class="layui-form-item">
							<label class="layui-form-label">手机号</label>
							<div class="layui-input-block">
							      <input value="${sessionScope.get("info").getPhone()}" type="tel" name="phone" lay-verify="required|phone" lay-reqtext="必填项，岂能为空？" placeholder="请输入你的手机号" autocomplete="off" class="layui-input">
							</div>
						</div>
						<br />
						<div class="layui-form-item">
							<label class="layui-form-label">邮箱</label>
							<div class="layui-input-block">
							      <input value="${sessionScope.get("info").getEmail()}" type="tel" name="email" lay-verify="required|email" lay-reqtext="必填项，岂能为空？" placeholder="请输入你的邮箱" autocomplete="off" class="layui-input">
							</div>
						</div>
						<br />
					<div style="margin: 0 auto;width: 100px;height: 100px;">
						<button type="submit" lay-filter="sub" lay-submit="" class="layui-btn layui-btn-normal layui-btn-radius">提交</button>
					</div>
				</form>
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
		layui.use(['form'], function() {
			var form = layui.form;
			//自定义验证规则
			form.verify({
				required: function(value){
					if(value.length < 2&&value!=null){
						return '文本需大于2字节，且不等于空';
					}
				}
			});
			form.on('submit(sub)', function(data){
				$.ajax({
					//以键值对发送
					url:"./update",//请求地址
					async: false,
					type:"post",//请求的方式
					data:data.field,//传递的参数
					dataType:"text",//返回值类型
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

	</script>
		  
	</body>
</html>
