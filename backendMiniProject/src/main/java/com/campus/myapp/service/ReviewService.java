package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ReviewVO;

public interface ReviewService {
	public int reviewInsert(ReviewVO vo);
	public List<ReviewVO> reviewList(PagingVO pVO);
	public ReviewVO reviewView(int no);
	public void hitCount(int no);
	public ReviewVO fileSelect(int no);
	public int reviewUpdate(ReviewVO vo);
	public int reviewDelete(int no, String userid);
	public int totalRecord(PagingVO pVO);
	public int reviewMultiDelete(ReviewVO vo);
}
