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
		CKEDITOR.replace("content");
		var fileCount = ${fileCount};
		$("#reviewFrm b").click(function(){
			$(this).parent().css("display","none");
			$(this).parent().next().attr("name","delFile");
			$(this).parent().next().next().attr("type","file");
			fileCount--;
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
	<h1>리뷰 수정</h1>
	<form method="post" action="${url }/review/reviewEditOk" id="reviewFrm" enctype="multipart/form-data">
		<input type="hidden" name="no" value="${vo.no }"/>
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject" value="${vo.subject }"/></li>
			<li>리뷰글</li>
			<li><textarea name="content" id="content">${vo.content }</textarea></li>
			<hr/>
			<li>첨부파일</li>
			<li>
				<!-- 첫번쨰 첨부파일 있을 때 -->
				<c:if test="${vo.filename1!=null && vo.filename1!='' }">
					<div>${vo.filename1 } &nbsp;&nbsp; <b>X</b></div>
					<input type="hidden" name="" value="${vo.filename1 }"/>
					<input type="hidden" name="filename" id="filename1"/>
				</c:if>
				<!--  첫번째 첨부파일 없을 때 -->
				<c:if test="${vo.filename1==null || vo.filename1=='' }">
					<input type="file" name="filename" id="filename1"/>
				</c:if>
				<!-- 두번재 첨부파일 있을 때 -->
				<c:if test="${vo.filename2!=null && vo.filename2!='' }">
					<div>${vo.filename2 } &nbsp;&nbsp; <b>X</b></div>
					<input type="hidden" name="" value="${vo.filename2 }"/>
					<input type="hidden" name="filename" id="filename2"/>
				</c:if>
				<!-- 두번째 첨부파일 없을 때 -->
				<c:if test="${vo.filename2==null || vo.filename2=='' }">
					<input type="file" name="filename" id="filename2"/>
				</c:if>
			</li>
			<li><input type="submit" value="리뷰 수정"/></li>
		</ul>
	</form>
</div>