package com.campus.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.MemberDAO;
import com.campus.myapp.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	MemberDAO dao;
	@Override
	public int memberInsert(MemberVO vo) {
		return dao.memberInsert(vo);
	}
	@Override
	public int idCheck(String userid) {
		return dao.idCheck(userid);
	}
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return dao.loginCheck(vo);
	}
	@Override
	public MemberVO memberEdit(String userid) {
		return dao.memberEdit(userid);
	}
	@Override
	public int memberUpdate(MemberVO vo) {
		return dao.memberUpdate(vo);
	}

}
