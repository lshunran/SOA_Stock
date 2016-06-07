<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/mygroup.css">
</head>
<body>

<!--导航栏-->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid mynavbar">
        <div class="navbar-header">
            <a href="/homepage" class="navbar-brand">Logo</a>
        </div>

        <div class="collapse navbar-collapse nav-context">
            <ul class="nav navbar-nav" id="mytab">
                <li class="mytab-li"><a href="/userpage">个人主页</a></li>
                <li class="mytab-li"><a href="#">link</a></li>
                <li class="mytab-li"><a href="#">link</a></li>
                <li class="mytab-li"><a href="#">link</a></li>
                <li class="mytab-li"><a href="#">link</a></li>
            </ul>

            <form class="navbar-form navbar-left" action="/stock">
                <div class="form-group">
                    <input type="text" name="stockCode" class="form-control" placeholder="输入股票代码">
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
                            <li><a tabindex="-1" href="/exit">退出登录</a></li>
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


<!--关注股票部分-->
<div class="row focus-on-stock">
    <div class="col-md-7 col-md-offset-1">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class=" focus-head"><strong>你所关注的股票</strong></div>

            <!--<div class="list-group focus-on-stock-list hold-stock-list" >-->
                <!--<a href="#" class="list-group-item" class="item" name="list-item"><span class="stock-name">&nbsp;&nbsp;&nbsp;&nbsp;股票名称</span><span class="stock-price">最新</span><span class="stock-percent">&nbsp;&nbsp;涨幅</span><span class="stock-updown">&nbsp;&nbsp;涨跌</span><span class="speed">&nbsp;涨速</span><span class="total-hand">&nbsp;&nbsp;总手</span><span class="exchange-hand">&nbsp;换手</span><span class="liangbi">&nbsp;量比</span><span class="shiyinglv">&nbsp;市盈率</span><span class="xianshou">现手</span><span class="kaipan">开盘</span><span class="zuoshou">昨收</span><span class="zuigao">最高</span><span class="zuidi">最低</span><span class="weibi">委比</span><span class="zhenfu">&nbsp;&nbsp;&nbsp;&nbsp;振幅</span> </a>-->

                <!--<a href="#" class="list-group-item"  class="item"name="list-item"><div class="col-xs-2"> <span class="stock-name">Crto osasdio</span></div><span class="stock-price1">25.55</span><span class="stock-percent">4.56%</span><span class="stock-updown">1.79</span><span class="speed">0.45%</span><span class="total-hand">30万</span><span class="exchange-hand">3.60%</span><span class="liangbi">1.07</span><span class="shiyinglv">101.58</span><span class="xianshou">927</span><span class="kaipan">24.2</span><span class="zuoshou">23.5</span><span class="zuigao">26.4</span><span class="zuidi">24.4</span><span class="weibi">92.97%</span><span class="zhenfu">5.31%</span> </a>-->
                <!--<a href="#" class="list-group-item"  class="item"name="list-item"><div class="col-xs-2"> <span class="stock-name">Crto sssasodio</span></div><span class="stock-price1">25.55</span><span class="stock-percent">4.56%</span><span class="stock-updown">1.79</span><span class="speed">0.45%</span><span class="total-hand">30万</span><span class="exchange-hand">3.60%</span><span class="liangbi">1.07</span><span class="shiyinglv">101.58</span><span class="xianshou">927</span><span class="kaipan">24.2</span><span class="zuoshou">23.5</span><span class="zuigao">26.4</span><span class="zuidi">24.4</span><span class="weibi">92.97%</span><span class="zhenfu">5.31%</span> </a>-->
                <!--<a href="#" class="list-group-item"  class="item"name="list-item"><div class="col-xs-2"> <span class="stock-name">Crto oasadio</span></div><span class="stock-price1">25.55</span><span class="stock-percent">4.56%</span><span class="stock-updown">1.79</span><span class="speed">0.45%</span><span class="total-hand">30万</span><span class="exchange-hand">3.60%</span><span class="liangbi">1.07</span><span class="shiyinglv">101.58</span><span class="xianshou">927</span><span class="kaipan">24.2</span><span class="zuoshou">23.5</span><span class="zuigao">26.4</span><span class="zuidi">24.4</span><span class="weibi">92.97%</span><span class="zhenfu">5.31%</span> </a>-->
                <!--<a href="#" class="list-group-item"  class="item"name="list-item"><div class="col-xs-2"> <span class="stock-name">Crto odio</span></div><span class="stock-price1">25.55</span><span class="stock-percent">4.56%</span><span class="stock-updown">1.79</span><span class="speed">0.45%</span><span class="total-hand">30万</span><span class="exchange-hand">3.60%</span><span class="liangbi">1.07</span><span class="shiyinglv">101.58</span><span class="xianshou">927</span><span class="kaipan">24.2</span><span class="zuoshou">23.5</span><span class="zuigao">26.4</span><span class="zuidi">24.4</span><span class="weibi">92.97%</span><span class="zhenfu">5.31%</span> </a>-->
                <!--<a href="#" class="list-group-item"  class="item"name="list-item"><div class="col-xs-2"> <span class="stock-name">Crto ossadio</span></div><span class="stock-price1">25.55</span><span class="stock-percent">4.56%</span><span class="stock-updown">1.79</span><span class="speed">0.45%</span><span class="total-hand">30万</span><span class="exchange-hand">3.60%</span><span class="liangbi">1.07</span><span class="shiyinglv">101.58</span><span class="xianshou">927</span><span class="kaipan">24.2</span><span class="zuoshou">23.5</span><span class="zuigao">26.4</span><span class="zuidi">24.4</span><span class="weibi">92.97%</span><span class="zhenfu">5.31%</span> </a>-->
                <!--<a href="#" class="list-group-item" class="item" name="list-item"><div class="col-xs-2"> <span class="stock-name">Crtoasa odio</span></div><span class="stock-price1">25.55</span><span class="stock-percent">4.56%</span><span class="stock-updown">1.79</span><span class="speed">0.45%</span><span class="total-hand">30万</span><span class="exchange-hand">3.60%</span><span class="liangbi">1.07</span><span class="shiyinglv">101.58</span><span class="xianshou">927</span><span class="kaipan">24.2</span><span class="zuoshou">23.5</span><span class="zuigao">26.4</span><span class="zuidi">24.4</span><span class="weibi">92.97%</span><span class="zhenfu">5.31%</span> </a>-->
                <!--<a href="#" class="list-group-item" class="item" name="list-item"><div class="col-xs-2"> <span class="stock-name">Crtoasa odio</span></div><span class="stock-price1">25.55</span><span class="stock-percent">4.56%</span><span class="stock-updown">1.79</span><span class="speed">0.45%</span><span class="total-hand">30万</span><span class="exchange-hand">3.60%</span><span class="liangbi">1.07</span><span class="shiyinglv">101.58</span><span class="xianshou">927</span><span class="kaipan">24.2</span><span class="zuoshou">23.5</span><span class="zuigao">26.4</span><span class="zuidi">24.4</span><span class="weibi">92.97%</span><span class="zhenfu">5.31%</span> </a>-->
                <!--<a href="#" class="list-group-item"  class="item"name="list-item"><div class="col-xs-2"> <span class="stock-name">Crtoasa odio</span></div><span class="stock-price1">25.55</span><span class="stock-percent">4.56%</span><span class="stock-updown">1.79</span><span class="speed">0.45%</span><span class="total-hand">30万</span><span class="exchange-hand">3.60%</span><span class="liangbi">1.07</span><span class="shiyinglv">101.58</span><span class="xianshou">927</span><span class="kaipan">24.2</span><span class="zuoshou">23.5</span><span class="zuigao">26.4</span><span class="zuidi">24.4</span><span class="weibi">92.97%</span><span class="zhenfu">5.31%</span> </a>-->
                <!--<a href="#" class="list-group-item"  class="item"name="list-item"><div class="col-xs-2"> <span class="stock-name">Crtoio</span></div><span class="stock-price1">25.55</span><span class="stock-percent">4.56%</span><span class="stock-updown">1.79</span><span class="speed">0.45%</span><span class="total-hand">30万</span><span class="exchange-hand">3.60%</span><span class="liangbi">1.07</span><span class="shiyinglv">101.58</span><span class="xianshou">927</span><span class="kaipan">24.2</span><span class="zuoshou">23.5</span><span class="zuigao">26.4</span><span class="zuidi">24.4</span><span class="weibi">92.97%</span><span class="zhenfu">5.31%</span> </a>-->
                <!--<a href="#" class="list-group-item"  class="item"name="list-item"><div class="col-xs-2"> <span class="stock-name">Crio</span></div><span class="stock-price1">25.55</span><span class="stock-percent">4.56%</span><span class="stock-updown">1.79</span><span class="speed">0.45%</span><span class="total-hand">30万</span><span class="exchange-hand">3.60%</span><span class="liangbi">1.07</span><span class="shiyinglv">101.58</span><span class="xianshou">927</span><span class="kaipan">24.2</span><span class="zuoshou">23.5</span><span class="zuigao">26.4</span><span class="zuidi">24.4</span><span class="weibi">92.97%</span><span class="zhenfu">5.31%</span> </a>-->
                <!--<a href="#" class="list-group-item"  class="item"name="list-item"><div class="col-xs-2"> <span class="stock-name">Crio</span></div><span class="stock-price1">25.55</span><span class="stock-percent">4.56%</span><span class="stock-updown">1.79</span><span class="speed">0.45%</span><span class="total-hand">30万</span><span class="exchange-hand">3.60%</span><span class="liangbi">1.07</span><span class="shiyinglv">101.58</span><span class="xianshou">927</span><span class="kaipan">24.2</span><span class="zuoshou">23.5</span><span class="zuigao">26.4</span><span class="zuidi">24.4</span><span class="weibi">92.97%</span><span class="zhenfu">5.31%</span> </a>-->
            <!--</div>-->
            <div class="list-table">


            <table class="table table-hover" >
                <th>股票名称</th>
                <th>开盘价</th>
                <th>昨收价</th>
                <th>当前价</th>
                <th>最高价</th>
                <th>最低价</th>
                <th>竞买价</th>
                <th>竞卖价</th>
                <th>成交量(万手)</th>
                <th>成交金额</th>
                <th>日期&nbsp;</th>
                <th>&nbsp;时间&nbsp;</th>
                <tbody id = "stocks">
                <c:forEach var="f" items="${requestScope.focuses}">


                <a href="/stock?request=${f.code}">
                    <tr>
                    <td>${f.name}</td>
                    <td>25.87</td>
                    <td>0.51%</td>
                    <td>0.13</td>
                    <td>0%</td>
                    <td>67.9万</td>
                    <td>1.15%</td>
                    <td>0.97</td>
                    <td>7325</td>
                    <td>25.96</td>
                    <td>25.74</td>
                    <td>25.99</td>

                    </tr>
                </a>

                </c:forEach>
                    </tbody>


            </table>
            </div>
        </div>
    </div>
    <!--持仓部分-->
    <div class="col-md-3 hold-list">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class=" hold-head"><strong>持仓列表</strong></div>
            <!--<div class="panel-body">-->
            <!--</div>-->
            <c:forEach var="g" items="${requestScope.groups}">
            <div class="list-group focus-on-stock-list">
                <a class="list-group-item" role="button" data-toggle="collapse" href="#${g.name}" aria-expanded="false" aria-controls="">
                    ${g.name}
                </a>
                <div class="collapse" id="${g.name}">


                    <c:forEach var="h" items="${g.holdsById}">

                <a class="list-group-item" role="button" data-toggle="collapse" href="#${h.stockByScode.code}"  aria-expanded="true" aria-controls="${h.stockByScode.code}">
                    ${h.stockByScode.name}
                        <span style="padding-left: 190px"></span>
                        <span class="label btn-danger"  id="${g.id}${h.stockByScode.code}">10%</span>
                </a>
                    <div class="collapse" id="${h.stockByScode.code}">
                        <div class="btn-group btn-group-justified" role="group" aria-label="...">
                            <div class="btn-group" role="group">
                                <button class="btn btn-primary buyin" data-toggle="modal" data-target="#stockModal">买入</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button  class="btn btn-info saleout" data-toggle="modal" data-target="#stockModal">卖出</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button  class="btn btn-warning">详情</button>
                            </div>
                        </div>
                    </div>

                    </c:forEach>
