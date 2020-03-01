<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/26
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title></title>
    <link rel="stylesheet" href="<%=basePath %>/layui/css/layui.css" media="all">
</head>
<body>
<div style="margin: 0 auto;width: 80%;height: 600px;">
    <div style="margin: 0 auto;width: 80%;">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>管理员添加票务</legend>
        </fieldset>
        <form class="layui-form" id="loginfrom" action="<%=basePath %>product/add" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">票务名称</label>
                <div class="layui-input-block">
                    <input type="text" name="productname" lay-verify="required" lay-reqtext="票务名称不可为空" placeholder="请输入票务名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <br />
            <div class="layui-form-item">
                <label class="layui-form-label">演出地址</label>
                <div class="layui-input-block">
                    <input type="text" name="addr" lay-verify="required" lay-reqtext="必填项，岂能为空？" placeholder="演出地址" autocomplete="off" class="layui-input">
                </div>
            </div>
            <br />
            <div class="layui-form-item">
                <label class="layui-form-label">演出介绍</label>
                <div class="layui-input-block">
                    <input type="text" name="introduction" lay-verify="required" lay-reqtext="必填项，岂能为空？" placeholder="演出类型" autocomplete="off" class="layui-input">
                </div>
            </div>
            <br>
            <div class="layui-form-item">
                <label class="layui-form-label">演出类型</label>
                <div class="layui-input-block">
                    <input type="text" name="types" lay-verify="required" lay-reqtext="必填项，岂能为空？" placeholder="演出类型" autocomplete="off" class="layui-input">
                </div>
            </div>
            <br />
            <div class="layui-form-item">
                <label class="layui-form-label">团体名称</label>
                <div class="layui-input-block">
                    <input type="text" name="groupname" lay-verify="required" lay-reqtext="必填项，岂能为空？" placeholder="票数" autocomplete="off" class="layui-input">
                </div>
            </div>
            <br />
            <div class="layui-form-item">
                <label class="layui-form-label">演出时间</label>
                <div class="layui-input-block">
                    <input type="text" name="dates" class="layui-input" lay-verify="required" id="test1" placeholder="yyyy-MM-dd HH:mm:ss">
                </div>
            </div>
            <br />
            <div class="layui-form-item">
                <label class="layui-form-label">票务价格</label>
                <div class="layui-input-block">
                    <input type="tel" name="price" lay-verify="number" lay-reqtext="必填项，岂能为空？" placeholder="票数" autocomplete="off" class="layui-input">
                </div>
            </div>
            <br>
            <div class="layui-form-item">
                <label class="layui-form-label">票务数量</label>
                <div class="layui-input-block">
                    <input type="text" name="num" lay-verify="number" lay-reqtext="必填项，岂能为空？" placeholder="票数" autocomplete="off" class="layui-input">
                </div>
            </div>
            <br />
            <div style="margin: 0 auto;width: 100px;height: 100px;">
                <button id="closeIframe" type="submit" lay-filter="sub" lay-submit="sub" class="layui-btn layui-btn-normal layui-btn-radius">提交</button>
            </div>
        </form>
    </div>
</div>
</body>
<script src="<%=basePath %>/layui/layui.all.js"></script>
<script>

    layui.use('laydate', function() {
        var laydate = layui.laydate;

        //日期时间选择器
        laydate.render({
            elem: '#test1'
            ,type: 'datetime'
        });
    });

    layui.use(['form'], function() {
        var form = layui.form;
        //自定义验证规则
        form.verify({
            required: function(value){
                if(value.length < 2){
                    return '文本需大于2字节，且不等于空';
                }
            },
            number:function (value) {
                if (isNaN(value)){
                    return '必须为数字';
                }
            }
        });

    });


</script>
</html>
