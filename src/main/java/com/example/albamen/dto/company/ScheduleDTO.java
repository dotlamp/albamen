package com.example.albamen.dto.company;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ScheduleDTO {
    private int sno;
    private Date sDay;
    private int tno;
    private int mno;
    private int sStatus;
    private List<TimeDTO> timeList;

}
