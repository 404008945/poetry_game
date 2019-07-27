<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE HTML>
  <html>
  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>诗词搜索</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
      <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
      <meta name="author" content="freehtml5.co" />
      <!-- Facebook and Twitter integration -->
      <meta property="og:title" content=""/>
      <meta property="og:image" content=""/>
      <meta property="og:url" content=""/>
      <meta property="og:site_name" content=""/>
      <meta property="og:description" content=""/>
      <meta name="twitter:title" content="" />
      <meta name="twitter:image" content="" />
      <meta name="twitter:url" content="" />
      <meta name="twitter:card" content="" />
      <style type="text/css">
      </style>
  </head>
  <body style="background-color: #eaf5ff">
  <div class="fh5co-loader"></div>
  <div id="page">
     <jsp:include page="nav.jsp"/>
      <div style="padding-top: 80px"; class="container">
          <form class="bs-example bs-example-form col-md-offset-2 col-lg-offset-2 col-xl-offset-2" action="/enjoy/search/1" role="form">
              <div class="row">
                  <div class="col-lg-8 col-lg-offset-1">
                      <div style="text-align: center;margin-bottom: 100px"><h1>极简诗社</h1></div>
                      <label for="name">请先选择搜索类型</label>
                      <select id="name" name="searchType" class="form-control input-group" style="margin-bottom: 20px;font-size: 20px">
                          <option value="0">按作者名</option>
                          <option value="1">按诗词名</option>
                          <option value="2">模糊搜索</option>
                      </select>
                      <div class="input-group input-group-lg">
                          <input type="text" name="content" class="form-control">
                          <span class="input-group-btn">
                          <button class="btn btn-default" style="font-size: 20px" type="submit">
                             搜索
                          </button>
                      </span>
                      </div><!-- /input-group -->
                      <div>
                      </div>
                  </div><!-- /.col-lg-6 --><br>
              </div><!-- /.row -->
          </form>
          <% int a=0;%>
          <div class="col-lg-12  hello" style="text-align:center;margin-top: 20px"><h3>搜索热门:</h3>
              <c:forEach var="hot" items="${hots}">
                  <div style="text-align: center">
                      <form action="/enjoy/search/1" style="margin-bottom: 10px;">
                          <input type="hidden" name="searchType" value="${hot.type}">
                          <input type="hidden" name="content" value="${hot.words}">
                          <button type="submit" class="btn btn-info hot" style="color:#000000;font-size:20px;background-color: #ffffff;border: none;width:50%;text-align: left";><%=++a%>: ${hot.words}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#df0054;text-align: right;">热度:${hot.count}</span></button>
                      </form></div>
              </c:forEach>
          </div>
      </div>
      <jsp:include page="footer.jsp"/>
  </div>
  <div class="gototop js-top">
      <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
  </div>

  <!-- jQuery -->
  <script src="/js/jquery.min.js"></script>
  <!-- jQuery Easing -->
  <script src="/js/jquery.easing.1.3.js"></script>
  <!-- Bootstrap -->
  <script src="/js/bootstrap.min.js"></script>
  <!-- Waypoints -->
  <script src="/js/jquery.waypoints.min.js"></script>
  <!-- Flexslider -->
  <script src="/js/jquery.flexslider-min.js"></script>
  <!-- Main -->
  <script src="/js/main.js"></script>
  <script>
      $("button").css({'background-color':'#87c0cd'});
      function changeDivWidth() {
          var w=document.documentElement.clientWidth;
          if(w<500)
          {
              $(".hot").css({'width':'100%'})
          }else{
              $(".hot").css({'width':'50%'})
          }
      }
      changeDivWidth();
  </script>
  </body>
  </html>


