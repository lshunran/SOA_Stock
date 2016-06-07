<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fordevelopment
  Date: 15/6/22
  Time: 下午9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Stock Zone</title>
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/myCommunitycss.css">
</head>
<>


<!-- 为ECharts准备一个具备大小（宽高）的Dom -->



<body>


<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container-fluid mynavbar">
    <div class="navbar-header">
      <a href="#" class="navbar-brand">Logo</a>
    </div>

    <div class="collapse navbar-collapse nav-context">
      <ul class="nav navbar-nav" id="mytab">
        <li class="mytab-li"><a href="/userpage">个人主页</a></li>
        <li class="mytab-li"><a href="/USAstockpage">美股市场</a></li>
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
        <form>
          <div class="form-group">
            <label class="control-label">username</label>
            <input type="text" id="username" class="form-control">
          </div>
          <div class="form-group">
            <label class="control-label" >password</label>
            <input type="password"  id="password" class="form-control">
          </div>
        </form>

      </div>
      <div class="modal-footer">
        <a href="#" class="btn btn-primary" id="login-btn"  data-dismiss="modal">登录</a>
        <button type="button" class="btn btn-default" data-dismiss="modal">
          关闭
        </button>
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


        <form action=/register" method="post">
          <div class="form-group">
            <label class="control-label" id="reg-username">username</label>
            <input type="text" class="form-control">
          </div>
          <div class="form-group">
            <label class="control-label" id="reg-password">password</label>
            <input type="password" class="form-control">
          </div>
          <div class="form-group">
            <label class="control-label">confirm password</label>
            <input type="password" class="form-control">


      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">注册</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">
          关闭
        </button>
      </div>
      </form>
        </div>
    </div>
  </div>
</div>


<div class="container stock-msg">
  <div class="stock-msg-header">
        <span class="stock-name">
            <strong class="stock-name">${requestScope.stock.name}(SH:${requestScope.stock.code})</strong>
        <span class="label label-warning" >沪港通</span>
          
          <c:choose>
            <c:when test="${!requestScope.isFocus}">
              <a href="/addfocus?stockId=${requestScope.stock.code}">
                <span class="label btn btn-success">+关 注</span>
              </a>
            </c:when>
            <c:otherwise>
              <a href="/removefocus?stockId=${requestScope.stock.code}">
                <span class="label btn btn-danger">取消关注</span>
              </a>
            </c:otherwise>
          </c:choose>

          
          
          
        </span>
    <div class="stock-price">
      <h2><strong id="price">$50.00</strong></h2>
            <span class="stock-updown">
                <span><strong id="change1">-0.00</strong></span>
                <span>&nbsp;&nbsp;(<strong id="change2">-0.00</strong>%)</span>
            </span>
    </div>
  </div>
  <table class="topTable">
    <tbody>
    <tr>
      <td>今开：<span id="open">22.22</span></td>
      <td>最高：<span id="high">32.68</span></td>
      <td title="当日成交量，单位：股">成交量：<span id="volume">2.21亿股</span></td></tr>
    <tr class="seperateTop"><td>昨收：<span id="close">32.68</span></td>
      <td>最低：<span id="quote-low">31.83</span></td>
      <td>成交额：<span id="amount">55.50亿</span></td></tr>
    <tr class="seperateBottom"><td>涨停价：<span id="zhangting">35.95</span></td>
      <td>总市值：<span> ${requestScope.stock.outstanding}</span></td>
      <td title="最近报告期每股收益，单位：人民币">每股收益：<span>${requestScope.stock.esp}</span></td>
      <td>市盈率LYR/TTM：<span>${requestScope.stock.pe}</span></td></tr>
    <tr><td>跌停价：<span id="dieting">29.41</span></td>
      <td>总股本：<span>${requestScope.stock.totals}万元</span></td>
      <td title="最近报告期每股净资产，单位：人民币">每股净资产：<span>${requestScope.stock.bvps}</span></td>
      <td>市净率TTM：<span>3.42</span></td></tr>
    <tr><td title="过去30个交易日平均成交量，单位：股">30日均量：<span>3.69亿</span></td>
      <td>流通股本：<span>${requestScope.stock.outstanding}</span></td><td>每股股息：<span>0.15</span></td>
      <td>市销率TTM：<span>10.47</span></td></tr>
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
        <div id="dayK_pic" style="width: 600px;height:360px;"></div>
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





