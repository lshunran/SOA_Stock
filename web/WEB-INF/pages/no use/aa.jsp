<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fordevelopment
  Date: 15/5/25
  Time: 下午5:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>






<!DOC TYPE html>
<html>
<head>
  <title>Two-Bytes Bootstrap Website Template| Home :: w3layouts</title>
  <link href="./css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
  <link href="./css/style.css" rel="stylesheet" type="text/css" media="all"/>
  <!--web-fonts-->
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
  <!--js-->
  <script src="./js/jquery.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- start-smoth-scrolling -->
  <script type="text/javascript" src="./js/move-top.js"></script>
  <script type="text/javascript" src="./js/easing.js"></script>
  <script src="../jquery.autocomplete.js"></script>

  <script type="text/javascript">
    jQuery(document).ready(function($) {
      $(".scroll").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
      });
    });





    $(function () {
      var arrUserName = [<c:forEach var="stock" items="${requestScope.allStock}">
              "${stock.stockId}  ${stock.stockName}  ${stock.stockFirstLetter}",
        </c:forEach> ];
      $("#txtSearch").autocomplete(arrUserName,{
        formatItem: function (data, i, total) {
          return "<I>" + data[0] + "</I>"; //改变匹配数据显示的格式
        },
        formatMatch: function (data, i, total) {
          return data[0];
        },
        formatResult: function (data) {
          return data[0];
        }
      }).result(SearchCallback);

    });

  </script>
  <!-- //end-smoth-scrolling -->
</head>
<body>
<!--header start here-->
<div class="header">
  <div class="container">
    <div class="header-main home">
      <div class="logo">
        <a href="../index.jsp"><img src="./images/logo.png" alt=""></a>
      </div>
      <span class="menu"> <img src="./images/icon.png"> </span>
      <div class="header-navg">
        <ul class="res">
          <li><a class="active" href="../index.jsp">HOME</a></li>
          <li><a href="aboutus.html">ABOUT US</a></li>
          <li><a href="jobs.html">JOBS</a></li>
          <li><a href="clients.html">CLIENTS</a></li>
          <li><a href="employers.html">EMPLOYERS</a></li>
          <li><a href="contactus.html">CONTACT US</a></li>
        </ul>
        <script>
          $( "span.menu").click(function() {
            $(  "ul.res" ).slideToggle("slow", function() {
              // Animation complete.
            });
          });
        </script>
      </div>
      <div class="clearfix"> </div>
    </div>
    <div class="header-bottom">
      <h1>l'm looking for..</h1>
      <form method="post" action="servlet">
        <input id="txtSearch" type="text" name="stockid">
        <input type="submit"  class="ser" value="Search"><br>
        <label class="checkbox" >
          <input type="checkbox" value="checked">
          Full Time
        </label>
        <label class="checkbox" >
          <input type="checkbox" value="checked">
          Part Time/Casual/Freelance
        </label>
      </form>
    </div>
  </div>
</div>
<div class="intro-strip"> </div>
<!--about start here-->
<div class="intro">
  <div class="container">
    <div class="intro-main">
      <div id="main" style="height:230px"></div>
      <div id="main2" style="height:145px"></div>
      <div id="main3" style="height:105px"></div>
    </div>
    <div class="clearfix"> </div>
  </div>
</div>
</body>
<!--contant start here-->
</html>







<script src="./build/dist/echarts-all.js"></script>

