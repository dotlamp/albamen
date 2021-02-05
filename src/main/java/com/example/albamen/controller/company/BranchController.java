package com.example.albamen.controller.company;

import com.example.albamen.dto.company.BranchDTO;
import com.example.albamen.dto.company.ScheduleDTO;
import com.example.albamen.dto.company.TimeDTO;
import com.example.albamen.dto.security.Albamen;
import com.example.albamen.service.company.CompanyService;
import com.example.albamen.service.member.MemberService;
import com.example.albamen.service.company.ScheduleService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/company/branch")
@AllArgsConstructor
@Log4j2
public class BranchController {
    private MemberService memberService;
    private CompanyService companyService;
    private ScheduleService scheduleService;
    @Autowired
    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }
    @Autowired
    public void setScheduleService(ScheduleService scheduleService) {
        this.scheduleService = scheduleService;
    }
    @Autowired
    public void setMemberService(MemberService memberService) {
        this.memberService = memberService;
    }

//    @Secured({"ROLE_ADMIN", "ROLE_MANAGER"})
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void getBranchRegister(){	}
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @Secured({"ROLE_ADMIN", "ROLE_MANAGER"})
    public String postBranchRegister(@AuthenticationPrincipal Albamen albamen, BranchDTO branchDTO){
        branchDTO.setCno(albamen.getCompany().getCno());
        companyService.insertBranch(branchDTO);
        return "redirect:/";
    }

    @PreAuthorize("isAuthenticated() and #albamen.company.searchBranchList(#bno) or #albamen.member.bnoCheck(#bno)")
    @RequestMapping(value = "/manage", method = RequestMethod.GET)
    public String postBranch(@AuthenticationPrincipal Albamen albamen,
                             @RequestParam("bno") int bno, Model model){
        model.addAttribute("branch", companyService.selectBranch(bno));
        return "company/branch/manage";
    }

    @PreAuthorize("isAuthenticated() and #albamen.company.searchBranchList(#bno) or #albamen.member.bnoCheck(#bno)")
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void getBranchModify(@AuthenticationPrincipal Albamen albamen,
                                @RequestParam("bno") int bno, Model model){
        model.addAttribute("branch", companyService.selectBranch(bno));
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String postBranchModify(BranchDTO branchDTO){
        companyService.updateBranch(branchDTO);
        return "redirect:/company/branch/manage"+"?bno="+branchDTO.getBno();
    }

    @PreAuthorize("isAuthenticated() and #albamen.company.searchBranchList(#bno) or #albamen.member.bnoCheck(#bno)")
    @RequestMapping(value = "/schedule", method = RequestMethod.GET)
    public void getSchedule(@AuthenticationPrincipal Albamen albamen,
                            @RequestParam("bno") int bno, Model model){
        model.addAttribute("branch", companyService.selectBranch(bno));
    }
    @RequestMapping(value = "/schedule", method = RequestMethod.POST)
    public String postSchedule(@RequestParam("bno") int bno, ScheduleDTO scheduleDTO){
        scheduleService.insertSchedule(scheduleDTO);
        return "redirect:/company/branch/schedule"+"?bno="+bno;
    }
    @PreAuthorize("isAuthenticated() and #albamen.company.searchBranchList(#bno) or #albamen.member.bnoCheck(#bno)")
    @RequestMapping(value = "/scheduleList", method = RequestMethod.POST)
    public void postScheduleListDay(@AuthenticationPrincipal Albamen albamen,
                            @RequestParam("bno") int bno, String sday, Model model){
        model.addAttribute("scList", scheduleService.selectScheduleListDay(bno, sday));
    }
    @PreAuthorize("isAuthenticated() and #albamen.company.searchBranchList(#bno) or #albamen.member.bnoCheck(#bno)")
    @RequestMapping(value = "/removeSchedule", method = RequestMethod.POST)
    public void removeSchedule(@AuthenticationPrincipal Albamen albamen,
                                   @RequestParam("bno") int bno, @RequestParam("sno") int sno){
        scheduleService.deleteSchdule(sno);
    }
    @PreAuthorize("isAuthenticated() and #albamen.company.searchBranchList(#bno) or #albamen.member.bnoCheck(#bno)")
    @RequestMapping(value = "/scheduleListMonth", method = RequestMethod.POST)
    @ResponseBody
    public List<ScheduleDTO> postScheduleListMonth(@AuthenticationPrincipal Albamen albamen,
                                                   @RequestParam("bno") int bno, String month, Model model){
        List<ScheduleDTO> list = scheduleService.selectScheduleListMonth(bno, month);
        return list;
    }

    @PreAuthorize("isAuthenticated() and #albamen.company.searchBranchList(#bno) or #albamen.member.bnoCheck(#bno)")
    @RequestMapping(value = "/time", method = RequestMethod.GET)
    public void getTime(@AuthenticationPrincipal Albamen albamen,
                        @RequestParam("bno") int bno, Model model){
        model.addAttribute("branch", companyService.selectBranch(bno));
        model.addAttribute("timeList", scheduleService.selectTimeList(bno));
    }
    @RequestMapping(value = "/time", method = RequestMethod.POST)
    public String postTime(TimeDTO timeDTO){
        scheduleService.insertTime(timeDTO);
        return "redirect:/company/branch/time"+"?bno="+timeDTO.getBno();
    }

    @RequestMapping(value = "/timeList", method = RequestMethod.GET)
    public void getTimeList(int bno, Model model){
        model.addAttribute("timeList", scheduleService.selectTimeList(bno));
    }
    @RequestMapping(value = "/removeTime", method = RequestMethod.POST)
    public void removeTime(int tno){
        scheduleService.deleteTime(tno);
    }



    @PreAuthorize("isAuthenticated() and #albamen.company.searchBranchList(#bno) or #albamen.member.bnoCheck(#bno)")
    @RequestMapping(value = "/member", method = RequestMethod.GET)
    public void postBranchOfMember(@AuthenticationPrincipal Albamen albamen,
                                   @RequestParam("bno") int bno, Model model){
        model.addAttribute("memberList", memberService.selectBranchOfMember(bno));
    }


}
