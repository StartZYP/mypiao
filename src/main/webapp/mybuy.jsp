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
    <script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="chupiao">出票</a>
    </script>
		<div class="layui-row" style="margin: 0 auto;width: 80%; height: 80px;">
		    <div class="layui-col-md9">
		      <ul class="layui-nav" lay-filter="">
		        <li class="layui-nav-item layui-this"><a href="">主页</a></li>
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
					<c:if test="${sessionScope.get('username')=='admin'}">
						<li class="layui-nav-item"><a href="<%=basePath %>/user/loginpage">管理系统</a></li>
					</c:if>
				</ul>
			</div>
		  </div>
		  
		
		  <div style="margin: 0 auto;width: 80%;">
			  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			    <legend>我的订单</legend>
			  </fieldset>
			  <div class="layui-form">
                  <table class="layui-hide" id="test" lay-filter="test">

                  </table>
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
            layui.use('table', function(){
                var table = layui.table;

				table.on('tool(test)', function(obj){
					var data = obj.data;
					if(obj.event === 'chupiao'){
						layer.msg('机器出票成功');
						$.ajax({
							//以键值对发送
							url:"./update",//请求地址
							async: false,
							type:"get",//请求的方式
							data:"fid="+data.fid,//传递的参数
							dataType:"text",//返回值类型
							success() {
								window.location.reload();
							},
							error(err) {
								console.log(err);
							}
						});
					}

				});


                table.render({
                    elem: '#test'
                    ,url:'./list'
                    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    ,cols: [[
                        {field:'fid', title: 'ID', sort: true}
                        ,{field:'uid', title: '用户名'} //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
                        ,{field:'productname', title: '票务名称', sort: true}
                        ,{field:'addr', title: '演出地址'}
                        ,{field:'groupname', title: '团体名称'}
                        ,{field:'types', title: '票务类型', align: 'center'} //单元格内容水平居中
                        ,{field:'price', title: '票价', sort: true, align: 'right'} //单元格内容水平居中
                        ,{field:'buydate', title: '购买时间', sort: true, align: 'right'}
                        ,{field:'status', title: '出票状态', sort: true, align: 'right'}
                        ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
                    ]]
					,response: {
						statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
					}
                    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": "200", //解析接口状态
                            "msg": "", //解析提示文本
                            "count": "30", //解析数据长度
                            "data": res //解析数据列表
                        };
                    }
                });

            });
        </script>
	</body>
</html>