<script type="text/javascript">

  var axisData = [
    <c:forEach var="stock" items="${requestScope.dkl}">
          "${stock.date}",
    </c:forEach>
  ];

  option = {
    title : {
      text: '${requestScope.stockInf.stockName}  日线'
    },
    tooltip : {
      trigger: 'axis',
      showDelay: 0,             // 显示延迟，添加显示延迟可以避免频繁切换，单位ms
      formatter: function (params) {
        var res = params[0].name;
        res += '<br/>' + params[0].seriesName;
        res += '<br/>  开盘 : ' + params[0].value[0] + '  最高 : ' + params[0].value[3];
        res += '<br/>  收盘 : ' + params[0].value[1] + '  最低 : ' + params[0].value[2];
        return res;
      }
    },
    legend: {
      data:['上证指数','成交量(万手)','成交金额(万元)']
    },
    toolbox: {
      show : true,
      feature : {
        mark : {show: true},
        dataZoom : {show: true},
        magicType : {show: true, type: ['line', 'bar']},
        restore : {show: true},
        saveAsImage : {show: true}
      }
    },
    dataZoom : {
      y: 250,
      show : true,
      realtime: true,
      start : 50,
      end : 100
    },
    grid: {
      x: 80,
      y: 40,
      x2:20,
      y2:25
    },
    xAxis : [
      {
        type : 'category',
        boundaryGap : true,
        axisTick: {onGap:false},
        splitLine: {show:false},
        data : axisData
      }
    ],
    yAxis : [
      {
        type : 'value',
        scale:true,
        boundaryGap: [0.05, 0.05],
        splitArea : {show : true}
      }
    ],
    series : [
      {
        name:'${requestScope.stockInf.stockName}',
        type:'k',
        data:[ // 开盘，收盘，最低，最高

          <c:forEach var="stock" items="${requestScope.dkl}">[${stock.open},${stock.close},${stock.low},${stock.high}], </c:forEach>

        ]
      },
      {
        name:'成交量(万手)',
        type:'line',
        symbol: 'none',
        data:[]
      },
      {
        name:'成交金额(万元)',
        type:'bar',data:[]
      }

    ]
  };

  myChart = echarts.init(document.getElementById('main'));
  myChart.setOption(option);

  option2 = {
    tooltip : {
      trigger: 'axis',
      showDelay: 0             // 显示延迟，添加显示延迟可以避免频繁切换，单位ms
    },
    legend: {
      y : -30,
      data:['上证指数','成交量(万手)','成交金额(万元)']
    },
    toolbox: {
      y : -30,
      show : true,
      feature : {
        mark : {show: true},
        dataZoom : {show: true},
        dataView : {show: true, readOnly: false},
        magicType : {show: true, type: ['line', 'bar']},
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
    grid: {
      x: 80,
      y:5,
      x2:20,
      y2:40
    },
    xAxis : [
      {
        type : 'category',
        position:'top',
        boundaryGap : true,
        axisLabel:{show:false},
        axisTick: {onGap:false},
        splitLine: {show:false},
        data : axisData
      }
    ],
    yAxis : [
      {
        type : 'value',
        scale:true,
        splitNumber: 3,
        boundaryGap: [0.05, 0.05],
        axisLabel: {
          formatter: function (v) {
            return Math.round(v/10000) + ' 万'
          }
        },
        splitArea : {show : true}
      }
    ],
    series : [
      {
        name:'成交量(万手)',
        type:'line',
        symbol: 'none',
        data:[
          <c:forEach var="stock" items="${requestScope.dkl}">${stock.volume}, </c:forEach>
        ],
        markLine : {
          symbol : 'none',
          itemStyle : {
            normal : {
              color:'#1e90ff',
              label : {
                show:false
              }
            }
          },
          data : [
            {type : 'average', name: '平均值'}
          ]
        }
      }
    ]
  };
  myChart2 = echarts.init(document.getElementById('main2'));
  myChart2.setOption(option2);

  option3 = {
    tooltip : {
      trigger: 'axis',
      showDelay: 0             // 显示延迟，添加显示延迟可以避免频繁切换，单位ms
    },
    legend: {
      y : -30,
      data:['上证指数','成交量(万手)','成交金额(万元)']
    },
    toolbox: {
      y : -30,
      show : true,
      feature : {
        mark : {show: true},
        dataZoom : {show: true},
        dataView : {show: true, readOnly: false},
        magicType : {show: true, type: ['line', 'bar']},
        restore : {show: true},
        saveAsImage : {show: true}
      }
    },
    dataZoom : {
      y:200,
      show : true,
      realtime: true,
      start : 50,
      end : 100
    },
    grid: {
      x: 80,
      y:5,
      x2:20,
      y2:30
    },
    xAxis : [
      {
        type : 'category',
        position:'bottom',
        boundaryGap : true,
        axisTick: {onGap:false},
        splitLine: {show:false},
        data : axisData
      }
    ],
    yAxis : [
      {
        type : 'value',
        scale:true,
        splitNumber:3,
        boundaryGap: [0.05, 0.05],
        axisLabel: {
          formatter: function (v) {
            return Math.round(v/10000) + ' 万'
          }
        },
        splitArea : {show : true}
      }
    ],
    series : [
      {
        name:'成交金额(万元)',
        type:'bar',
        symbol: 'none',
        data:[
          <c:forEach var="stock" items="${requestScope.dkl}">${stock.amount}, </c:forEach>
        ],
        markLine : {
          symbol : 'none',
          itemStyle : {
            normal : {
              color:'#1e90ff',
              label : {
                show:false
              }
            }
          },
          data : [
            {type : 'average', name: '平均值'}
          ]
        }
      }
    ]
  };

  myChart3 = echarts.init(document.getElementById('main3'));
  myChart3.setOption(option3);

  myChart.connect([myChart2, myChart3]);
  myChart2.connect([myChart, myChart3]);
  myChart3.connect([myChart, myChart2]);

  setTimeout(function (){
    window.onresize = function () {
      myChart.resize();
      myChart2.resize();
      myChart3.resize();
    }
  },200)













</script>








