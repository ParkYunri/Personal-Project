<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<style>
	#files a:link, #files a:visited, #files a:hover{
		color:black;
	}
	#files img{
		width:400px;
	}
	#btn a:link, #btn a:visited, #btn a:hover{
		color:black;
	}
</style>
<script>
	function delCheck(){
		if(confirm("리뷰를 삭제하시겠습니까?")){
			location.href="${url}/review/reviewDelete?no=${vo.no}";
		}
	}
</script>
<div class="container">
	<h1>리뷰보기</h1>
	<ul>
		<li style="font-size:1.5em;"><b>${vo.subject }</b></li>
		<li>
			작성일  <b>${vo.writedate }</b> &nbsp;&nbsp;
			아이디  <b>${vo.userid }</b> &nbsp;&nbsp;
		</li>
		<hr/>
		<li>리뷰내용</li>
		<li>
			${vo.content }
		</li>
		<li id="files">
			<c:if test="${vo.filename1!=null && vo.filename1!='' }">
				<img src="${url }/upload/${vo.filename1 }" title="${vo.filename1 }"/>
			</c:if>
			<c:if test="${vo.filename2!=null && vo.filename2!='' }">
				<img src="${url }/upload/${vo.filename2 }" title="${vo.filename2 }"/>
			</c:if>
			<hr/>
			첨부파일: 
			<c:if test="${vo.filename1!=null && vo.filename1!='' }">
				<a href="${url }/upload/${vo.filename1 }" download>${vo.filename1 }</a>
			</c:if>
			<c:if test="${vo.filename2!=null && vo.filename2!='' }">
				<a href="/myapp/upload/${vo.filename2}" download>${vo.filename2 }</a>
			</c:if>
		</li>
	</ul>
	<div id="btn">
		<c:if test="${logId==vo.userid }">
			<a href="${url }/review/reviewEdit?no=${vo.no }">수정</a>
			<a href="javascript:delCheck()">삭제</a>
		</c:if>
	</div>
</div>