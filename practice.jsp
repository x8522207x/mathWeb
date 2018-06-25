<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="ascdc.sinica.dhtext.db.DBText"%>
<%@ page import ="java.util.ArrayList"%>
<html>
	<head>
		<link rel="stylesheet" href="css/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/style.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
		<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	</head>
	<body id ="practice">
	<h4>次方請用^數字表示 ex:(x^2 = x平方) 分數請用/表示 ex:(x/2 = 二分之x)</h4>
	</body>
	<script>
	
	var question = getCookie('question').substring(1,getCookie('question').length-1).split(",");
	var answer = getCookie('answer').substring(1,getCookie('answer').length-1).split(",");

	var tbody = document.getElementById('practice');
	for(var i = 0 ; i< question.length ; i++){
		var div = document.createElement('div');
		var h4 = document.createElement('h4');
		var h4_2 = document.createElement('h4');
		var input = document.createElement('input');
		var button = document.createElement('button');
		h4.append(parseInt(i)+1+": "+ question[i]);
		h4_2.append("答案");
		h4_2.appendChild(input);
		input.setAttribute('type','textarea');
		input.setAttribute('id',i);
		button.setAttribute('class','btn btn-sm btn-outline-secondary');
		button.setAttribute('type','button');
		button.setAttribute('name','submit');
		button.setAttribute('id','button'+i);
		div.appendChild(h4);
		div.appendChild(h4_2);
		div.appendChild(input);
		div.appendChild(button);
		tbody.appendChild(div);
		document.getElementsByTagName("button")[i].textContent ="送出";
	}
	$("button[name='submit']").click( function(){
		var userAnswer = $("#"+this.id.split("button")[1])[0].value;
		if(userAnswer === answer[this.id.split("button")[1]]){
			alert("答對囉:)");
		}else{
			alert("答錯囉:(");
		}
		console.log($("#"+this.id.split("button")[1])[0].value);
	})
	function setCookie(cname, cvalue, exdays) {
		var d = new Date();
		d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
		var expires = "expires=" + d.toUTCString();
		document.cookie = cname + "=" + cvalue + ";path=" + location.host + "; " + expires;
	}
	function getCookie(cname) {
		var name = cname + "=";
		var ca = document.cookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') c = c.substring(1);
			if (c.indexOf(name) == 0)
				return c.substring(name.length, c.length);
		}
		return "";
	}
	</script>
</html>