package com.example.albamen.dto.member;

import lombok.Data;

import java.util.Date;

@Data
public class Work_MDTO {

    private int wno;
    private Date wday;
    private int mno;
    private int bno;
    private Date startTime;
    private Date endTime;
    private String overTime;
    private int startstatus;
    private int endstatus;
}
