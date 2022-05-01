<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<style>
	body, ul, li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	.container{
		width:500px;
		margin:0 auto;
		overflow:auto;
	}
	#login{
		width:400px;
		margin:0 auto;
	}
	#login>h1{
		text-align:center;
	}
	#logFrm>ul>li{
		float:left;
		width:35%;

	}
	#logFrm>ul>li:nth-child(2n){
		width:60%;
		height:30px;
	}
	#logFrm>ul>li:nth-child(5), #logFrm>ul>li:nth-child(6){
		width:100%;
		text-align:center;
		margin-top:15px;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"/>
<script>
	$(function(){
		$("#logFrm").submit(function(){
			let data = $(this).serialize();
			
			$.ajax({
				url:'/myapp/login/loginOk',
				data:data,
				type:"POST",
				success:function(r){
					if(r.isSuccess){
						alert("login ok");
					}
					else
						alert("login fail");
				}
			});
			return false;
		});
	});
</script>
</head>
<body>
<div class="container">
	<div id="login">
		<h1>로그인</h1>
		<hr/>
		<form method="post" action="/myapp/login/loginOk" id="logFrm">
		<ul>
			<li>아이디</li>
			<li><input type="text" name="userid" id="userid"/></li>
			<li>비밀번호</li>
			<li><input type="password" name="userpw"/></li>
			<li>
				<input type="submit" value="로그인"/>
				<input type="reset" value="취  소"/>
			</li>
		</ul>
	</div>
</div>

</body>
</html>
