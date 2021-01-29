package com.example.albamen.mapper.member;

import com.example.albamen.dto.member.MemberDTO;
import com.example.albamen.dto.page.Criteria;
import com.example.albamen.dto.security.AuthDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
    MemberDTO selectMember(String id);
    //출퇴근 기록
    //List<Work_MDTO> ListWork_M(String id);



    MemberDTO getMember(String id); //로그인
    void insertAuth(@Param("mno") int mno, @Param("auth") String auth); //권한 등록
    boolean deleteAuth(@Param("mno") int mno, @Param("auth") String auth); //권한 삭제
    AuthDTO selectAuth(); //권한 조회
    List<AuthDTO> selectAuthList(Criteria cri); //권한 전체 조회

    List<MemberDTO> selectBranchOfMember(int bno);


    MemberDTO workList(String id);
    void insertWork(MemberDTO dto);
    void updateWork(MemberDTO dto);
}
