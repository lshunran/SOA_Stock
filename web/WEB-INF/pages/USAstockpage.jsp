<%--
  Created by IntelliJ IDEA.
  User: ashun
  Date: 16/4/16
  Time: 下午9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Stock Zone</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/myCommunitycss.css">
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid mynavbar">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">Logo</a>
        </div>

        <div class="collapse navbar-collapse nav-context">
            <ul class="nav navbar-nav" id="mytab">
                <li class="mytab-li"><a href="/userpage">个人主页</a></li>
                <li class="mytab-li"><a href="#">美股市场</a></li>
                <li class="mytab-li"><a href="/platform">开放平台</a></li>

            </ul>

            <div class="navbar-form navbar-left" >
                <div class="form-group">
                    <input type="text"  id="stockcode" class="form-control" placeholder="输入股票代码">
                </div>
                <button  class="btn btn-info" id="us_search" onclick="us_current();us_current_other()">搜索</button>
            </div>

            <!--<p class="col-lg-2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你好，请<a href="#myModal"  data-toggle="modal">注册/登录</a></p>-->


        </div>

    </div>
</nav>

<div class="container stock-msg">
    <div class="stock-msg-header">
        <span class="stock-name">
            <strong class="stock-name" id="us_stock_name">-</strong>
        <span class="label label-warning" >NASDAQ</span>






        </span>
        <div class="stock-price">
            <h2><strong id="us_price">-</strong></h2>
            <span class="stock-updown">
                <span><strong id="change1">-0.00</strong></span>
                <span>&nbsp;&nbsp;(<strong id="change2">-0.00</strong>)</span>
            </span>
            <span>&nbsp;&nbsp;报价截止至&nbsp;:&nbsp;<strong id="lasttrade"></strong></span>

        </div>
    </div>
    <table class="topTable">
        <tbody>
        <tr>
            <td>今开：<span id="us_open">22.22</span></td>
            <td>最高：<span id="us_high">32.68</span></td>
            <td title="当日成交量，单位：股">成交量：<span id="us_volume">2.21亿股</span></td></tr>
        <tr class="seperateTop">
            <td>最低：<span id="us_low">31.83</span></td>
            <td>收盘：<span id="us_close">55.50亿</span></td>
            <td>52周内最高：<span id="high-52-weeks">55.50亿</span></td>

        </tr>
        <tr class="seperateBottom">
            <td>涨停价：<span id="zhangting">35.95</span></td>
            <td>跌停价：<span id="dieting">29.41</span></td>
            <td>52周内最低：<span id="low-52-weeks">55.50亿</span></td>

        </tr>
        <tr class="seperateBottom">
            <td>每股收益：<span id="EarnPerShare">35.95</span></td>
            <td>市盈率：<span id="PE">29.41</span></td>
            <td>公司名称：<span id="CompanyName">55.50亿</span></td>

        </tr>

        </tbody>
    </table>
</div>












<div class="container stock-chart">
    <ul id="chartTab" class="nav nav-pills" role="tablist">
        <li class="active"><a href="#currentChart" role="tab" data-toggle="pill">分时</a></li>
        <li><a href="#dayK" role="tab" data-toggle="pill">日K</a></li>
        <li><a href="#weekK" role="tab" data-toggle="pill">周K</a></li>
        <li><a href="#monthK" role="tab" data-toggle="pill">月K</a></li>
        <li><a href="#" role="tab" data-toggle="pill">备用标签</a></li>
    </ul>
    <!-- 选项卡面板 -->
    <div id="chartTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="currentChart">
            <div class="current-pic">
                <div id="current" style="height:360px"></div>
            </div>

        </div>
        <div class="tab-pane fade in active" id="dayK">
            <div class="current-pic">
                <div id="main" style="height:230px"></div>
                <div id="main2" style="height:145px"></div>
            </div>
        </div>
        <div class="tab-pane fade in active" id="weekK">
            <div class="current-pic">
                <div id="week1" style="height:230px"></div>
                <div id="week2" style="height:145px"></div>
            </div>
        </div>
        <div class="tab-pane fade in active" id="monthK">
            <div class="current-pic">
                <div id="month1" style="height:230px"></div>
                <div id="month2" style="height:145px"></div>
            </div>
        </div>
        <div class="tab-pane fade in active" ></div>
    </div>