<div class="container inputarea">

  <div class="input-head">
    <span>发表评论:</span>
  </div>
  <form action="/addcomment" method="get">
    <div class="input-body">
      <textarea class="form-control" name="comment" row="3"></textarea>
    </div>
    <div class="input-footer">
      <button class="btn btn-primary" name="stockCode" value="${requestScope.stock.code}" type="submit">发表评论</button>
    </div>
  </form>

</div>





<div class="container choose-card">

  <ul id="my-Tabs" class="nav nav-tabs " role="tablist">
    <li class="active"><a href="#bulletin" role="tab" data-toggle="tab">全部讨论</a></li>
    <li><a href="#rule" role="tab" data-toggle="tab">选项2</a></li>
    <li><a href="#forum" role="tab" data-toggle="tab">选项3</a></li>
    <li><a href="#security" role="tab" data-toggle="tab">选项4</a></li>
    <li><a href="#welfare" role="tab" data-toggle="tab">选项5</a></li>
  </ul>



  <!-- 选项卡面板 -->
  <div id="myTabContent" class="tab-content">
    <div class="tab-pane active" id="bulletin">


      <c:forEach var="c" items="${requestScope.comments}">
      <div class="media">
        <div class="media-left media-middle">
          <a href="#">
            <img class="media-object" src="/images/client2.jpg" alt="你">
          </a>
        </div>
        <div class="media-body">
          <%--<h4 class="media-heading">Usename:${c.userByUid.name}</h4>--%>
          <h5 class="media-content">${c.userByUid.name} <br>  ${c.comment}</h5>
          <h6 class="media-footer">time:${c.time}</h6>
        </div>
      </div>
      </c:forEach>





    </div>
    <div class="tab-pane fade" id="rule">选项2内容面板</div>
    <div class="tab-pane fade" id="forum">选项3内容面板</div>
    <div class="tab-pane fade" id="security">选项4内容面板</div>
    <div class="tab-pane fade" id="welfare">选项5内容面板</div>
  </div>
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
<script src="/build/dist/echarts-all.js"></script>






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




<script>

  current();
  window.setInterval('current()',4000)

  function current(){
    $.ajax({
      type: "get",
      async: true, //同步执行
      url: "/data/realtime?request=${requestScope.stock.code}",
      dataType: "json",
      success: function (result) {
        if (result) {

          close = result[0].pre_close;
          document.getElementById('price').innerHTML=result[0].price;
          document.getElementById('open').innerHTML=result[0].open;
          document.getElementById('close').innerHTML=result[0].pre_close;
          document.getElementById('zhangting').innerHTML=(result[0].pre_close*1.1).toFixed(2);
          document.getElementById('dieting').innerHTML=(result[0].pre_close*0.9).toFixed(2);
          document.getElementById('b1').innerHTML=result[0].b1_v;
          document.getElementById('b2').innerHTML=result[0].b2_v;
          document.getElementById('b3').innerHTML=result[0].b3_v;
          document.getElementById('b4').innerHTML=result[0].b4_v;
          document.getElementById('b5').innerHTML=result[0].b5_v;
          document.getElementById('s1').innerHTML=result[0].a1_v;
          document.getElementById('s2').innerHTML=result[0].a2_v;
          document.getElementById('s3').innerHTML=result[0].a3_v;
          document.getElementById('s4').innerHTML=result[0].a4_v;
          document.getElementById('s5').innerHTML=result[0].a5_v;
          document.getElementById('change1').innerHTML=(result[0].price-result[0].pre_close).toFixed(2);
          document.getElementById('change2').innerHTML=(((result[0].price-result[0].pre_close)/result[0].pre_close)*100).toFixed(2);

          document.getElementById("zhudongmai1").style.width = result[0].b1_v/(result[0].b1_v + result[0].a1_v)
          document.getElementById("zhudongmai2").style.width = result[0].a1_v/(result[0].b1_v + result[0].a1_v)
        }

      },

      error: function (errorMsg) {
        alert("图表请求数据失败啦!");
      }
    });


  }

</script>





