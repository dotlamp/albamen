package com.example.albamen.service.company;

import com.example.albamen.dto.company.ScheduleDTO;
import com.example.albamen.dto.company.TimeDTO;

import java.util.List;

public interface ScheduleService {
    void insertSchedule(ScheduleDTO scheduleDTO); //근무 일정 입력
    List<ScheduleDTO> selectScheduleList(int bno, String sDay); //근무 일정 조회 (회사, 날짜)
    ScheduleDTO selectTSchedule(int mno); //근무일정 조회(멤버, 오늘 날짜)

    TimeDTO selectTime(int tno); //근무 시간 조회
    void insertTime(TimeDTO timeDTO); //근무 시간 입력
    boolean updateTime(TimeDTO timeDTO); //근무 시간 변경
    boolean deleteTime(int tno); //근무 시간 삭제
    List<TimeDTO> selectTimeList(int bno); //근무 시간 전체 조회

}
