package com.example.albamen.service;

import com.example.albamen.dto.company.BranchDTO;
import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.dto.member.MemberDTO;
import com.example.albamen.service.company.CompanyService;
import com.example.albamen.service.member.MemberService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

import java.util.Random;

@SpringBootTest
@ContextConfiguration(classes = com.example.albamen.config.DatabaseConfig.class)
@Log4j2
public class Dummy {

    private CompanyService companyService;
    private MemberService memberService;
    Random r = new Random();

    @Autowired
    public void setMemberService(MemberService memberService) {
        this.memberService = memberService;
    }

    @Autowired
    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    @Test
    public void insertCompany(){
        CompanyDTO companyDTO = new CompanyDTO();
        for(int i=1; i<200; i++){
            companyDTO.setId("c"+String.valueOf(i));
            companyDTO.setPassword("c"+String.valueOf(i));
            companyDTO.setName("회사"+String.valueOf(i));
            companyDTO.setCeo("대표" + String.valueOf(i));
            companyService.insertCompany(companyDTO);
        }
    }

    @Test
    public void insertBranch(){
        BranchDTO branchDTO = new BranchDTO();
        for(int i=1; i<200; i++){
            int random = r.nextInt(1000)+1;
            for(int z=1; z<2; z++){
                branchDTO.setCno(i);
                branchDTO.setBname("지점"+random);
                branchDTO.setBtel("지점전화번호"+z);
                branchDTO.setPost("우편번호"+i);
                branchDTO.setAddress("주소"+i);
                companyService.insertBranch(branchDTO);
            }
        }
    }

    @Test void insertMember(){
        MemberDTO memberDTO = new MemberDTO();
        for(int i=1; i<100; i++){
            memberDTO.setId(String.valueOf(i));
            memberDTO.setPassword(String.valueOf(i));
            memberDTO.setName("이름"+String.valueOf(i));
            memberDTO.setTel("전화번호"+String.valueOf(i));
            memberDTO.setCno(i);
            memberDTO.setBno(i);
            memberService.insertMember(memberDTO);
        }
    }
}
