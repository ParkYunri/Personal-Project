package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.DramaDAO;
import com.campus.myapp.vo.DramaVO;

@Service
public class DramaServiceImpl implements DramaService {
	@Inject
	DramaDAO dao;

	@Override
	public List<DramaVO> dramaList() {
		return dao.dramaList();
	}
	
	
}
