package com.example.albamen.controller.member;

import com.example.albamen.dto.company.BranchDTO;
import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.dto.company.ScheduleDTO;
import com.example.albamen.dto.company.TimeDTO;
import com.example.albamen.dto.member.MemberDTO;
import com.example.albamen.dto.member.Work_MDTO;
import com.example.albamen.dto.security.Albamen;
import com.example.albamen.service.company.CompanyService;
import com.example.albamen.service.member.MemberService;
import com.example.albamen.service.company.ScheduleService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@Controller
@RequestMapping("/member")
@AllArgsConstructor
@Log4j2
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    MemberService memberService;
    CompanyService companyService;
    ScheduleService scheduleService;

    //회원가입 get
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void getInsert(){
        logger.info("get insert");
    }
    //회원가입post
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String postInsert(MemberDTO dto){
        logger.info("post Insert");
        int result = memberService.idCheck(dto);
        try{
            if(result==1){

                return "member/register";
            }else if(result ==0){
                memberService.insertMember(dto);
            }
        }catch (Exception e){
            throw new RuntimeException();
        }
        return "redirect:/login";

    }
    //아이디체크
    @ResponseBody
    @RequestMapping(value = "/idCheck", method = RequestMethod.GET)
    public int idCheck(MemberDTO dto) {
        int result = memberService.idCheck(dto);
        return result;
    }
    //회원 회사 조인리스트
    @RequestMapping(value ="/list", method = RequestMethod.GET)
    public void List(Principal principal, Model model){
        MemberDTO memberDTO = memberService.selectMember(principal.getName());
        model.addAttribute("member", memberDTO);
        CompanyDTO companyDTO = companyService.selectCompany(memberDTO.getCno());
        model.addAttribute("company", companyDTO);

    }
    //출퇴근기록리스트
    @RequestMapping(value ="/workList", method = RequestMethod.GET)
    public void workList(Principal principal, Model model){

        MemberDTO memberDTO = memberService.selectMember(principal.getName());
        model.addAttribute("member", memberDTO);
        BranchDTO branchDTO = companyService.getBranch(memberDTO.getBno());
        model.addAttribute("branch", branchDTO);
        MemberDTO memberDTO_1 = memberService.workList(memberDTO.getId());
        model.addAttribute("work", memberDTO_1);
    }

    //출근입력
    @RequestMapping(value = "/insertWork")
    public String insertWork(Work_MDTO dto){
        ScheduleDTO scheduleDTO = scheduleService.selectTSchedule(dto.getMno()); //스케줄 정보
        TimeDTO timeDTO = scheduleService.selectTime(scheduleDTO.getTno()); //시간스케줄
        String starttime = timeDTO.getStartTime(); //지정출근시간
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss.SSS");
        Date now = new Date(); //현재시간
        String nowtime = sdf.format(now);
        int compare = nowtime.compareTo(starttime);
        //time2가 클때 1, 작으면 -1
        if(compare>=0){
            compare=2;
            dto.setStartstatus(compare);
        }else{
            compare=1;
            dto.setStartstatus(compare);
        }
        memberService.insertWork(dto);
        return "redirect:workList";
    }
    //퇴근입력
    @RequestMapping(value = "/updateWork")
    public String updateWork(Work_MDTO dto) throws ParseException {
        ScheduleDTO scheduleDTO = scheduleService.selectTSchedule(dto.getMno()); //스케줄 정보
        TimeDTO timeDTO = scheduleService.selectTime(scheduleDTO.getTno()); //시간스케줄
        String endtime = timeDTO.getEndTime();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        Date now = new Date();
        String nowtime = sdf.format(now);
        int compare = nowtime.compareTo(endtime);
        //compare=1 정상, compare=2 조기퇴근
        if(compare>=0){
            compare=1;
            dto.setEndstatus(compare);
            Date nowtime1 = sdf.parse(nowtime); //현재시간 date로변환
            Date endtime1 = sdf.parse(endtime); //퇴근지정시간 date로변환
            long overtime = nowtime1.getTime()-endtime1.getTime(); //시간차이 계산
            String addtime = String.format("%02d:%02d:%02d",
                    TimeUnit.MILLISECONDS.toHours(overtime),
                    TimeUnit.MILLISECONDS.toMinutes(overtime) -
                            TimeUnit.HOURS.toMinutes(TimeUnit.MILLISECONDS.toHours(overtime)),
                    TimeUnit.MILLISECONDS.toSeconds(overtime) -
                            TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(overtime)));
            dto.setOverTime('"'+addtime+'"');

        }else{
            compare=2;
            dto.setEndstatus(compare);
            dto.setOverTime(null);
        }
        memberService.updateWork(dto);
        return "redirect:workList";
    }

    //회원정보수정
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateMemberView(Principal principal, Model model){
        MemberDTO memberDTO = memberService.selectMember(principal.getName());
        model.addAttribute("member",memberDTO);
        CompanyDTO companyDTO = companyService.getCBranch(memberDTO.getBno());
        model.addAttribute("company",companyDTO);
        return "member/update";
    }

    @RequestMapping(value = "/updateMember", method = RequestMethod.POST)
    public String updateMember(MemberDTO dto){
        memberService.updateMember(dto);
        return "redirect:update";
    }
    @RequestMapping("/login")
    public String login(){

        return "member/login";

    }
}