<script type="text/javascript">



  var option4 = {
    title : {
      text: '分时图'
    },
    tooltip : {
      trigger: 'axis'
    },

    toolbox: {
      show : true,
      feature : {
        mark : {show: false},
        dataView : {show: true, readOnly: false},
        magicType : {show: false, type: ['line', 'bar']},
        restore : {show: true},
        saveAsImage : {show: true}
      }
    },
    calculable : false,
    xAxis : [
      {
        type : 'category',
        boundaryGap : false,
        data : ["09:25:02","09:31:00","09:32:03","09:33:06","09:34:06","09:35:06","09:36:06","09:37:09","09:38:12","09:39:15","09:40:15","09:41:21","09:42:21","09:43:27","09:44:27","09:45:27","09:46:30","09:47:36","09:48:43","09:49:46","09:50:46","09:51:46","09:52:49","09:53:49","09:54:55","09:56:01","09:57:04","09:58:04","09:59:04","10:00:04","10:01:10","10:02:13","10:03:16","10:04:22","10:05:22","10:06:25","10:07:28","10:08:35","10:09:35","10:10:35","10:11:38","10:12:44","10:13:47","10:14:47","10:15:50","10:16:56","10:17:56","10:18:59","10:20:02","10:21:08","10:22:08","10:23:11","10:24:11","10:25:14","10:26:20","10:27:20","10:28:30","10:29:36","10:30:39","10:31:42","10:32:42","10:33:42","10:34:48","10:35:54","10:37:00","10:38:03","10:39:03","10:40:03","10:41:06","10:42:06","10:43:06","10:44:15","10:45:21","10:46:21","10:47:21","10:48:28","10:49:40","10:50:49","10:51:55","10:52:58","10:53:58","10:54:58","10:56:10","10:57:10","10:58:13","10:59:19","11:00:22","11:01:22","11:02:25","11:03:25","11:04:28","11:05:28","11:06:31","11:07:34","11:08:38","11:09:44","11:10:44","11:11:44","11:12:44","11:13:44","11:14:50","11:15:50","11:16:50","11:17:50","11:18:53","11:19:56","11:21:05","11:22:05","11:23:05","11:24:08","11:25:08","11:26:11","11:27:14","11:28:23","11:29:24","13:00:25","13:01:25","13:02:25","13:03:28","13:04:28","13:05:28","13:06:31","13:07:37","13:08:44","13:09:44","13:10:44","13:11:44","13:12:50","13:13:53","13:14:56","13:15:56","13:16:59","13:17:59","13:18:59","13:20:05","13:21:11","13:22:11","13:23:14","13:24:14","13:25:17","13:26:20","13:27:26","13:28:30","13:29:33","13:30:36","13:31:42","13:32:45","13:33:57","13:34:57","13:35:57","13:36:57","13:37:57","13:38:57","13:40:06","13:41:06","13:42:12","13:43:15","13:44:15","13:45:15","13:46:21","13:47:25","13:48:25","13:49:28","13:50:31","13:51:31","13:52:40","13:53:43","13:54:43","13:55:43","13:56:43","13:57:52","13:58:58","14:00:01","14:01:01","14:02:01","14:03:07","14:04:10","14:05:10","14:06:17","14:07:20","14:08:20","14:09:20","14:10:26","14:11:26","14:12:26","14:13:29","14:14:32","14:15:35","14:16:41","14:17:41","14:18:44","14:19:47","14:20:50","14:21:59","14:22:59","14:24:08","14:25:11","14:26:12","14:27:21","14:28:30","14:29:33","14:30:33","14:31:42","14:32:42","14:33:48","14:34:51","14:35:51","14:37:00","14:38:00","14:39:03","14:40:15","14:41:15","14:42:21","14:43:24","14:44:27","14:45:27","14:46:34","14:47:37","14:48:37","14:49:37","14:50:40","14:51:49","14:52:49","14:53:49","14:54:52","14:55:52","14:56:52","14:57:52","14:58:52","14:59:52"]
      }
    ],
    yAxis : [
      {
        type : 'value',
        axisLabel : {
          formatter: '{value}'
        },
        scale:true
      }
    ],
    series : [
      {
        name:'分时图',
        type:'line',
        data:[],
        markPoint : {
          data : [
            {type : 'max', name: '最大值'},
            {type : 'min', name: '最小值'}
          ]
        },
        markLine : {
          data : [
            [
              { value: 100, xAxis: 0, yAxis: 0},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
              { xAxis: 500, yAxis: 0}
            ]
          ]
        }
      }
    ]
  };

  var currentChart = echarts.init(document.getElementById('current'));

  currentChart.showLoading({
    text: '正在努力的读取数据中...',    //loading话术
  });

  var time = [];
  var price= [];

    $.ajax({
      type: "get",
      async: true, //同步执行
      <%--url: "/data/tick_data?request=${requestScope.stock.code}&date=2015-06-23",--%>
      url: "/data/today?request=${requestScope.stock.code}",
      dataType: "json", //返回数据形式为json
      // data:{request:"000001"}
      success: function (result) {


        if (result) {
          //将返回的category和series对象赋值给options对象内的category和series
          //因为xAxis是一个数组 这里需要是xAxis[i]的形式


          for (var i = result.length-1, l = 0; i > l; i=i-20) {
            var o = result[i];
            price.push(o.price);
          }

          option4.series[0].data = price;
          option4.series[0].markLine.data[0][0].yAxis = close;
          option4.series[0].markLine.data[0][1].yAxis = close;

          setTimeout(function () {
            window.onresize = function () {
              currentChart.resize();
            }
          }, 200)


        }
        currentChart.hideLoading();

        currentChart.setOption(option4);

      },

      error: function (errorMsg) {
        alert("图表请求数据失败啦!");
      }
    });




