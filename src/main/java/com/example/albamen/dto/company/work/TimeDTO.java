package com.example.albamen.dto.company.work;

import lombok.Data;


@Data
public class TimeDTO {
    private int tno;
    private String tname;
    private int bno;
    private String startTime;
    private String endTime;
    private String breakStartTime;
    private String breakEndTime;
}
