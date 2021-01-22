package com.example.albamen.service.security;

import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.dto.security.SecurityAlbamen;
import com.example.albamen.mapper.company.CompanyMapper;
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
//    private MemberMapper memberMapper;

    @Autowired
    public void setCompanyMapper(CompanyMapper companyMapper) {
        this.companyMapper = companyMapper;
    }

//    @Autowired
//    public void setMemberMapper(MemberMapper memberMapper) {
//        this.memberMapper = memberMapper;
//    }

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        CompanyDTO company = companyMapper.getCompany(id);
        try {
            if(company != null){
                return company == null ? null : new SecurityAlbamen(company);
            }
    //        else if(member != null){
    //            return member == null ? null : new SecurityAlbamen(member);
    //        }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
