package com.example.albamen.dto.member;

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
    private List<Work_MDTO> work_mList;
//    private List<CompanyDTO> companyList;


}
