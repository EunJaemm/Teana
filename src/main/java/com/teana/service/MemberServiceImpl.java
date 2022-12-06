package com.teana.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.teana.domain.member.MemberVO;
import com.teana.persistence.MemberDAO;


public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO dao;

	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	

	@Override
	public MemberVO getMember(String member_id) throws Exception {
		log.info("getMember(member_id) 호출");
		return dao.getMember(member_id);
	}


}
