package com.example.albamen.service.security;

import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.dto.member.MemberDTO;
import com.example.albamen.dto.security.Albamen;
import com.example.albamen.mapper.company.CompanyMapper;
import com.example.albamen.mapper.member.MemberMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@Log4j2
public class CustomUserDetailsService implements UserDetailsService {

    private CompanyMapper companyMapper;
    private MemberMapper memberMapper;

    @Autowired
    public void setCompanyMapper(CompanyMapper companyMapper) {
        this.companyMapper = companyMapper;
    }

    @Autowired
    public void setMemberMapper(MemberMapper memberMapper) {
        this.memberMapper = memberMapper;
    }

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        try {
            CompanyDTO company = companyMapper.getCompany(id);
            if(company != null){
                return new Albamen(company);
            }
            MemberDTO member = memberMapper.getMember(id);
            if(member != null){
                return new Albamen(member);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
