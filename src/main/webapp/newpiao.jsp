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
			<c:if test="${sessionScope.get('username')!=null}">
				<a class="layui-btn layui-btn-xs" lay-event="buy">购买</a>
			</c:if>
		  <c:if test="${sessionScope.get('username')=='admin'}">
			  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		  </c:if>
		</script>
		<div class="layui-row" style="margin: 0 auto;width: 80%; height: 80px;">
			<div class="layui-col-md9">
				<ul class="layui-nav" lay-filter="">
					<li class="layui-nav-item"><a href="<%=basePath %>/user/index">主页</a></li>
					<li class="layui-nav-item layui-this"><a href="<%=basePath %>/product/list">最新售票发布</a></li>
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
		  
		  <div style="background-color: #F2F2F2;margin:0 auto;width: 80%;padding: 10px;">
		    <div class="layui-row layui-col-space15">
		      <div class="layui-col-md6">
		        <div class="layui-card">
		          <div class="layui-card-header">林宥嘉idol世界巡回演唱会深圳站</div>
		          <div class="layui-card-body">
		            林宥嘉idol世界巡回演唱会深圳站演唱会将于2020-05-16<br>
		            在华润深圳湾体育中心开场演出
		          </div>
		        </div>
		      </div>
		      <div class="layui-col-md6">
		        <div class="layui-card">
		          <div class="layui-card-header">周五夜现场|戏精诞生记：即兴喜剧+脱口秀双拼专场</div>
		          <div class="layui-card-body">
		            隆福剧场（东宫影剧院）-小剧场<br>
		            永乐票务将为您提供演唱会2020演唱会门票在线预订
		          </div>
		        </div>
		      </div>
		      <div class="layui-col-md12">
		        <div class="layui-card">
		          <div class="layui-card-header">《奥特曼·宇宙之光》正版授权超实景儿童舞台剧 支持在线预订</div>
				  <div class="layui-card-header">大船文化·德国原版绘本启蒙交响音乐会《放屁大象吹低音号之熊猫绝密计划》 线上线下同步开启</div>
		        </div>
		      </div>
		    </div>
		  </div> 
		  
		 <div style="margin: 0 auto;width: 80%;">
			 <table  class="layui-hide" id="test" lay-filter="test">
				 <c:if test="${sessionScope.get('username')=='admin'}">
					 <script type="text/html" id="toolbarDemo">
						 <div class="layui-btn-container">
							 <button class="layui-btn layui-btn-sm" lay-event="add">新增数据</button>
						 </div>
					 </script>
				 </c:if>
			 </table>
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
		  layui.use('table', function(){
		    var table = layui.table;
			//监听工具条
			  table.on('tool(test)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'buy'){
			      layer.msg('购买成功');
					$.ajax({
						//以键值对发送
						url:"./buy",//请求地址
						async: false,
						type:"post",//请求的方式
						data:"productname="+data.productname+"&"+"uid="+"${sessionScope.get('username')}"+"&"+"addr="+data.addr+"&"+"groupname="+data.groupname+"&"+"types="+data.types+"&"+"price="+data.price+"&"+"buydate="+data.dates,//传递的参数
						dataType:"text",//返回值类型
						success() {
							//window.location.reload();
						},
						error(err) {
							console.log(err);
						}
					});
			    }else if (obj.event === 'del'){
					layer.confirm('真的删除行么', function(index){
						obj.del();
						layer.close(index);
						$.ajax({
							//以键值对发送
							url:"./delete",//请求地址
							async: false,
							type:"get",//请求的方式
							data:"pid="+data.pid,//传递的参数
							dataType:"text",//返回值类型
							success() {
								//window.location.reload();
							},
							error(err) {
								console.log(err);
							}
						});
					});
				} else if (obj.event === 'update'){

				}
			  });
		    table.render({
		      elem: '#test'
		      ,url:'./listall'
              ,toolbar: '#toolbarDemo'
		      ,title: '用户数据表'
		      ,totalRow: true
		      ,cols: [[
		      	{field:'pid', title:'票号', width:60}
		      	,{field:'productname', title:'票务名称', width:150}
				,{field:'introduction', title:'演绎介绍', width:150}
		        ,{field:'addr', title:'演出地点', width:200}
		        ,{field:'groupname', title:'艺人团体', width:150}
		        ,{field:'types', title:'票务类型', width:120}
		        ,{field:'dates', title:'演出时间', width:150}
				,{field:'price', title:'票务价格', width:100}
				,{field:'num', title:'票务数量', width:100}
				,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:120}
		      ]]
		      ,page: false
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
              //头工具栏事件
              table.on('toolbar(test)', function(obj){
                  var checkStatus = table.checkStatus(obj.config.id);
                  switch(obj.event){
                      case 'add':
						  layer.open({
							  type: 2,
							  title: 'iframe父子操作',
							  maxmin: true,
							  shadeClose: true, //点击遮罩关闭层
							  area : ['800px' , '520px'],
							  content: 'add'
						  });
                          break;
                      case 'getCheckLength':
                          var data = checkStatus.data;
                          layer.msg('选中了：'+ data.length + ' 个');
                          break;
                  };
              });
		  });
		  </script>

	</body>
</html>
