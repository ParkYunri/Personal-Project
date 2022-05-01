function memberCheck(){
	let userid = document.getElementById("userid");
	if(userid.value==''){
		alert("아이디를 입력하세요.");
		userid.focus();
		return false;
	}
	
	if(document.getElementById("idChk").value=='N'){
		alert("아이디 중복 검사를 하세요.");
		userid.focus();
		return false;
	}
	
	let userpw = document.getElementById("userpw");
	let userpw2 = document.getElementById("userpw2");
	if(userpw.value=='' || userpw2.value==''){
		alert("비밀번호를 입력하세요.");
		userpw.focus();
		return false;
	}
	if(userpw.value!=userpw2.value){
		alert("비밀번호가 일치하지 않습니다.");
		userpw2.focus();
		return false;
	}
	
	let username = document.getElementById("username");
	if(username.value==''){
		alert("이름을 입력하세요.");
		username.focus();
		return false;
	}
	
	let tel2 = document.querySelector("#tel2");
	let tel3 = document.getElementById("tel3");
	
	let regExp1 = /^[0-9]{3,4}$/;
	let regExp2 = /^[0-9]{4}$/;
	if(!regExp1.test(tel2.value) || !regExp2.test(tel3.value)){
		alert("전화번호를 잘못 입력하셨습니다.");
		tel2.focus();
		return false;
	}
}