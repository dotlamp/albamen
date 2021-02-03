package com.example.albamen.dto.company;

import com.example.albamen.dto.member.MemberDTO;
import lombok.Data;

import java.util.List;

@Data
public class ScheduleDTO {
    private int sno;
    private String sday;
    private int tno;
    private int mno;
    private int sstatus;
    private List<TimeDTO> timeList;
    private List<MemberDTO> memberList;

}
