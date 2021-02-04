package com.example.albamen.service.company.Impl;

import com.example.albamen.dto.company.ScheduleDTO;
import com.example.albamen.dto.company.TimeDTO;
import com.example.albamen.mapper.company.ScheduleMapper;
import com.example.albamen.service.company.ScheduleService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("scheduleService")
@Log4j2
public class ScheduleServiceImpl implements ScheduleService {

    private ScheduleMapper scheduleMapper;

    @Autowired
    public void setScheduleMapper(ScheduleMapper scheduleMapper) {
        this.scheduleMapper = scheduleMapper;
    }

    @Override
    public void insertSchedule(ScheduleDTO scheduleDTO) {
        if (scheduleDTO.getTno() > 0){
            log.info("-------------------------------------------O");
            scheduleMapper.insertSchedule(scheduleDTO);
        }else{
            log.info("-------------------------------------------X");
            scheduleMapper.insertScheduleNULL(scheduleDTO);
        }
    }

    @Override
    public ScheduleDTO selectTSchedule(int mno) {
        return scheduleMapper.selectTSchedule(mno);
    }

    @Override
    public List<ScheduleDTO> selectScheduleListDay(int bno, String sday) {
        return scheduleMapper.selectScheduleListDay(bno, sday);
    }

    @Override
    public List<ScheduleDTO> selectScheduleListMonth(int bno, String month) {
        return scheduleMapper.selectScheduleListMonth(bno, month);
    }

    @Override
    public boolean deleteSchdule(int sno) {
        return scheduleMapper.deleteSchdule(sno);
    }

    @Override
    public TimeDTO selectTime(int tno) {
        return scheduleMapper.selectTime(tno);
    }

    @Override
    public void insertTime(TimeDTO timeDTO) {
        scheduleMapper.insertTime(timeDTO);
    }

    @Override
    public boolean updateTime(TimeDTO timeDTO) {
        return scheduleMapper.updateTime(timeDTO);
    }

    @Override
    public boolean deleteTime(int tno) {
        return scheduleMapper.deleteTime(tno);
    }

    @Override
    public List<TimeDTO> selectTimeList(int bno) {
        return scheduleMapper.selectTimeList(bno);
    }

}
