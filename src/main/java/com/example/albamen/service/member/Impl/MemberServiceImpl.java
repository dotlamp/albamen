package com.example.albamen.service.member.Impl;

import com.example.albamen.dto.member.AccountDTO;
import com.example.albamen.dto.member.MemberDTO;
import com.example.albamen.dto.member.Work_MDTO;
import com.example.albamen.dto.page.Criteria;
import com.example.albamen.mapper.member.MemberMapper;
import com.example.albamen.service.member.MemberService;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
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
        String rowPs = dto.getPassword();
        String encPs = new BCryptPasswordEncoder().encode(rowPs);
        dto.setPassword(encPs);
        memberMapper.updateMember(dto);
    }

    @Override
    public MemberDTO workList(String id, int bno,int pageNum,int amount) {
        return memberMapper.workList(id,bno,pageNum,amount);
    }

    @Override
    public void insertWork(Work_MDTO dto) {
        memberMapper.insertWork(dto);
    }

    @Override
    public void updateWork(Work_MDTO dto) {
        memberMapper.updateWork(dto);
    }

    @Override
    public List<MemberDTO> selectBranchOfMember(int bno) {
        return memberMapper.selectBranchOfMember(bno);
    }

    @Override
    public void insertAccountInfo(AccountDTO accountDTO) {
        memberMapper.insertAccountInfo(accountDTO);
    }

    @Override
    public boolean deleteAccountInfo(int mno) {
        return memberMapper.deleteAccountInfo(mno);
    }

    @Override
    public AccountDTO selectAccountInfo(int mno) {
        return memberMapper.selectAccountInfo(mno);
    }

    @Override
    public int getTotalCount(Criteria cri, int bno, String id) {
        return memberMapper.getTotalCount(cri,bno,id);
    }

    @Override
    public void updateAccountInfo(String id, String bank, String account) {
        memberMapper.updateAccountInfo(id, bank, account);
    }
}