</script>













<script type="text/javascript">
  $(function(){
    $(".list-group a").bind("click",function(){
      $(".list-group a").removeClass("active");
      $(this).addClass("active");
    })
  })

</script>


<script type="text/javascript">
  // 基于准备好的dom，初始化echarts实例
  var myChart = echarts.init(document.getElementById('dayK_pic'));
  myChart.showLoading({
    text: '正在努力的读取数据中...',    //loading话术
  });

  // 开盘，收盘，最低，最高
  var axisData = [];
  var data1 = [];




  option = {
    title : {
      text: '日K线表'
    },
    tooltip : {
      trigger: 'axis',
      formatter: function (params) {
        var res = params[0].seriesName + ' ' + params[0].name;
        res += '<br/>  开盘 : ' + params[0].value[0] + '  最高 : ' + params[0].value[3];
        res += '<br/>  收盘 : ' + params[0].value[1] + '  最低 : ' + params[0].value[2];
        return res;
      }
    },
    legend: {
      data:['上证指数']
    },
    toolbox: {
      show : true,
      feature : {
        mark : {show: true},
        dataZoom : {show: true},
        dataView : {show: true, readOnly: false},
        magicType: {show: true, type: ['line', 'bar']},
        restore : {show: true},
        saveAsImage : {show: true}
      }
    },
    dataZoom : {
      show : true,
      realtime: true,
      start : 50,
      end : 100
    },
    xAxis : [
      {
        type : 'category',
        boundaryGap : true,
        axisTick: {onGap:false},
        splitLine: {show:false},
        data : []
      }
    ],
    yAxis : [
      {
        type : 'value',
        scale:true,
        boundaryGap: [0.01, 0.01]
      }
    ],
    series : [
      {
        name:'上证指数',
        type:'k',
        data:[]
      }
    ]
  };



  $.ajax({
    type: "get",
    async: true, //同步执行
    url: "/data/history?request=${requestScope.stock.code}",
    dataType: "json",
    success: function (result) {
      if (result) {

        for (var i = 0, l = result.length; i < l; i++) {
          var o = result[i];
          var temp = [];
          axisData.push("2013/1/01");
          temp.push(o.open);
          temp.push(o.close);
          temp.push(o.low);
          temp.push(o.high);
          data1.push(temp);
        }

        //alert(axisData);
        option.xAxis[0].data = axisData;
        option.series[0].data = data1;

        myChart.hideLoading();

        myChart.setOption(option);


        setTimeout(function () {
          window.onresize = function () {
            myChart.resize();
          }
        }, 200)

      }
    }
  });



  // 使用刚指定的配置项和数据显示图表。

</script>


</body>
</html>