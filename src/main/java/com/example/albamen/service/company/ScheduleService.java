package com.example.albamen.service.company;

import com.example.albamen.dto.company.ScheduleDTO;
import com.example.albamen.dto.company.TimeDTO;

import java.util.List;

public interface ScheduleService {
    void insertSchedule(ScheduleDTO scheduleDTO); //근무 일정 입력
    List<ScheduleDTO> selectScheduleListDay(int bno, String sday); //근무 일정 조회 (일별)
    List<ScheduleDTO> selectScheduleListMonth(int bno, String month); //근무 일정 조회 (월별)
    ScheduleDTO selectTSchedule(int mno); //근무 일정 조회(멤버, 오늘 날짜)
    boolean deleteSchdule(int sno); //근무 일정 삭제

    TimeDTO selectTime(int tno); //근무 시간 조회
    void insertTime(TimeDTO timeDTO); //근무 시간 입력
    boolean updateTime(TimeDTO timeDTO); //근무 시간 변경
    boolean deleteTime(int tno); //근무 시간 삭제
    List<TimeDTO> selectTimeList(int bno); //근무 시간 전체 조회

}
