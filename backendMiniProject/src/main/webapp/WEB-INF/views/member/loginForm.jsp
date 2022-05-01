<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#log{
		width:150px;
		margin:70px auto;
	}
	#log>h1{
		text-align:center;
	}
	#log>ul>li{
		float:left;
		width:30%;
	}
	#logFrm>ul>li:nth-child(2n){
		width:70%;
	}
	#logFrm>ul>li:last-of-type{
		width:100%;
		text-align:center;
		margin-top:30px;
	}
</style>
<script>
	function logFormCheck(){
		var id = document.getElementById("userid");
		if(id.value==''){
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}
		if(document.getElementById("userpw").value==''){
			alert("비밀번호를 입력하세요.");
			document.getElementById("userpw").focus();
			return false;
		}
		return true;
	}
</script>
<div class="container">
	<div id="log">
		<h1>로그인</h1>
		<form method="post" action="/myapp/member/loginOk" id="logFrm" onsubmit="return logFormCheck()">
			<ul>
				<li>아이디</li>
				<li><input type="text" name="userid" id="userid"/></li>
				<li>비밀번호</li>
				<li><input type="password" name="userpw" id="userpw"/></li>
				<li>
					<input type="submit" value="로그인"/>
					<input type="reset" value="취  소"/>
				</li>
			</ul>
		</form>
	</div>
</div>