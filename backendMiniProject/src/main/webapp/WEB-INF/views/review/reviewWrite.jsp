<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.17.2/full/ckeditor.js"></script>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<style>
	#subject{
		width:99%;
	}
	#reviewFrm li{
		padding:10px 5px;
	}
</style>
<script>
	$(function(){
		CKEDITOR.replace("content",{
			filebrowserUploadUrl:'${url}/upload/'
		});
		$("#reviewFrm").submit(function(){
			if($("#subject").val()==''){
				alert("제목을 입력하세요.");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==''){
				alert("글 내용을 입력하세요.");
				return false;
			}
			
		});
	});
</script>
<div class="container">
	<h1>리뷰 작성</h1>
	<form method="post" action="${url }/review/reviewWriteOk" id="reviewFrm" enctype="multipart/form-data">
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject" placeholder="[드라마제목]을 꼭 써주세요."/></li>
			<li>리뷰</li>
			<li><textarea name="content" id="content"></textarea></li>
			<hr/>
			<li>첨부파일</li>
			<li>
				<input type="file" name="filename" id="filename1"/>
				<input type="file" name="filename" id="filename2"/>
			</li>
			<li><input type="submit" value="리뷰 등록"/></li>
		</ul>
	</form>
</div>