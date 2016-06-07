<%--
  Created by IntelliJ IDEA.
  User: fordevelopment
  Date: 15/6/23
  Time: 下午12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>





<div class="current-pic">
  <div id="main" style="height:230px"></div>
  <div id="main2" style="height:145px"></div>
</div>



<script src="/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/build/dist/echarts-all.js"></script>

<script>
var myChart = echarts.init(document.getElementById('main'));

myChart.showLoading({
text: '正在努力的读取数据中...',    //loading话术
});


option = {
title : {
text: '日线'
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
mark : {show: false},
dataZoom : {show: true},
magicType : {show: false},
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
data : []
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
name:'哈哈哈哈',
type:'k',
data:[ // 开盘，收盘，最低，最高

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

//myChart.setOption(option);




















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
data : []

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
type:'bar',
symbol: 'none',
data:[

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


var myChart2 = echarts.init(document.getElementById('main2'));
//myChart2.setOption(option2);




getdata();





//myChart3 = echarts.init(document.getElementById('main3'));
//myChart3.setOption(option3);











function getdata() {
//获得图表的options对象
var axisData = [];
var data1 = [];
var data2 = [];

$.ajax({
type: "get",
async: true, //同步执行
url: "/data/history?request=000006",
dataType: "json", //返回数据形式为json
// data:{request:"000001"}
success: function (result) {

if (result) {
//将返回的category和series对象赋值给options对象内的category和series
//因为xAxis是一个数组 这里需要是xAxis[i]的形式

for (var i = 0, l = result.length; i < l; i++) {
var o = result[i];
var temp = [];
axisData.push(o.date);
temp.push(o.open);
temp.push(o.close);
temp.push(o.low);
temp.push(o.high);
data1.push(temp);
data2.push(o.volume);
}

option.xAxis[0].data = axisData;
option2.xAxis[0].data = axisData;
option.series[0].data = data1;
option2.series[0].data = data2;

myChart.setOption(option);
myChart.hideLoading();

myChart2.setOption(option2);
//myChart3.hideLoading();
//myChart3.setOption(option3);


myChart.connect(myChart2);
myChart2.connect(myChart);


setTimeout(function () {
window.onresize = function () {
myChart.resize();
myChart2.resize();
//myChart3.resize();
}
}, 200)


}
},

error: function (errorMsg) {
alert("图表请求数据失败啦!");
}
});


}













</script>

</body>
</html>
