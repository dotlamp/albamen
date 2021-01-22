package com.example.albamen.mapper.member;

import com.example.albamen.dto.member.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    //회원가입
    void insertMember(MemberDTO dto);
    //회원리스트
    List<MemberDTO> listMember();
    //아이디체크
    int idCheck(MemberDTO dto);
    //회원수정
    void updateMember(MemberDTO dto);
    //회원조회
    //MemberDTO selectMember(String id);
    //로그인
    MemberDTO loginMember(MemberDTO dto);
    //출퇴근 기록
    //List<Work_MDTO> ListWork_M(String id);


}
