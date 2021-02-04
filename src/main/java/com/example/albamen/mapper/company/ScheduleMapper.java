package com.example.albamen.mapper.company;

import com.example.albamen.dto.company.ScheduleDTO;
import com.example.albamen.dto.company.TimeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.sql.Time;
import java.util.List;

@Mapper
public interface ScheduleMapper {
    /* schdule */
    void insertSchedule(ScheduleDTO scheduleDTO); //근무 일정 입력
    void insertScheduleNULL(ScheduleDTO scheduleDTO); //근무 일정 입력
    List<ScheduleDTO> selectScheduleListDay(int bno, String sday); //근무 일정 조회(일별)
    List<ScheduleDTO> selectScheduleListMonth(int bno, String month); //근무 일정 조회(월별)
    boolean deleteSchdule(int sno); //근무 일정 삭제

    /* time */
    TimeDTO selectTime(int tno); //근무 시간 조회
    void insertTime(TimeDTO timeDTO); //근무 시간 입력
    boolean updateTime(TimeDTO timeDTO); //근무 시간 변경
    boolean deleteTime(int tno); //근무 시간 삭제
    List<TimeDTO> selectTimeList(int bno); //근무 시간 전체 조회

    ScheduleDTO selectTSchedule(int mno);//근무+스케줄정보 조회
}
