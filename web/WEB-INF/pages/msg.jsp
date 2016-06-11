<%--
  Created by IntelliJ IDEA.
  User: ashun
  Date: 16/6/9
  Time: 下午11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
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
                <li class="mytab-li"><a href="/subscribe">订阅服务</a></li>

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
                    <button id="login-btn" class="btn btn-primary" data-dismiss="modal">登录</button>
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
<script src="/js/platformCtrl.js"></script>
<script src="/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
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