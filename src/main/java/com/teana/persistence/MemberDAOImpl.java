package com.teana.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.teana.domain.member.MemberVO;


public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession session;
	private final static String NAMESPACE = "com.teana.mapper.MemberMapper";

	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Override
	public MemberVO getMember(String member_id) throws Exception {
		return session.selectOne(NAMESPACE+".getMember", member_id);
		
	}
	
	@Override
	public MemberVO getMemberName(String member_name) throws Exception {
		
		return session.selectOne(NAMESPACE+".getMemberName", member_name);
	}
	
	@Override
	public int updateMember(MemberVO vo) throws Exception {
		
		return session.update(NAMESPACE+".updateMember", vo);
	}
	
	@Override
	public int deleteMember(String member_id) throws Exception {
		
		return session.delete(NAMESPACE+".deleteMember", member_id);
	}
	
}