</div>
<div class="container exchange-table">
    <table class="table table-bordered">
        <tr>
            <td>买盘五档</td>
            <td>卖盘五档</td>
        </tr>
        <tr>
            <span>成交统计</span></br>
            <div class="progress">
                <div class="progress-bar progress-bar-success progress-bar-striped" id="zhudongmai1" style="width: 35%">
                    <span class="sr-only">35% Complete (success)</span>
                    主动买
                </div>
                <div class="progress-bar progress-bar-danger progress-bar-striped" id="zhudongmai2" style="width: 65%">
                    <span class="sr-only">65% Complete (warning)</span>
                    主动卖
                </div>
            </div>
        </tr>
        <tr>
            <td><span class="col-md-3">买1:</span><span class="numberOfstock col-md-1 col-md-offset-7" id="b1">5000</span></td>
            <td><span class="col-md-3">卖1:</span><span class="numberOfstock col-md-1 col-md-offset-7" id="s1">5000</span></td>
        </tr>
        <tr>
            <td><span class="col-md-3">买2:</span><span class="numberOfstock col-md-1 col-md-offset-7" id="b2">5000</span></td>
            <td><span class="col-md-3">卖2:</span><span class="numberOfstock col-md-1 col-md-offset-7" id="s2">5000</span></td>
        </tr>
        <tr>
            <td><span class="col-md-3">买3:</span><span class="numberOfstock col-md-1 col-md-offset-7" id="b3">5000</span></td>
            <td><span class="col-md-3">卖3:</span><span class="numberOfstock col-md-1 col-md-offset-7" id="s3">5000</span></td>
        </tr>
        <tr>
            <td><span class="col-md-3">买4:</span><span class="numberOfstock col-md-1 col-md-offset-7" id="b4">5000</span></td>
            <td><span class="col-md-3">卖4:</span><span class="numberOfstock col-md-1 col-md-offset-7" id="s4">5000</span></td>
        </tr>
        <tr>
            <td><span class="col-md-3">买5:</span><span class="numberOfstock col-md-1 col-md-offset-7" id="b5">5000</span></td>
            <td><span class="col-md-3">卖5:</span><span class="numberOfstock col-md-1 col-md-offset-7" id="s5">5000</span></td>
        </tr>

    </table>
</div>





<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<script src="/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript">

    us_current();
    us_current_other();
    window.setTimeout('us_current()',1000);
    window.setTimeout('us_current_other()',1000);

    //   $("#us_search").bind("click",function () {
 function us_current() {


        var stockcode = $("#stockcode").val() == "" ? "GOOG" : $("#stockcode").val();

        var httpurl = "/USArealdata?code=" + stockcode;
       // alert(httpurl);
        $.ajax({
            type: "get",
            async: true, //同步执行
            url: httpurl,
            dataType: "json",
            success: function (result) {
                if (result) {
//                    alert(result.stockname);
                    document.getElementById("us_stock_name").innerHTML=result.stockname;
                    document.getElementById("us_open").innerHTML="$ "+result.open;
                    document.getElementById("us_close").innerHTML="$ "+result.close;
                    document.getElementById("us_high").innerHTML="$ "+result.high;
                    document.getElementById("us_low").innerHTML="$ "+result.low;
                    document.getElementById("high-52-weeks").innerHTML="$ "+result.high52;
                    document.getElementById("low-52-weeks").innerHTML="$ "+result.low52;
                    document.getElementById("us_volume").innerHTML=" "+(result.volume / 10000).toFixed(2) + "万";
                    document.getElementById("us_price").innerHTML="$ "+result.close;





                }
            },
        })
    }



 function us_current_other() {


     var stockcode = $("#stockcode").val() == "" ? "GOOG" : $("#stockcode").val();

     var httpurl = "/USArealdata1?code=" + stockcode;
//     alert(httpurl);
     $.ajax({
         type: "get",
         async: true, //同步执行
         url: httpurl,
         dataType: "json",
         success: function (result) {
             if (result) {
//                    alert(result.stockname);
                 var preprice = parseFloat(result.PrevCls);
                // alert(preprice);
                 var top_price = (preprice.toFixed(2) * 0.1 + preprice).toFixed(2);
                 var bottom_price = (preprice-preprice.toFixed(2) * 0.1).toFixed(2);
               // alert(top_price);
                 document.getElementById("change1").innerHTML=result.StockChange;
                 document.getElementById("change2").innerHTML="$ "+result.ChangePercent;
                 document.getElementById("lasttrade").innerHTML=" "+result.LastTradeDateTime;
                 document.getElementById("EarnPerShare").innerHTML="$ "+result.EarnPerShare;
                 document.getElementById("PE").innerHTML=" "+result.PE;
                 document.getElementById("CompanyName").innerHTML=" "+result.CompanyName;
                 document.getElementById("zhangting").innerHTML="$ "+ top_price;
                 document.getElementById("dieting").innerHTML="$ "+ bottom_price ;




             }
         },
     })
 }
</script>

</body>
</html>
