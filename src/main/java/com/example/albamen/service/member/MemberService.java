package com.example.albamen.service.member;

import com.example.albamen.dto.member.AccountDTO;
import com.example.albamen.dto.member.MemberDTO;
import com.example.albamen.dto.member.Work_MDTO;

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
    MemberDTO selectMember(String id);

    //지점의 회원(직원) 리스트
    List<MemberDTO> selectBranchOfMember(int bno);

    MemberDTO workList(String id);
    void insertWork(Work_MDTO dto);
    void updateWork(Work_MDTO dto);

    void insertAccountInfo(AccountDTO accountDTO); //계좌 정보 입력
    boolean deleteAccountInfo(int mno); //계좌 정보 삭제
    AccountDTO selectAccountInfo(int mno); //계좌 정보 조회
}
