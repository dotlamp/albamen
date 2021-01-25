package com.example.albamen.service;

import com.example.albamen.dto.company.BranchDTO;
import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.service.company.CompanyService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
@ContextConfiguration(classes = com.example.albamen.config.DatabaseConfig.class)
@Log4j2
public class CompanyServiceTests {

    private CompanyService companyService;

    @Autowired
    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    @Test
    public void insertCompany(){
        CompanyDTO companyDTO = new CompanyDTO();
        for(int i=101; i<200; i++){
            companyDTO.setId(String.valueOf(i));
            companyDTO.setPassword(String.valueOf(i));
            companyDTO.setName(String.valueOf(i));
            companyDTO.setCeo(String.valueOf(i));
            companyService.insertCompany(companyDTO);
        }
    }

    @Test
    public void insertBranch(){
        BranchDTO branchDTO = new BranchDTO();
        for(int i=0; i<3; i++){
            branchDTO.setCno(3);
            branchDTO.setBname("지점"+i);
            branchDTO.setBtel("0511234567"+i);
            branchDTO.setManager("관리자"+i);
            branchDTO.setMtel("0109999999"+i);
            branchDTO.setPost("5555"+i);
            branchDTO.setAddress("부산시 "+ i + "동");
            companyService.insertBranch(branchDTO);
        }
    }
}
