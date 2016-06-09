<%--
  Created by IntelliJ IDEA.
  User: ashun
  Date: 16/6/9
  Time: 下午11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
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
                <li class="mytab-li"><a href="/userpage">个人主页</a></li>
                <li class="mytab-li"><a href="/USAstockpage">美股市场</a></li>
                <li class="mytab-li"><a href="/platform">开放平台</a></li>

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
                    <button type="button" class="btn btn-primary my-btn" data-toggle="modal" data-target="#myModal" id="mylogin">登录</button>
                    <button type="button" class="btn btn-primary my-btn" data-toggle="modal" data-target="#myRegisterModal" id="myregister">注册</button>
                    <div class="btn-group my-btn">

                        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">设置中心</button>
                        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">Something</a></li>
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
            StockZone 为开发者提供了一个开放平台,快来定制你的API,马上进行开发!~
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">您自定义生成的URL:</h3>
        </div>
        <div class="panel-body">
            ...
        </div>
    </div>
    API内容:
    <form>
        <div class="checkbox">
            <div class="row myrow" style="padding-bottom: 15px;">
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>

            </div>

            <div class="row myrow">
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <div class="col-md-2">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>

            </div>
        </div>
        <div class="btn btn-info">生成URL</div>
    </form>
</div>


</body>
</html>