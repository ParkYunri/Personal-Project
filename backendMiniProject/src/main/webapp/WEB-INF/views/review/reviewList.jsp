<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<style>
	.reviewList{
		overflow:auto;
	}
	.reviewList>li{
		float:left;
		height:50px;
		line-height:50px;
		border-bottom:1px solid #ddd;
		width:10%;
	}
	.reviewList>li:nth-child(7n+4){
		width:40%;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	#sub a:link, #sub a:visited, #sub a:hover{
		color:#EFEBE9;
	}
	#btns {
		margin-top:10px;
	}
	#btns a{
		float:right;
	}
	#btns a:link, #btns a:visited, #btns a:hover{
		color:black;
		font-size:1.2em;
	}
	.paging{
		margin:30px 0;
		padding:0 355px;
		height:30px;
		overflow:none;
	}
	.paging>li{
		/*text-align:center;*/
		float:left;
		padding-right:15px
		padding-left:15px;
	}
	.paging li a:link, .paging li a:visited, .paging li a:hover{
		text-decoration:none;
		color:white;
	}
	#searchFrm{
		padding:10px 200px;
		text-align:center;
	}
</style>
<script>
	$(function(){
		$("#allChk").click(function(){
			$(".chk").prop("checked", $("#allChk").prop("checked"));
		});
		$("#multiDel").click(function(){
			var cnt = 0;
			$(".chk").each(function(i,obj){
				if(obj.checked){
					cnt++;
				}
			});
			if(cnt<=0){
				alert('선택된 글이 없습니다. 글을 선택 후 삭제하세요.');
				return false;
			}
			$("#listFrm").submit();
		});
		$("#searchFrm").submit(function(){
			if($("#searchWord").val()==''){
				alert("검색어를 입력하세요.");
				return false;
			}
		});
	})
</script>
<div class="container">
	<h1>리뷰 목록</h1>
	
	<form method="post" action="${url }/review/reviewMultiDelete" id="listFrm">
		<ul class="reviewList">
			<li><input type="checkbox" id="allChk"/></li>
			<li>번호</li>
			<li>아이디</li>
			<li>제목</li>
			<li>조회수</li>
			<li>첨부파일</li>
			<li>등록일</li>
			
			<c:forEach var="vo" items="${list }">
				<li><input type="checkbox" name="noList" value="${vo.no }" class="chk"/></li>
				<li>${vo.no }</li>
				<li>${vo.userid }</li>
				<li id="sub"><a href="${url}/review/reviewView?no=${vo.no}">${vo.subject }</a></li>
				<li>${vo.hit }</li>
				<li>
					<c:if test="${vo.filename1!=null && vo.filename1!='' }">
						<a href="${url }/upload/${vo.filename1}" download><img src="${url }/img/disk.png" title="${vo.filename1 }" /></a>
					</c:if>
					<c:if test="${vo.filename2!=null && vo.filename2!='' }">
						<a href="${url }/upload/${vo.filename2}" download><img src="${url }/img/disk.png" title="${vo.filename2 }" /></a>
					</c:if>
				</li>
				<li>${vo.writedate }</li>
			</c:forEach>
		</ul>
	</form>
	<div id="btns">
		<input type="button" value="선택삭제" id="multiDel"/>
		<a href="${url }/review/reviewWrite"><b>리뷰작성</b></a>	
	</div>
	<!-- 페이징 ----------------------------------------------->
	<ul class="paging">
		<!-- 이전페이지 -->
		<c:if test="${pVO.pageNum==1 }">
			<li><<</li>
		</c:if>
		<c:if test="${pVO.pageNum>1 }">
			<li><a href="/myapp/review/reviewList?pageNum=${pVO.pageNum-1 }<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>"><<</a>
		</c:if>
		<!-- 페이지번호 -->
		<c:forEach var="p" begin="${pVO.startPage }" end="${pVO.startPage+pVO.onePageCount-1 }">
			<c:if test="${p<=pVO.totalPage }">
				<c:if test="${p==pVO.pageNum }">
					<li style="background-color:#D7CCC8">
				</c:if>
				<c:if test="${p!=pVO.pageNum }">
					<li>
				</c:if>
				<a href="/myapp/review/reviewList?pageNum=${p }<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">${p }</a></li>
			</c:if>
		</c:forEach>
		<!-- 다음페이지 -->
		<c:if test="${pVO.pageNum==pVO.totalPage }">
			<li>>></li>
		</c:if>
		<c:if test="${pVO.pageNum<pVO.totalPage }">
			<li><a href="/myapp/review/reviewList?pageNum=${pVO.pageNum+1 }<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">>></a>
		</c:if>
	</ul>
	
	<div>
		<form method="get" action="${url }/review/reviewList" id="searchFrm">
			<select name="searchKey">
				<option value="subject">제목</option>
				<option value="content">글내용</option>
				<option value="userid">아이디</option>
			</select>
			<input type="text" name="searchWord" id="searchWord"/>
			<input type="submit" value="Search"/>
		</form>
	</div>
</div>