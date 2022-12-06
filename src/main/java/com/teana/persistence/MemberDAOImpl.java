package com.teana.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.teana.domain.member.MemberVO;


public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession session;
	private final static String NAMESPACE = "com.bora.mapper.MemberMapper";

	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Override
	public MemberVO getMember(String id) throws Exception {
		return session.selectOne(NAMESPACE+".getMember", id);
	}

}
