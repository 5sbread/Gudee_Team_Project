package com.goodee.market.member;

public interface MemberInterface {
	
	//로그인
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception;
	
	//회원가입
	public int setJoin(MemberDTO memberDTO)throws Exception;
	
	//프로필 이미지 추가
	public int setAddFile(MemberFileDTO memberFileDTO)throws Exception;

}
