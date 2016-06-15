<%--
  Created by IntelliJ IDEA.
  User: ashun
  Date: 16/6/9
  Time: 下午11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="subscribe" ng-controller="subscribeCtrl">
<head lang="en">
    <meta charset="UTF-8">
    <title>Stock Zone</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/mycss.css">

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid mynavbar">
        <div class="navbar-header">
            <div class="logo-bg"><a href="/homepage" class="navbar-brand">Logo</a></div>
        </div>

        <div class="collapse navbar-collapse nav-context">
            <ul class="nav navbar-nav" id="mytab">
                <li class="mytab-li"><a href="/USAstockpage">美股市场</a></li>
                <li class="mytab-li"><a href="/platform">开放平台</a></li>
                <li class="mytab-li"><a href="/company">数据分析</a></li>
                <li class="mytab-li"><a href="/subscribe/">订阅服务</a></li>

            </ul>

            <form class="navbar-form navbar-left" action="/stock">
                <div class="form-group">
                    <input type="text" name="stockCode" class="form-control" placeholder="输入沪深股市股票代码">
                </div>
                <button type="submit" class="btn btn-info">搜索</button>
            </form>

            <!--<p class="col-lg-2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你好，请<a href="#myModal"  data-toggle="modal">注册/登录</a></p>-->

            <div class="navbar-right mynavbar-right">
                <p class="navbar-text">你好!</p>
                <div class="btn-group nav-pills" role="group">
                    <button type="button" class="btn btn-primary my-btn" data-toggle="modal" data-target="#myModal" id="mylogin" ng-model="name">登录</button>
                    <button type="button" class="btn btn-primary my-btn" data-toggle="modal" data-target="#myRegisterModal" id="myregister">注册</button>
                    <div class="btn-group my-btn">

                        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">设置中心</button>
                        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="/msg">消息中心</a></li>
                            <li><a tabindex="-1" href="#">Anything</a></li>
                            <li><a tabindex="-1" href="#">action</a></li>
                            <li><a tabindex="-1" href="#">telephone</a></li>
                            <li><a tabindex="-1" href="/exit">退出登陆</a></li>
                        </ul>
                    </div>
                </div>
            </div>


        </div>

    </div>
</nav>

<div class="container myContent" style="width: 70%; margin-top: 90px">
    <div class="panel panel-default">
        <div class="panel-body">
            StockZone 为个人用户和企业用户提供了不同深度的订阅服务,让你第一时间掌握一手信息!个人用户:10支/月,企业用户50支/月
        </div>
    </div>

    <h4>输入要订阅的股票的代码:</h4>
    <input type="text" class="form-control" ng-model="stockId" name="stockId">
    <h4>要订阅的内容:</h4>

    <div class="row" style="padding-bottom: 15px;">
        <div class="col-md-4">
            <label>
                <input type="checkbox" ng-model="limitup" value=1 > 涨停通知
            </label>
        </div>
        <div class="col-md-4">
            <label>
                <input type="checkbox" ng-model="limitdown" value=1> 跌停通知
            </label>
        </div>
        <div class="col-md-4">
            <label>
                <input type="checkbox" ng-model="info" value=1> 公司公告和资讯
            </label>
        </div>

    </div>
    <form style="padding-top: 15px">
        <input type="checkbox" ng-model="bigdeal" onclick="checkboxOnclick1(this)" > 大单进场警报
        <input type="text" id="input1" ng-model="bigdealnum" class="form-control" style="width: 30%" placeholder="设置警报阈值,单位:手" disabled="true">
        <input type="checkbox"  ng-model="volume" onclick="checkboxOnclick2(this)"> 成交量警报
        <input type="text" id="input2" ng-model="volumenum" class="form-control" style="width: 30%" placeholder="设置警报阈值,单位:手" disabled="true">
        <input type="checkbox" ng-model="amount" onclick="checkboxOnclick3(this)"> 成交金额警报
        <input type="text" id="input3" ng-model="amountnum"class="form-control" style="width: 30%" placeholder="设置警报阈值,单位:元" disabled="true">

<br>
    通知方式:
    <input type="checkbox" > 站内消息推送
    <input type="checkbox" > 手机短信
    <input type="text" class="form-control" placeholder="输入手机号码" style="width: 30%">
    </form>
    <input type="button" class="btn btn-info" value="确认订阅" style="margin-top: 15px" ng-click="subscribe()">
    <%--<a style="margin-top: 15px" href="${flowExecutionUrl}&_eventId=addAlert&username={{name}}&stockId={{stockId}}&bigdealnum={{bigdealnum}}&volumenum={{volumenum}}&amountnum={{amountnum}}&limitup={{limitup}}&limitdown={{limitdown}}" class="btn btn-info">确认订阅</a>--%>
</div>




<div class="modal fade bs-example-modal-sm" id="myModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header myHeader">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4>用户登录</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="control-label" >username</label>
                    <input type="text" id="username" class="form-control">
                </div>
                <div class="form-group">
                    <label class="control-label" >password</label>
                    <input type="password" id="password" class="form-control">
                </div>

                <div class="modal-footer">
                    <button id="login-btn" class="btn btn-primary" data-dismiss="modal" ng-click="getName()">登录</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="modal fade bs-example-modal-sm" id="myRegisterModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header myHeader">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4>用户注册</h4>
            </div>
            <div class="modal-body">
                <form action="/register" method="post">
                    <div class="form-group">
                        <label class="control-label">username</label>
                        <input type="text" name="reg-username" class="form-control"/>
                    </div>

                    <div class="form-group">
                        <label class="control-label">password</label>
                        <input type="password" name="reg-password" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">confirm password</label>
                        <input type="password" class="form-control"/>
                    </div>


                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit">注册</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            关闭
                        </button>
                    </div>

                </form>

            </div>

        </div>
    </div>
</div>

<script src="/js/angular.min.js"></script>
<script src="/js/angular-resource.js"></script>
<script src="/js/subscribeCtrl.js"></script>
<script src="/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script type="application/javascript">
    function checkboxOnclick1(checkbox) {
        if ( checkbox.checked == true){
            document.getElementById("input1").disabled=false;

        }else{
            document.getElementById("input1").disabled=true;
        }
    }
    function checkboxOnclick2(checkbox) {
        if ( checkbox.checked == true){
            document.getElementById("input2").disabled=false;

        }else{
            document.getElementById("input2").disabled=true;
        }
    }
    function checkboxOnclick3(checkbox) {
        if ( checkbox.checked == true){
            document.getElementById("input3").disabled=false;

        }else{
            document.getElementById("input3").disabled=true;
        }
    }
</script>
<script type="application/javascript">
    $(function(){


        $("#login-btn").bind("click",function(){
            $.ajax({
                url:"/login",
                type:"post",
                data:{username:$("#username").val(),password:$("#password").val()},
                success:function(data){
                    if(data==1) {
                        $("#mylogin").replaceWith('<button type="button" class="btn btn-primary my-btn" id="mylogin">' + $("#username").val() + '</button>');
                        $("#myregister").remove();
                    }
                    else alert("用户名或密码错了");
                }
            })
        })


        $.ajax({
            url:"/login",
            type:"post",
            data:{username:"<%=(String)session.getAttribute("name")%>",password:"<%=(String)session.getAttribute("word")%>"},
            success:function(data){
                if(data==1) {
                    $("#mylogin").replaceWith('<button type="button" class="btn btn-primary my-btn" id="mylogin">' + "<%=(String)session.getAttribute("name")%>" + '</button>');
                    $("#myregister").remove();

                }
            }
        })
    })

</script>
</body>
</html>