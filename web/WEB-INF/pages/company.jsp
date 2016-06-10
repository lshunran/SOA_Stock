<%--
  Created by IntelliJ IDEA.
  User: ashun
  Date: 16/6/10
  Time: 下午10:50
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
    <script src="/js/echarts.min.js"></script>
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

<div class="container myContent" style="width: 70%; margin-top: 90px;">
    <div class="panel panel-default">
        <div class="panel-body">
            StockZone 为专业用户或者企业用户提供了一个专业数据平台,在这里你可以对比各种股票的各类数据或者对由系统为你对数据进行分析,让您的投资先人一步!
        </div>
    </div>
    <div id="main" style="height:400px"></div>
</div>




<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    option = {
        title: {
            text: '折线图堆叠'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['周一','周二','周三','周四','周五','周六','周日']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'邮件营销',
                type:'line',
                stack: '总量',
                data:[120, 132, 101, 134, 90, 230, 210]
            },
            {
                name:'联盟广告',
                type:'line',
                stack: '总量',
                data:[220, 182, 191, 234, 290, 330, 310]
            },
            {
                name:'视频广告',
                type:'line',
                stack: '总量',
                data:[150, 232, 201, 154, 190, 330, 410]
            },
            {
                name:'直接访问',
                type:'line',
                stack: '总量',
                data:[320, 332, 301, 334, 390, 330, 320]
            },
            {
                name:'搜索引擎',
                type:'line',
                stack: '总量',
                data:[820, 932, 901, 934, 1290, 1330, 1320]
            }
        ]
    };


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>