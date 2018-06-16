<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="ascdc.sinica.dhtext.db.DBText"%>
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
  <div class="container" id="app">
    <form class="register-form" role="form" method="post" id="form1">
      <div class="rg-back-login"><a href="login.jsp">回登入頁</a></div>
	  <input type="hidden" name="op" value="add">
	  <h2 class="form-signin-heading text-center">註冊</h2>
	  <label for="inputName">姓名</label> 
	  <input type="text" id="ip-name" name="name" class="form-control" placeholder="">
	  <span class="danger" id="ipn">請輸入姓名</span>
	  <br>
	  <label for="inputStudentNumber" class="margin-top-20">帳號</label>
	  <input type="text" id="ip-account" name="account" class="form-control" placeholder="">
	  <span class="danger" id="ipa">請輸入帳號(7個字元以上)</span>
	  <button id="bc" type="button" disabled>檢查重複</button>
	  <br>
	  <label for="inputPassword">密碼</label> 
	  <input type="password" id="ip-password" name="password" class="form-control" placeholder="">
	  <span class="danger" id="ip1">請輸入至少 8 個字元以上</span>
	  <br>
	  <label for="inputPassword2">再次輸入密碼</label> 
	  <input type="password" id="ip-password-2" class="form-control" name="password2" placeholder="">
	  <span class="danger" id="ip2" hidden>兩次密碼輸入不一致</span>
	  <br>
	  <label for="inputEmail">E-Mail</label> 
	  <input type="text" id="ip-email" name="email" class="form-control" placeholder="">
	  <span class="danger" id="ipe">請輸入有效的 email</span>
	  <br>
	  <label for="inputDepart">辦公室</label> 
	  <input type="text" id="ip-depart" name="org" class="form-control" placeholder="">
	  <span class="danger" id="ipd">請輸入辦公室</span>
	  <br>
	  <button class="btn btn-lg btn-primary btn-block margin-top-20" id="final" type="button" onclick="register()" disabled>註冊帳號</button>
	</form>
  </div>
</body>
</html>
<script>
	var nameInput = document.getElementById('ip-name');
	var passwordInput = document.getElementById('ip-password');
	var passwordInput2 = document.getElementById('ip-password-2');
	var emailInput = document.getElementById('ip-email');
	var departInput = document.getElementById('ip-depart');
	var accountInput = document.getElementById('ip-account');
	departInput.onkeyup = function(e){
		if( departInput.value.length > 0){
			document.getElementById('ipd').setAttribute('hidden','hidden');
		}else{
			document.getElementById('ipd').removeAttribute('hidden');
		}
	}
	accountInput.onkeyup = function(e){
		if( accountInput.value.length > 6){
			document.getElementById('ipa').setAttribute('hidden','hidden');
			document.getElementById('bc').removeAttribute('disabled');
		}
	}
	nameInput.onkeyup = function(e){
		if( nameInput.value.length > 0){
			document.getElementById('ipn').setAttribute('hidden','hidden');
		}
	}
	passwordInput.onkeyup = function(e){
		if(passwordInput.value.length >= 8){
			document.getElementById('ip1').setAttribute('hidden','hidden');
		}
	}
	passwordInput2.onkeyup = function (e) {
		if( passwordInput.value !== passwordInput2.value){
			document.getElementById('ip2').removeAttribute('hidden');
		}else if(passwordInput.value === passwordInput2.value){
			document.getElementById('ip2').setAttribute('hidden','hidden');
		}
	};
	emailInput.onkeyup = function(e){
		if( validateEmail(emailInput.value)){
			document.getElementById('ipe').setAttribute('hidden','hidden');
		}else{
			document.getElementById('ipe').removeAttribute('hidden');
		}
	}

	function validateEmail(email) {
		var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(String(email).toLowerCase());
	}
	function register(){
		if( nameInput.value.length === 0 || passwordInput.value.length === 0 || passwordInput2.value.length === 0 || emailInput.value.length === 0 || departInput.value.length === 0 || accountInput.value.length === 0){
			alert("還有欄位未填");
		}else if( nameInput.value.length > 0 && passwordInput.value.length > 7 && passwordInput2.value.length > 7 && emailInput.value.length > 0 && departInput.value.length > 0 && accountInput.value.length>6){
			$.ajax({
				url: 'api/math/tAccountDB.jsp',
				type: 'POST',
				async: false,
				data: {
					"register"  : "true",
					"account"	: accountInput.value,
					"password"	: passwordInput.value,
					"email"	: emailInput.value,
					"name"	: nameInput.value,
					"Dept"	: departInput.value
				},
			});
			alert("恭喜註冊成功!即將跳回登入頁");
			window.location = "http://localhost:8080/math/login.jsp";
		}
	}
	
	$("#bc").click(function(){
		$.ajax({
				url: 'api/math/tAccountDB.jsp',
				type: 'POST',
				data: {
					"check"  : "true",
					"account"	: accountInput.value,
				},
		}).done(function (data){
				if(data.includes("true") === true){
					alert("恭喜!這個帳號可以使用");
					document.getElementById('final').removeAttribute('disabled');
				}else if(data.includes("false") === true){
					alert("這個帳號已經有人註冊");
				}
		});
    }); 
</script>
