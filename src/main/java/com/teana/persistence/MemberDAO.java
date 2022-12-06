package com.teana.persistence;

import com.teana.domain.member.MemberVO;

public interface MemberDAO {
	
	public MemberVO getMember(String member_id) throws Exception;

}
