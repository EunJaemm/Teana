package com.teana.service;

import com.teana.domain.member.MemberVO;

public interface MemberService {
	
	public MemberVO getMember(String member_id) throws Exception;

}
