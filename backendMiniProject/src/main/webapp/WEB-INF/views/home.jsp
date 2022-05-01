<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="url" value="<%=request.getContextPath()%>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DVIEW</title>
<link rel="stylesheet" href="${url}/css/style.css" type="text/css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="${url}/css/jquery.bxslider.css" rel="stylesheet" />
<script src="${url}/js/jquery.bxslider.js"></script>
<script>
	$(document).ready(function(){
		$(".bxslider").bxSlider({
			auto:true,
			speed:500,
			pause:4000,
			pager:true,
			mode:'horizontal',
			captions:true
		});	
	});
</script>
</head>
<body>
<div>
	<ul class="bxslider">
		<li><a href="#"><img src="${url}/img/스물다섯스물하나(폼).JPG" title="최신작"/></a></li>
		<li><a href="#"><img src="${url}/img/트레이서(폼).JPG" title="인기작"/></a></li>
		<li><a href="#"><img src="${url}/img/우리들의블루스(폼).JPG" title="방영예정작"/></a></li>
		<li><a href="#"><img src="${url}/img/크레이지러브(폼).JPG" title="방송중"/></a></li>
	</ul>
</div>
</body>
</html>
