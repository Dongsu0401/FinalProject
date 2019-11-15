package com.kh.FinalProject.booksales.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.FinalProject.booksales.model.vo.BookReg;


@Repository("bsDAO")
public class BsDAO {

	// 중고서적 리스트
	public ArrayList<BookReg> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bsMapper.selectList");
	}
	
	// 중고서적 디테일
	public BookReg selectBs(SqlSessionTemplate sqlSession, int brBnumber) {
		System.out.println(brBnumber);
		BookReg br = sqlSession.selectOne("bsMapper.selectBs", brBnumber);
		System.out.println(br);
		return br;
	}


	// 중고서적 조회수
	public int addReadCount(SqlSessionTemplate sqlSession, int brBnumber) {
		return sqlSession.update("bsMapper.addReadCount", brBnumber);
	}

	public int insertBs(SqlSessionTemplate sqlSession, BookReg br) {
		return sqlSession.insert("bsMapper.insertBs", br);
	}


}