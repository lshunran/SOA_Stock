<%--
  Created by IntelliJ IDEA.
  User: ashun
  Date: 16/6/10
  Time: 下午10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="company" ng-controller="companyCtrl">
<head lang="en">
    <meta charset="UTF-8">
    <title>Stock Zone</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/mycss.css">
    <script src="/jquery-2.1.4.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
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

<div class="container myContent" style="width: 70%; margin-top: 90px;">
    <div class="panel panel-default">
        <div class="panel-body">
            StockZone 为专业用户或者企业用户提供了一个专业数据平台,在这里你可以对比各种股票的各类数据或者对由系统为你对数据进行分析,让您的投资先人一步!
        </div>
    </div>
    <div class="row">
        <div class="col-md-5 col-md-offset-1">
            <input type="text" class="form-control" id="stockCode" width="100%">
        </div>
        <div class="col-md-3">
            <select class="form-control" id="selectType">
                <option selected value="a">历史价格</option>
                <option value="b" >历史成交量</option>
                <option value="c" >历史价格变动</option>
                <option value="d" >历史涨跌幅</option>
            </select>
        </div>
        <div class="col-md-3">
            <input type="button" class="btn btn-info" value="添加对比" onclick="addCompare()">
        </div>
    </div>

    <div id="main" style="height:400px;padding-top: 20px"></div>
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
<script src="/js/companyCtrl.js"></script>


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

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    myChart.showLoading({
        text: '正在努力的读取数据中...',    //loading话术
    });

    var axisData = [];
    var data1 = [];
    var name;
    var legendData = [];
    var num = 0;

    // 指定图表的配置项和数据
    option = {
        title: {
            text: '历史数据对比'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:[]
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
//            data: ['周一','周二','周三','周四','周五','周六','周日']
            data:[]
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                type:'line',
                data:[]
            },
            {
                type:'line',
                data:[]
            },
            {

                type:'line',
                data:[]
            },
            {
                name:'',
                type:'line',
                data:[]
            },
            {
                name:'',
                type:'line',
                data:[]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    myChart.hideLoading();


    function addCompare() {
        console.log($("#selectType option:selected").val());
        if(num > 4){
            alert("最多添加5支股票!");
            return;
        }
        myChart.showLoading({
            text: '正在努力的读取数据中...',    //loading话术
        });
        $.ajax({
            type: "get",
            async: true, //同步执行
            url: "/data/history?request=" + $("#stockCode").val(),
            dataType: "json",
            success: function (result) {
                if (result) {
                    for (var i = result.length - 1; i >= 0; i--) {
                        var o = result[i];
                        var temp = [];
                        //console.log(o.date);
                        axisData.push(o.date);

                        if($("#selectType option:selected").val() == "a") data1.push(o.close);
                        else if($("#selectType option:selected").val() == "b") data1.push(o.volume);
                        else if($("#selectType option:selected").val() == "c") data1.push(o.price_change);
                        else if($("#selectType option:selected").val() == "d") data1.push(o.p_change);

                        //data1.push(o.close);
                    }
                    name = $("#stockCode").val();
                    legendData.push(name);

                    //alert(axisData);
                    option.legend.data = legendData;
                    option.xAxis.data = axisData;
                    option.series[num].data = data1;
                    option.series[num].name = name;

                    myChart.hideLoading();

                    myChart.setOption(option);


//                    setTimeout(function () {
//                        window.onresize = function () {
//                            myChart.resize();
//                        }
//                    }, 200)

                }
                num = num + 1;
                axisData = [];
                data1 = [];
                //legendData = [];
            }
        });

    }

</script>

</body>
</html>