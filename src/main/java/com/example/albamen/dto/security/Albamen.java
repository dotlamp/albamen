package com.example.albamen.dto.security;

import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.dto.member.MemberDTO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.stream.Collectors;

public class Albamen extends User {
    private static final long serialVersionUID = 1L;
    private CompanyDTO company;
    private MemberDTO member;

    public CompanyDTO getCompany() {
        return company;
    }

    public MemberDTO getMember() {
        return member;
    }

    public Albamen(String username, String password,
                   Collection<? extends GrantedAuthority> authorities){
        super(username, password, authorities);
    }

    public Albamen(CompanyDTO company){
        super(company.getId(), company.getPassword(), company.getAuthList()
                .stream().map(authDTO -> new SimpleGrantedAuthority(authDTO.getAuth())).collect(Collectors.toList()));
        this.company = company;
    }

    public Albamen(MemberDTO member){
        super(member.getId(), member.getPassword(), member.getAuthList()
                .stream().map(authDTO -> new SimpleGrantedAuthority(authDTO.getAuth())).collect(Collectors.toList()));
        this.member = member;
    }

}
