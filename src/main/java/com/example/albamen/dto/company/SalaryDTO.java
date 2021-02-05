package com.example.albamen.dto.company;

import lombok.Data;

@Data
public class SalaryDTO {
    private int bno;
    private int mno;
    private String wday;
    private String wTime;
    private int salary;
    private String payday;
    private int pstatus;
}
