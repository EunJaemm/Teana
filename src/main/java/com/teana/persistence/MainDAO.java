package com.teana.persistence;

import com.teana.domain.member.MemberVO;

public interface MainDAO {
	public void joinMember(MemberVO vo) throws Exception;

	public MemberVO loginMember(MemberVO vo) throws Exception;
	

}
