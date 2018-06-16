<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ page import="utils.*" %>
<%@include file="Include/functions.jsp" %>
<%
String title    = getString(request.getParameter("title"));
String desc     = getString(request.getParameter("desc"));
String css		= getString(request.getParameter("css"));
String js		= getString(request.getParameter("js"));
String style	= getString(request.getParameter("style"));
%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="微積分教學平台">
  <title>微積分教學平台</title>
  <link href="css/main.css" rel="stylesheet" /> 
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
  <link rel="stylesheet" href="css/fontawesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <script src="JS/jquery.min.js"></script>
  <script src="JS/ie-emulation-modes-warning.js"></script> 
  <%="".equals(css) ? "" : css%>
  <script src="JS/vue.min.js"></script>
  <script src="JS/vee-validate.min.js"></script>
  <script src="JS/ie10-viewport-bug-workaround.js"></script>
  
  <script src="JS/bootstrap.min.js"></script>
  <%="".equals(js) ? "" : js%>
  <%="".equals(style) ? "" : "<style>" + style + "</style>"%>
</head>
<body>
  <div class="container">
    <h2 class="form-signin-heading text-center">微積分教學平台</h2>
	<h2 class="form-signin-heading text-center">登入身分</h2>
	<button id="student" onclick="studentLog()">學生</button>
	<button id="teacher" onclick="teacherLog()">老師</button>
  </div>
  <div class="container" id="studentLogin" hidden>
    <form class="form-signin" role="form" method="POST">
	  <h2 class="form-signin-heading text-center">學生</h2>
	  <br>
	  <label for="inputEmail" class="sr-only">帳號</label> 
	  <input type="text" id="student-account" class="form-control" placeholder="帳號"  autofocus required name="account" >
	  <br>
	  <label for="inputPassword" class="sr-only">密碼</label> 
	  <input type="password" id="student-password" class="form-control" placeholder="密碼" required name="password" >
	  <br>
	  <button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
	  <br>
	  <div class="text-right margin-top--20">還沒有帳號？我要 <a href="studentRegister.jsp">註冊</a></div>
	</form>
  </div>
  <div class="container" id="teacherLogin" hidden>
    <form class="form-signin" role="form" method="POST" action="api/processLogin.jsp">
	  <h2 class="form-signin-heading text-center">老師</h2>
	  <br>
	  <label for="inputEmail" class="sr-only">帳號</label> 
	  <input type="text" id="teacher-account" class="form-control" placeholder="帳號"  autofocus required name="account" >
	  <br>
	  <label for="inputPassword" class="sr-only">密碼</label> 
	  <input type="password" id="teacher-password" class="form-control" placeholder="密碼" required name="password" >
	  <br>
	  <button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
	  <br>
	  <div class="text-right margin-top--20">還沒有帳號？我要 <a href="teacherRegister.jsp">註冊</a></div>
	</form>
  </div>
</body>
</html>
<script>
	function studentLog(){
		$("#studentLogin").attr('hidden',false);
		$("#teacherLogin").attr('hidden',true);
	}
	function teacherLog(){
		$("#teacherLogin").attr('hidden',false);
		$("#studentLogin").attr('hidden',true);
	}
	var data = {

	};
	var app = new Vue({
	  el: '#app',
	  data: data	  
	});
</script>