</div>
</c:forEach>

                    <div class="modal fade" id="stockModal" tabindex="-1" role="dialog" >
                        <div class="modal-dialog" role="document"style="width: 750px">
                            <div class="modal-content" style="height: 550px">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">组合名</h4>
                                    <div class="current-charts">
                                        <div class="charts">
                                        </div>
                                        <div class="five-level">
                                            <table class="table table-hover">
                                                <tr>
                                                    <td>卖一</td>
                                                    <td>价钱</td>
                                                    <td>手数</td>
                                                </tr>
                                                <tr>
                                                    <td>卖一</td>
                                                    <td>价钱</td>
                                                    <td>手数</td>
                                                </tr>
                                                <tr>
                                                    <td>卖一</td>
                                                    <td>价钱</td>
                                                    <td>手数</td>
                                                </tr>
                                                <tr>
                                                    <td>卖一</td>
                                                    <td>价钱</td>
                                                    <td>手数</td>
                                                </tr>
                                                <tr>
                                                    <td>卖一</td>
                                                    <td>价钱</td>
                                                    <td>手数</td>
                                                </tr>
                                                <tr>
                                                    <td>买一</td>
                                                    <td>价钱</td>
                                                    <td>手数</td>
                                                </tr>
                                                <tr>
                                                    <td>买一</td>
                                                    <td>价钱</td>
                                                    <td>手数</td>
                                                </tr>
                                                <tr>
                                                    <td>买一</td>
                                                    <td>价钱</td>
                                                    <td>手数</td>
                                                </tr>
                                                <tr>
                                                    <td>买一</td>
                                                    <td>价钱</td>
                                                    <td>手数</td>
                                                </tr>
                                                <tr>
                                                    <td>买一</td>
                                                    <td>价钱</td>
                                                    <td>手数</td>
                                                </tr>

                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-body">
                                    <div class="param">

                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="请输入股票代码" aria-describedby="stock-code">
                                            <span class="input-group-addon" id="stock-code">股票名显示在这</span>

                                            <span class="input-group-addon btn btn-primary" id="down">-</span>
                                            <input type="text" class="form-control" placeholder="委托价格" aria-describedby="basic-addon3">
                                            <span class="input-group-addon btn btn-primary" id="up">+</span>
                                        </div>
                                        <div class="numcanbuy">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="委托数量" aria-describedby="stock-canbuy">
                                                <span class="input-group-addon" id="stock-canbuy">可买数量</span>
                                            </div>
                                        </div>

                                        <div class="confirm">
                                            <button type="button" class="btn btn-primary btn-group-lg" id="confirm-btn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;买&nbsp;&nbsp;&nbsp;入&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        </div>


                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>




                    </div>


        </div>
    </div>
