<%--
  Created by IntelliJ IDEA.
  User: fordevelopment
  Date: 15/6/23
  Time: 下午10:12
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
<div class="huge-screen">
  <div class="hs-bg" id="huge-screen-bg">
    <div class="container">
      <div class="row">
        <div class="title-text">
          <div class="col-md-12 headfontsize">
            <h1 class="headh1content">
              Stock Zone<br>
              The most popular stock community
            </h1>
            <p style="margin-top: 50px; line-height: 33px">No matter you are a novice or veteran, here can certainly find you want</p>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</div>
<div class="page-header sec-header">
  <h1><small>Today Topics</small></h1>
</div>
<div class="container">
  <div class="row">
    <div class="col-sm-6 col-md-4">
      <div class="thumbnail">
        <div class="caption">
          <a href="#" ><div class="news-bg news-bg-1"></div></a>
          <h4><a href="#" id="news_1_title">巨无霸真来了！中国核电周三上市</a></h4>
          <p id="news_1_content">上海证券交易所通知称，中国近四年最大规模新股——中国核能电 力股份首次公开发行的38.91亿股A股，将于周三（10日）起在上 交所上市交易。</p>
          <p><a href="#" class="btn btn-primary news_1_detail" id="news_1_detail" role="button">查看详细</a></p>
        </div>
      </div>
    </div>

    <div class="col-sm-6 col-md-4">
      <div class="thumbnail">
        <div class="caption">
          <a href="#" > <div class="news-bg news-bg-2"></div></a>
          <h4><a href="#" id="news_2_title">巨无霸真来了！中国核电周三上市</a></h4>
          <p id="news_2_content">上海证券交易所通知称，中国近四年最大规模新股——中国核能电 力股份首次公开发行的38.91亿股A股，将于周三（10日）起在上 交所上市交易。</p>
          <p><a href="#" class="btn btn-primary news_2_detail" id="news_2_detail" role="button">查看详细</a></p>
        </div>
      </div>
    </div>

    <div class="col-sm-6 col-md-4">
      <div class="thumbnail">
        <div class="caption">
          <a href="..." ><div class="news-bg news-bg-3"></div></a>
          <h4><a href="#" id="news_3_title">巨无霸真来了！中国核电周三上市</a></h4>
          <p id="news_3_content">上海证券交易所通知称，中国近四年最大规模新股——中国核能电 力股份首次公开发行的38.91亿股A股，将于周三（10日）起在上 交所上市交易。</p>
          <p><a href="#" class="btn btn-primary news_3_detail" id="news_3_detail" role="button">查看详细</a></p>
        </div>
      </div>
    </div>
  </div>
  <div class="list-group">
    <a href="#" class="list-group-item disabled">
      财经新闻热点
    </a>
    <a href="#" class="list-group-item news_list"></a>
    <a href="#" class="list-group-item news_list"></a>
    <a href="#" class="list-group-item news_list"></a>
    <a href="#" class="list-group-item news_list"></a>
    <a href="#" class="list-group-item news_list"></a>
    <a href="#" class="list-group-item news_list"></a>
    <a href="#" class="list-group-item news_list"></a>
    <a href="#" class="list-group-item news_list"></a>
    <a href="#" class="list-group-item news_list"></a>
    <a href="#" class="list-group-item news_list"></a>


  </div>
  <button  class="btn btn-primary" onclick="update_news()">看完了?换一批吧</button>



</div>



<br><br><br><br><br><br>

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
<script src="/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>


<%--TODO 登陆--%>


<script>


  get_News();
  window.setTimeout('get_News()',1000);

  window.setInterval('get_News()',3600000);

  function get_News() {
    $.ajax({
      type: "get",
      async: true, //同步执行
      url: "/get_News",
      dataType: "json",
      success: function (result) {
        if (result) {

//          alert("111111");
//         alert(result.showapi_res_body.pagebean.contentlist[0].link);

          document.getElementById("news_1_title").innerHTML = result.showapi_res_body.pagebean.contentlist[3].title;
          document.getElementById("news_1_content").innerHTML = result.showapi_res_body.pagebean.contentlist[3].desc;
          document.getElementById("news_1_detail").href = result.showapi_res_body.pagebean.contentlist[3].link;

          document.getElementById("news_2_title").innerHTML = result.showapi_res_body.pagebean.contentlist[1].title;
          document.getElementById("news_2_content").innerHTML = result.showapi_res_body.pagebean.contentlist[1].desc;
          document.getElementById("news_2_detail").href = result.showapi_res_body.pagebean.contentlist[1].link;

          document.getElementById("news_3_title").innerHTML = result.showapi_res_body.pagebean.contentlist[2].title;
          document.getElementById("news_3_content").innerHTML = result.showapi_res_body.pagebean.contentlist[2].desc;
          document.getElementById("news_3_detail").href = result.showapi_res_body.pagebean.contentlist[2].link;



          var news_list = document.getElementsByClassName("news_list");
//
//          news_list[0].innerHTML = result.showapi_res_body.pagebean.contentlist[19].title;
//          news_list[0].href = result.showapi_res_body.pagebean.contentlist[19].link;



          for(var i = 0;i < news_list.length;i++){
            news_list[i].innerHTML = result.showapi_res_body.pagebean.contentlist[i].title;
            news_list[i].href = result.showapi_res_body.pagebean.contentlist[i].link;


          }



        }
      }
    })
  }



  var update_time = 1;
  function update_news(){

    update_time = update_time + 1;
    $.ajax({
      type: "post",
      async: true, //同步执行
      url: "/update_News",
      data:{page : update_time},
      dataType: "json",
      success: function (result) {
        if (result) {

          if(result.showapi_res_body.pagebean.currentPage > result.showapi_res_body.pagebean.allPages )
                  alert("没有了~");
          else {


            var news_list = document.getElementsByClassName("news_list");


            for (var i = 0; i < news_list.length; i++) {
              news_list[i].innerHTML = result.showapi_res_body.pagebean.contentlist[i].title;
              news_list[i].href = result.showapi_res_body.pagebean.contentlist[i].link;


            }

          }


        }
      }
    })

  }

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


</html>