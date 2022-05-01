package com.campus.myapp.service;

import com.campus.myapp.vo.MemberVO;

public interface MemberService {
	public int memberInsert(MemberVO vo);
	public int idCheck(String userid);
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberEdit(String userid);
	public int memberUpdate(MemberVO vo);
}