</div>









<script src="/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<%--TODO 登陆--%>


<script>
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



<script type="text/javascript">



    var request1 = [
    <c:forEach var="g" items="${requestScope.groups}">
        <c:forEach var="h" items="${g.holdsById}">
        '${h.scode}',
        </c:forEach>
    </c:forEach>

    ];

    var holdstock = [
        <c:forEach var="g" items="${requestScope.groups}">
        <c:forEach var="h" items="${g.holdsById}">
        document.getElementById("${g.id}${h.stockByScode.code}"),
        </c:forEach>
        </c:forEach>

    ];


    var request = [
        <c:forEach var="f" items="${requestScope.focuses}">
        '${f.code}',
        </c:forEach>
    ];


    //refresh1()
    //window.setInterval('refresh1()',3000);

    //刷新持仓列表




    refresh2()
    window.setInterval('refresh2()',3000);


    function refresh2(){
        $.ajax({
            type: "get",
            async: true, //同步执行
            url: "/data/realtime_list",
            data: {request: JSON.stringify(request1)},
            dataType: "json",
            success: function (result) {
                if (result) {

                    for (var i = 0, j = result.length; i < j; i++) {

                        holdstock[i].innerHTML = (((result[i].price-result[i].pre_close)/result[i].pre_close)*100).toFixed(2)+"%";


                    }


                }

            },

            error: function (errorMsg) {
                alert("图表请求数据失败啦!");
            }
        });
    }







