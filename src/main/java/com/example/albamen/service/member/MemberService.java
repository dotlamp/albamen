package com.example.albamen.service.member;

import com.example.albamen.dto.member.MemberDTO;

import java.util.List;

public interface MemberService {
    //회원가입
    void insertMember(MemberDTO dto);
    //회원리스트
    List<MemberDTO> listMember();
    //아이디 체크
    int idCheck(MemberDTO dto);
    //회원수정
    void updateMember(MemberDTO dto);
    //회원조회
    //MemberDTO selectMember(String id);
    //로그인
    MemberDTO loginMember(MemberDTO dto);

}
