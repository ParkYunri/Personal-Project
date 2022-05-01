<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<style>

	hr{
		border:1px solid black;
	}
	.dramaList li{
		float:left;
		width:25%;
		text-align:center;
	}
	.dramaList img{
		width:150px;
		height:150px;
	}
	.nameList li{
		float:left;
		width:25%;
		text-align:center;
		color:#E0F2F1;
	}
	#more{
		float:right;
	}
	#more a:link, #more a:visited, #more a:hover{
		color:black;
	}
</style>


<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
var mySwiper = new Swiper('.swiper-container', {
	  // Optional parameters
	  direction: 'horizontal',		// 가로 슬라이드
	  loop: true,
	  slidesPerView: 1.5,			// 한 영역에 보이는 슬라이드 수
	  spaceBetween: 16,
	  // Navigation arrows
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },
	})
/* new Swiper('.swiper-container', {

	slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 20, // 슬라이드간 간격
	slidesPerGroup : 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});*/
</script>
<div class="container">
	<h1><b>드라마</b></h1>
	<h2 style="color:#7986CB">최신작</h2>
	<div class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide" >
        	<a href="#"><img style="width:150px; height:250px;" src="${url }/img/스물다섯스물하나(폼).JPG"/></a>
        </div>
        <div class="swiper-slide" >
        	<a href="#"><img style="width:150px; height:250px;" src="${url }/img/우리들의블루스(폼).JPG"/></a>
        </div>
        <div class="swiper-slide" >
			<a href="#"><img style="width:150px; height:250px;" src="${url }/img/크레이지러브(폼).JPG"/></a>
        	<div class="sub-title">
        		<span>크레이지러브</span>
        	</div>
        </div>
         <div class="swiper-slide" >
 			<a href="#"><img style="width:150px; height:250px;" src="${url }/img/트레이서(폼).JPG"/></a>
        	<div class="sub-title">
        		<span>트레이서</span>
        	</div>
        </div>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
</div>
</div>
<div class="container">
	<form method="post" action="" id="listFrm">
		<div>
			<h2 style="color:#7986CB">최신작</h2>
			<hr/>
			<ul class="dramaList">
				<li><a href="#"><img src="${url }/img/스물다섯스물하나(폼).JPG"/></a></li>
				
				<li><a href="#"><img src="${url }/img/우리들의블루스(폼).JPG"/></a></li>
				
				<li><a href="#"><img src="${url }/img/크레이지러브(폼).JPG"/></a></li>
				
				<li><a href="#"><img src="${url }/img/트레이서(폼).JPG"/></a></li>
				
			</ul>
			<ul class="nameList">
				<li id="poster">스물다섯 스물하나</li>
				<li id="poster">우리들의 블루스</li>
				<li id="poster">크레이지러브</li>
				<li id="poster">트레이서</li>
			</ul>
			<hr/>
			<div id="more"><a href="#">더보기</a></div>
		</div>
	</form>
</div>