<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<html lang="zh-TW">
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
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="lobby.jsp">微積分教學平台</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<h4 id="user" style="position:absolute;right:80px;"></h4>
			<a class="btn btn-outline-primary" href="login.jsp"  style="position:absolute;right:10px;">登出</a>
		</nav>
		<div class="container-fluid">
			<div class="row">
				<nav class="col-md-2 d-none d-md-block bg-light sidebar">
					<div class="sidebar-sticky">
						<ul class="nav flex-column">
							<li class="nav-item">
								<a class="nav-link active" id="classVideo" onclick="classVideo()" href="#classVideo">
									<img src="image/video.png" height="24" width="24">上課影片
								</a>
							</li>
							<li class="nav-item">  
								<a class="nav-link active" id="practiceQ" onclick="practiceQ()" href="#practiceQ">
									<img src="image/practice.jpg" height="24" width="24">練習題目
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link active" id="testQ" onclick="testQ()" href="#testQ">
									<img src="image/exam.png" height="24" width="24">考試題目
								</a>
							</li>
						</ul>
					</div>
				</nav>

				<main role="main" id="main1" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4" hidden>
					<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
						<div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
							<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
						</div>
						<div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
							<div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
						</div>
					</div>
					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
						<h1 class="h2">上課影片</h1>
						<div class="btn-toolbar mb-2 mb-md-0">
							<div class="btn-group mr-2">
								<button class="btn btn-sm btn-outline-secondary" id="add" hidden>
									<img src="https://use.fontawesome.com/releases/v5.0.13/svgs/solid/plus.svg"  width=24 height=24>
								新增</button>
							</div>
							<div class="btn-group mr-2">
								<button class="btn btn-sm btn-outline-secondary" id="delete" hidden>
									<img src="https://use.fontawesome.com/releases/v5.0.13/svgs/solid/trash-alt.svg" width=24 height=24>
								刪除</button>
							</div>
							<div class="btn-group mr-2">
								<button class="btn btn-sm btn-outline-secondary" id="edit" hidden>
									<img src="https://use.fontawesome.com/releases/v5.0.13/svgs/solid/edit.svg" width=24 height=24>
								修改</button>
							</div>
						</div>
					</div>
					<canvas class="my-4 chartjs-render-monitor" id="myChart" width="866" height="365" style="display: block; width: 866px; height: 365px;"></canvas>
				</main>
				<main role="main" id="main2" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4" hidden>
					<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
						<div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
							<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
						</div>
						<div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
							<div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
						</div>
					</div>
					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
						<h1 class="h2">練習題目</h1>
						<div class="btn-toolbar mb-2 mb-md-0">
							<div class="btn-group mr-2">
								<button class="btn btn-sm btn-outline-secondary" id="add2" hidden>
									<img src="https://use.fontawesome.com/releases/v5.0.13/svgs/solid/plus.svg"  width=24 height=24>
								新增</button>
							</div>
							<div class="btn-group mr-2">
								<button class="btn btn-sm btn-outline-secondary" id="delete2" hidden>
									<img src="https://use.fontawesome.com/releases/v5.0.13/svgs/solid/trash-alt.svg" width=24 height=24>
								刪除</button>
							</div>
							<div class="btn-group mr-2">
								<button class="btn btn-sm btn-outline-secondary" id="edit2" hidden>
									<img src="https://use.fontawesome.com/releases/v5.0.13/svgs/solid/edit.svg" width=24 height=24>
								修改</button>
							</div>
						</div>
					</div>
					<canvas class="my-4 chartjs-render-monitor" id="myChart" width="866" height="365" style="display: block; width: 866px; height: 365px;"></canvas>
				</main>
				<main role="main" id="main3" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4" hidden>
					<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
						<div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
							<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
						</div>
						<div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
							<div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
						</div>
					</div>
					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
						<h1 class="h2">考試題目</h1>
						<div class="btn-toolbar mb-2 mb-md-0">
							<div class="btn-group mr-2">
							<input type="checkbox" id="switch" checked data-toggle="toggle" data-on="開啟" data-off="關閉" data-offstyle="danger" ></input>
							</div>
							<div class="btn-group mr-2">
								<button class="btn btn-sm btn-outline-secondary" id="add3" hidden>
									<img src="https://use.fontawesome.com/releases/v5.0.13/svgs/solid/plus.svg"  width=24 height=24>
								新增</button>
							</div>
							<div class="btn-group mr-2">
								<button class="btn btn-sm btn-outline-secondary" id="delete3" hidden>
									<img src="https://use.fontawesome.com/releases/v5.0.13/svgs/solid/trash-alt.svg" width=24 height=24>
								刪除</button>
							</div>
							<div class="btn-group mr-2">
								<button class="btn btn-sm btn-outline-secondary" id="edit3" hidden>
									<img src="https://use.fontawesome.com/releases/v5.0.13/svgs/solid/edit.svg" width=24 height=24>
								修改</button>
							</div>
						</div>
					</div>
					<canvas class="my-4 chartjs-render-monitor" id="myChart" width="866" height="365" style="display: block; width: 866px; height: 365px;"></canvas>
				</main>
			</div>
		</div>
	</body>
	</html>
	<script type="text/javascript">
		$(function() {
			if(getCookie('switchCheck') === 'true'){
				$("#testQ").attr('hidden',false);
				$('#switch').prop('checked', true).change()
			}else if(getCookie('switchCheck') === 'false'){
				$("#testQ").attr('hidden',true);
				$('#switch').prop('checked', false).change()
			}
			$('#switch').change(function() {
				setCookie('switchCheck',$(this)[0].checked, 30);
			})
			if(getCookie('identity') == "teacher"){
				$("#add").attr('hidden',false);
				$("#delete").attr('hidden',false);
				$("#edit").attr('hidden',false);
				$("#add2").attr('hidden',false);
				$("#delete2").attr('hidden',false);
				$("#edit2").attr('hidden',false);
				$("#add3").attr('hidden',false);
				$("#delete3").attr('hidden',false);
				$("#edit3").attr('hidden',false);
				$("#testQ").attr('hidden',false);
			}
		  })
		$("#user").text(getCookie('user'));
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
		function setCookie(cname, cvalue, exdays) {
			var d = new Date();
			d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
			var expires = "expires=" + d.toUTCString();
			document.cookie = cname + "=" + cvalue + ";path=" + location.host + "; " + expires;
		}
		$("#add").click(function(){
			window.open('addClassVideo.jsp', 'addClassVideo', 'height=200,width=400');
		});
		$("#add2").click(function(){
			window.open('addPracticeQ.jsp', 'addPracticeQ', 'height=200,width=400');
		});
		$("#add3").click(function(){
			window.open('addTestQ.jsp', 'addTestQ', 'height=200,width=400');
		});
		function classVideo(){
			$("#main1").attr('hidden',false);
			$("#main2").attr('hidden',true);
			$("#main3").attr('hidden',true);		
		}

		function practiceQ(){
			$("#main1").attr('hidden',true);
			$("#main2").attr('hidden',false);
			$("#main3").attr('hidden',true);	
		}
		function testQ(){
			$("#main1").attr('hidden',true);
			$("#main2").attr('hidden',true);
			$("#main3").attr('hidden',false);		
		}

	</script>
</html>