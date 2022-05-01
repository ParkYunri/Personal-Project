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
<script src="/myapp/js/member.js"></script>
<script>
	$(function(){
		$("#userid").keyup(function(){
			var userid = $("#userid").val();
			if(userid != '' && userid.length>=8){
				var url = "/myapp/member/memberIdCheck";
				$.ajax({
					url:url,
					data:"userid="+userid,
					type:"POST",
					success:function(result){
						if(result>0){
							$("#chk").html("사용불가능합니다.");
							$("#idChk").val('N');
							$("#chk").css("color", "red");
						}else{
							$("#chk").html("사용가능합니다.");
							$("#idChk").val('Y');
							$("#chk").css("color", "blue");
						}
					}
				});
			} else{
				$("#chk").html("사용불가능합니다.");
				$("#idChk").val('N');
				$("#chk").css("color", "red");
			}
		});
	});
</script>
<div class="container">
	<h1>회원가입</h1>
	<form method="post" action="/myapp/member/memberOk" id="memFrm" onsubmit="return memberCheck()">
		<ul>
			<li>아이디</li>
			<li>
				<input type="text" name="userid" id="userid" placeholder="아이디입력"/>
				<input type="button" value="아이디중복확인"/>
				<span id="chk"></span>
				<input type="hidden" id="idChk" value="N"/>
			</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpw" id="userpw" placeholder="비밀번호입력"/></li>
			<li>비밀번호확인</li>
			<li><input type="password" name="userpw2" id="userpw2" placeholder="비밀번호확인"/></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username"/></li>
			<li>연락처</li>
			<li>
				<select name="tel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="033">033</option>
					<option value="041">041</option>
					<option value="042">042</option>
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
				<input type="text" name="tel2" id="tel2" maxlength="4"/> - 
				<input type="text" name="tel3" id="tel3" maxlength="4"/>
			</li>
			<li>이메일</li>
			<li>
				<input type="text" name="email1" id="email1"/> @
				<select name="domain">
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="hanmir.com">hanmir.com</option>
					<option value="kakao.com">kakao.com</option>
					<option value="korea.kr">korea.kr</option>
					<option value="paran.com">paran.com</option>
					<option value="tistory.com">tistory.com</option>
				</select>
			</li>
			<li><input type="submit" value="회원가입"/></li>
		</ul>
	</form>
</div>