<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	h1{
		line-height:50px;
	}
	#memFrm li{
		float:left;
		/*text-align:center;*/
		height:40px;
		line-height:40px;
		width:20%;
		border-bottom:1px solid black;
	}
	#memFrm li:nth-child(2n){
		width:63%;
	}
	#memFrm li:last-of-type{
		text-align:center;
		width:100%;
		border-bottom:none;
	}
</style>
<script>
	$(function(){
		$("#memFrm").submit(function(){
			if($("#userpw").val()==''){
				alert('비밀번호 입력 후 수정하세요.');
				return false;
			}
			if($("#username").val()==''){
				alert("이름을 입력하세요.");
				return false;
			}
			var reg1 = /^[0-9]{3,4}$/;
			var reg2 = /^[0-9]{4}$/;
			if(!reg1.test($("#tel2").val()) || !reg2.test($("#tel3").val())){
				alert("전화번호를 잘 못 입력하였습니다.");
				return false;
			}
			alert("회원정보를 수정하였습니다.");
		});
	});
</script>
<div class="container">
	<h1>회원수정</h1>
	<form method="post" action="/myapp/member/memberEditOk" id="memFrm">
		<ul>
			<li>아이디</li>
			<li>${vo.userid }</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpw" id="userpw" placeholder="비밀번호입력"/></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username" value="${vo.username }"/></li>
			<li>연락처</li>
			<li>
				<select name="tel1">
					<option value="010" <c:if test="${vo.tel1=='010' }">selected</c:if>>010</option>
					<option value="011" <c:if test="${vo.tel1=='011' }">selected</c:if>>011</option>
					<option value="02" <c:if test="${vo.tel1=='02' }">selected</c:if>>02</option>
					<option value="031" <c:if test="${vo.tel1=='031' }">selected</c:if>>031</option>
					<option value="032" <c:if test="${vo.tel1=='032' }">selected</c:if>>032</option>
					<option value="033" <c:if test="${vo.tel1=='033' }">selected</c:if>>033</option>
					<option value="041" <c:if test="${vo.tel1=='041' }">selected</c:if>>041</option>
					<option value="042" <c:if test="${vo.tel1=='042' }">selected</c:if>>042</option>
					<!-- <option value="043">043</option>
					<option value="044">044</option>
					<option value="051">051</select>
					<option value="052">052</option>
					<option value="053">053</option>
					<option value="054">054</option>
					<option value="055">055</option>
					<option value="061">061</option>
					<option value="062">062</option>
					<option value="063">063</option>
					<option value="064">064</option> -->
				</select> - 
				<input type="text" name="tel2" id="tel2" maxlength="4" value="${vo.tel2 }"/> - 
				<input type="text" name="tel3" id="tel3" maxlength="4" value="${vo.tel3 }"/>
			</li>
			<li>이메일</li>
			<li>
				<input type="text" name="email1" id="email1" value="${vo.email1 }"/> @
				<select name="domain">
					<option value="naver.com" <c:if test="${vo.domain=='naver.com' }">selected</c:if>>naver.com</option>
					<option value="daum.net" <c:if test="${vo.domain=='daum.net' }">selected</c:if>>daum.net</option>
					<option value="nate.com" <c:if test="${vo.domain=='nate.com' }">selected</c:if>>nate.com</option>
					<option value="gmail.com" <c:if test="${vo.domain=='gamil.com' }">selected</c:if>>gmail.com</option>
					<option value="hanmail.net" <c:if test="${vo.domain=='hanmail.net' }">selected</c:if>>hanmail.net</option>
					<option value="hanmir.com" <c:if test="${vo.domain=='hanmir.com' }">selected</c:if>>hanmir.com</option>
					<option value="kakao.com" <c:if test="${vo.domain=='kakao.com' }">selected</c:if>>kakao.com</option>
					<option value="korea.kr" <c:if test="${vo.domain=='korea.kr' }">selected</c:if>>korea.kr</option>
					<option value="paran.com" <c:if test="${vo.domain=='paran.com' }">selected</c:if>>paran.com</option>
					<option value="tistory.com" <c:if test="${vo.domain=='tistory.com' }">selected</c:if>>tistory.com</option>
				</select>
			</li>
			<li><input type="submit" value="회원정보수정"/></li>
		</ul>
	</form>
</div>