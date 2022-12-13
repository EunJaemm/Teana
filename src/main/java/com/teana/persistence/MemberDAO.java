package com.teana.persistence;

import com.teana.domain.member.MemberVO;

public interface MemberDAO {
	
	public MemberVO getMember(String member_id) throws Exception;
	
	public MemberVO getMembername(String name) throws Exception;
	
	public int updateMember(MemberVO vo) throws Exception;
	
	public int deleteMember(String id) throws Exception;

}
