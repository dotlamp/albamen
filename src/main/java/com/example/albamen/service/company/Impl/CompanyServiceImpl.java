package com.example.albamen.service.company.Impl;

import com.example.albamen.dto.company.BranchDTO;
import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.dto.page.Criteria;
import com.example.albamen.dto.security.AuthDTO;
import com.example.albamen.mapper.company.CompanyMapper;
import com.example.albamen.service.company.CompanyService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("companyService")
@Log4j2
public class CompanyServiceImpl implements CompanyService {

	private CompanyMapper companyMapper;

    @Autowired
    public void setCompanyMapper(CompanyMapper companyMapper) {
        this.companyMapper = companyMapper;
    }


    @Override
    public void insertCompany(CompanyDTO companyDTO) {
        String rowPs = companyDTO.getPassword();
        String encPs = new BCryptPasswordEncoder().encode(rowPs);
        companyDTO.setPassword(encPs);
        companyMapper.insertCompany(companyDTO);
        CompanyDTO company = companyMapper.getCompany(companyDTO.getId());
        companyMapper.insertAuth(company.getCno(), "ROLE_MANAGER");
    }

    @Override
    public CompanyDTO selectCompany(int cno) {
        return companyMapper.selectCompany(cno);
    }

    @Override
    public List<CompanyDTO> selectCompanyList(Criteria criteria) {
        return companyMapper.selectCompanyList(criteria);
    }

    @Override
    public boolean updateCompany(CompanyDTO companyDTO) {
        return companyMapper.updateCompany(companyDTO);
    }

    @Override
    public boolean deleteCompany(int cno) {
        return companyMapper.deleteCompany(cno);
    }

    @Override
    public int idCheck(String id) {
	    if(companyMapper.idCheck(id) > 0){
	        return 1;
        }else{
            return 0;
        }
    }

    @Override
    public List<CompanyDTO> searchCompany(String name) {
        return companyMapper.searchCompany(name);
    }

    @Override
    public void insertBranch(BranchDTO branchDTO) {
        companyMapper.insertBranch(branchDTO);
    }

    @Override
    public BranchDTO selectBranch(int bno) {
        return companyMapper.selectBranch(bno);
    }

    @Override
    public List<BranchDTO> selectCompanyOfBranchList(int cno) {
        return companyMapper.selectCompanyOfBranchList(cno);
    }

    @Override
    public List<BranchDTO> selectBranchList(Criteria criteria) {
        return companyMapper.selectBranchList(criteria);
    }

    @Override
    public boolean updateBranch(BranchDTO branchDTO) {
        return companyMapper.updateBranch(branchDTO);
    }

    @Override
    public List<CompanyDTO> searchBranch(String name) {
        return companyMapper.searchBranch(name);
    }

    @Override
    public boolean deleteBranch(int bno) {
        return companyMapper.deleteBranch(bno);
    }

    @Override
    public CompanyDTO getCompany(String id) {
        return companyMapper.getCompany(id);
    }

    @Override
    public void insertAuth(int cno, String auth) {
        companyMapper.insertAuth(cno, auth);
    }

    @Override
    public boolean deleteAuth(int cno, String auth) {
        return companyMapper.deleteAuth(cno, auth);
    }

    @Override
    public AuthDTO selectAuth() {
        return companyMapper.selectAuth();
    }

    @Override
    public List<AuthDTO> selectAuthList(Criteria criteria) {
        return companyMapper.selectAuthList(criteria);
    }

    @Override
    public int getTotalCount(Criteria cri) {
        return companyMapper.getTotalCount(cri);
    }
}
