<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Home</title>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(function(){
			$("h1").click(function(){
				location.href='/myapp/ajaxLogin';
			});
		});
	</script>
</head>
<body>
<h1>
	로그인폼으로
</h1>
</body>
</html>
