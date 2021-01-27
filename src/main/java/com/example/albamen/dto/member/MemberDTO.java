package com.example.albamen.dto.member;

import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.dto.security.AuthDTO;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class MemberDTO{

    private int mno;
    private String id;
    private String password;
    private String name;
    private String tel;
    private Date regDate;
    private int mstatus;
    private int cno;
    private int bno;
    private List<Work_MDTO> work_mList;
    private List<CompanyDTO> companyList;
    private List<AuthDTO> authList;

    public boolean hasAuth(String role) {
        for (AuthDTO auth : authList) {
            if (auth.isAuth(role)) {
                return true;
            }
        }
        return false;
    }
}
