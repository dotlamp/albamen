package com.example.albamen.service.company;

import com.example.albamen.dto.company.BranchDTO;
import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.dto.page.Criteria;
import com.example.albamen.dto.security.AuthDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CompanyService{

    void insertCompany(CompanyDTO companyDTO); //회사 등록
    CompanyDTO selectCompany(int cno); //회사 조회
    List<CompanyDTO> selectCompanyList(Criteria criteria); //회사 전체 조회
    boolean updateCompany(CompanyDTO companyDTO); // 회사 수정
    boolean deleteCompany(int cno); //회사 삭제
    int idCheck(String id); //ID중복체크(0:중복X 1:중복O)
    List<CompanyDTO> searchCompany(String name); //회사 검색

    void insertBranch(BranchDTO branchDTO); //지점 등록
    BranchDTO selectBranch(int bno); //특정 지점 조회
    List<BranchDTO> selectCompanyOfBranchList(int cno); // 회사의 지점 조회
    List<BranchDTO> selectBranchList(Criteria criteria); //지점 전체 조회
    boolean updateBranch(BranchDTO branchDTO); //지점 수정
    List<CompanyDTO> searchBranch(String name); //지점 검색
    boolean deleteBranch(int bno); //지점 삭제

    CompanyDTO getCompany(String id); //login info
    void insertAuth(@Param("cno") int cno, @Param("auth") String auth); //권한 등록
    boolean deleteAuth(@Param("cno") int cno, @Param("auth") String auth); //권한 삭제
    AuthDTO selectAuth(); //권한 조회
    List<AuthDTO> selectAuthList(Criteria criteria); //권한 전체 조회

    int getTotalCount(Criteria cri);

    BranchDTO getBranch(int cno);
}
