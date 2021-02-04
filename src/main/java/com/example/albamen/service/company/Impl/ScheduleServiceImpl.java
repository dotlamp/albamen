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

    @Override
    public void insertSchedule(ScheduleDTO scheduleDTO) {
        scheduleMapper.insertSchedule(scheduleDTO);
    }

    @Autowired
    public void setScheduleMapper(ScheduleMapper scheduleMapper) {
        this.scheduleMapper = scheduleMapper;
    }

    @Override
    public ScheduleDTO selectTSchedule(int mno) {
        return scheduleMapper.selectTSchedule(mno);
    }

    @Override
    public List<ScheduleDTO> selectScheduleList(int bno, String sday) {
        return scheduleMapper.selectScheduleList(bno, sday);
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
