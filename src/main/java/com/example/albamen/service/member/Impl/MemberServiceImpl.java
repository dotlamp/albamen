package com.example.albamen.service.member.Impl;

import com.example.albamen.dto.member.MemberDTO;
import com.example.albamen.mapper.member.MemberMapper;
import com.example.albamen.service.member.MemberService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("memberService")
@Log4j2
public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberMapper memberMapper;

    @Override
    public void insertMember(MemberDTO dto){
        String rowPs = dto.getPassword();
        String encPs = new BCryptPasswordEncoder().encode(rowPs);
        dto.setPassword(encPs);
        memberMapper.insertMember(dto);
        MemberDTO dto2 = memberMapper.getMember(dto.getId());
        memberMapper.insertAuth(dto2.getMno(), "ROLE_EMPLOYEE");
    }
    @Override
    public List<MemberDTO> listMember(){
        System.out.println("memberServiceimpl===========================");
       return memberMapper.listMember();
    }
    @Override
    public MemberDTO selectMember(String id){
        return memberMapper.selectMember(id);
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

    @Override
    public MemberDTO workList(String id) {
        return memberMapper.workList(id);
    }

    @Override
    public void insertWork(MemberDTO dto) {
        memberMapper.insertWork(dto);
    }

    @Override
    public void updateWork(MemberDTO dto) {
        memberMapper.updateWork(dto);
    }

    @Override
    public List<MemberDTO> selectBranchOfMember(int bno) {
        return memberMapper.selectBranchOfMember(bno);
    }
}
