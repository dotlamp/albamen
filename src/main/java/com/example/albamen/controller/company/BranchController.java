package com.example.albamen.controller.company;

import com.example.albamen.dto.company.BranchDTO;
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

    //	@Secured({"ROLE_ADMIN", "ROLE_MANAGER"})
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void getBranchRegister(){	}
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @Secured({"ROLE_ADMIN", "ROLE_MANAGER"})
    public String postBranchRegister(@AuthenticationPrincipal Albamen albamen, BranchDTO branchDTO){
        branchDTO.setCno(albamen.getCompany().getCno());
        companyService.insertBranch(branchDTO);
        return "redirect:/";
    }

    @PreAuthorize("isAuthenticated() and #cno == #albamen.company.cno")
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String postBranch(@AuthenticationPrincipal Albamen albamen,
                             @RequestParam("cno") int cno, @RequestParam("bno") int bno, Model model){
        model.addAttribute("branch", companyService.selectBranch(bno));
        return "company/branch/branch";
    }

    @PreAuthorize("isAuthenticated() and #cno == #albamen.company.cno")
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void getBranchModify(@AuthenticationPrincipal Albamen albamen,
                                @RequestParam("cno") int cno, @RequestParam("bno") int bno, Model model){
        model.addAttribute("branch", companyService.selectBranch(bno));
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String postBranchModify(BranchDTO branchDTO){
        companyService.updateBranch(branchDTO);
        return "redirect:/company/";
    }

    @RequestMapping(value = "/schedule", method = RequestMethod.GET)
    public void getSchedule(@RequestParam("bno") int bno, Model model){
        model.addAttribute("branch", companyService.selectBranch(bno));
    }
    @RequestMapping(value = "/time", method = RequestMethod.GET)
    public void getTime(@RequestParam("bno") int bno, Model model){
        model.addAttribute("branch", companyService.selectBranch(bno));
    }
    @RequestMapping(value = "/time", method = RequestMethod.POST)
    public String postTime(TimeDTO timeDTO){
        log.info(timeDTO);
        scheduleService.insertTime(timeDTO);
        return "company/company";
    }
    @RequestMapping(value = "/timeList", method = RequestMethod.GET)
    @ResponseBody
    public void getTimeList(@RequestParam("bno") int bno, Model model){
        log.info("------------------------------------------------------------------------------");
        model.addAttribute("timeList", scheduleService.selectTimeList(bno));
    }

    @RequestMapping(value = "/member", method = RequestMethod.POST)
    public void postBranchOfMember(@RequestParam("bno") int bno, Model model){
        model.addAttribute("memberList", memberService.selectBranchOfMember(bno));
    }


}
