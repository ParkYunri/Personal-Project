package com.campus.myapp.vo;

public class MemberVO {
	private String userid;
	private String userpw;
	private String username;
	
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	
	private String email;
	private String email1;
	private String domain;
	
	private String writedate;
	private int verify;
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTel() {
		tel = tel1+"-"+tel2+"-"+tel3;
		return tel;
	}

	public void setTel(String tel) {
		String telSp[] = tel.split("-");
		tel1 = telSp[0];
		tel2 = telSp[1];
		tel3 = telSp[2];
		this.tel = tel;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getEmail() {
		email = email1+"@"+domain;
		return email;
	}

	public void setEmail(String email) {
		String emailSp[] = email.split("@");
		email1 = emailSp[0];
		domain = emailSp[1];
		this.email = email;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getVerify() {
		return verify;
	}

	public void setVerify(int verify) {
		this.verify = verify;
	}
	
}