//        刷新关注列表


        var stocks = document.getElementById("stocks");
        stock_list = stocks.children;

    refresh();
    window.setInterval('refresh()',3000)
    function refresh(){
        $.ajax({
            type: "get",
            async: true, //同步执行
            url: "/data/realtime_list",
            data: {request: JSON.stringify(request)},
            dataType: "json",
            success: function (result) {
                if (result) {

                    for (var i = 0, j = stock_list.length; i < j; i++) {

                        stock = stock_list[i].children;


                        stock[0].innerHTML = result[i].name;

                        stock[1].innerHTML = Number(result[i].open).toFixed(2);
                        stock[2].innerHTML = Number(result[i].pre_close).toFixed(2);
                        stock[3].innerHTML = Number(result[i].price).toFixed(2);
                        stock[4].innerHTML = Number(result[i].high).toFixed(2);
                        stock[5].innerHTML = Number(result[i].low).toFixed(2);
                        stock[6].innerHTML = Number(result[i].bid).toFixed(2);
                        stock[7].innerHTML = Number(result[i].ask).toFixed(2);
                        stock[8].innerHTML = (Number(result[i].volume)/10000).toFixed(2);
                        stock[9].innerHTML = (Number(result[i].amount)/10000).toFixed(2);
                        stock[10].innerHTML = result[i].date;
                        stock[11].innerHTML = result[i].time;


                    }


                }

            },

            error: function (errorMsg) {
                alert("图表请求数据失败啦!");
            }
        });
    }


</script>

<script type="text/javascript">
    $(".saleout").bind("click",function(){
        document.getElementById("confirm-btn").innerHTML="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;卖&nbsp;&nbsp;&nbsp;出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    })
    $(".buyin").bind("click",function(){
        document.getElementById("confirm-btn").innerHTML="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;买&nbsp;&nbsp;&nbsp;入&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    })



</script>
</body>
</html>