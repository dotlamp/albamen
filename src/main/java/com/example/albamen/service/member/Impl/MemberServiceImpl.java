package com.example.albamen.service.member.Impl;

import com.example.albamen.dto.member.MemberDTO;
import com.example.albamen.mapper.member.MemberMapper;
import com.example.albamen.service.member.MemberService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("memberService")
@Log4j2
public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberMapper memberMapper;

    @Override
    public void insertMember(MemberDTO dto){
        System.out.println("memberServiceImpl=====================================");
        memberMapper.insertMember(dto);

    }
    @Override
    public List<MemberDTO> listMember(){
        System.out.println("memberServiceimpl===========================");
       return memberMapper.listMember();
    }
//    @Override
//    public MemberDTO selectMember(String id){
//        return memberMapper.selectMember(id);
//    }

    @Override
    public MemberDTO loginMember(MemberDTO dto) {
        return memberMapper.loginMember(dto);
    }

    @Override
    public int idCheck(MemberDTO dto) {
        int result = memberMapper.idCheck(dto);
        return result;
    }

    @Override
    public void updateMember(MemberDTO dto) {
        memberMapper.updateMember(dto);
    }
//    @Override
//    public List<Work_MDTO> ListWork_M(String id){
//        return memberMapper.ListWork_M(id);
//    }
}
