package com.example.albamen.controller.company;


import com.example.albamen.dto.company.BranchDTO;
import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.dto.page.Criteria;
import com.example.albamen.dto.page.PageDTO;
import com.example.albamen.dto.security.Albamen;
import com.example.albamen.dto.company.TimeDTO;
import com.example.albamen.service.company.CompanyService;
import com.example.albamen.service.member.MemberService;
import com.example.albamen.service.work.ScheduleService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/company")
@AllArgsConstructor
@Log4j2
public class CompanyController {
	private CompanyService companyService;
	private MemberService memberService;
	private ScheduleService scheduleService;

	@Autowired
	public void setCompanyService(CompanyService companyService){
		this.companyService = companyService;
	}
	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Autowired
	public void setScheduleService(ScheduleService scheduleService) {
		this.scheduleService = scheduleService;
	}



	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String company(@AuthenticationPrincipal Albamen albamen, Model model){
		if (albamen != null){
			if(albamen.getMember() !=null){
				return "/company/company";
			}
			model.addAttribute("company", albamen.getCompany());
			model.addAttribute("branchList", companyService.selectCompanyOfBranchList(albamen.getCompany().getCno()));
		}
		return "/company/company";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String getLogout(){
		return "/company/company";
	}


	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getCompanyRegister(){ }
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postCompanyRegister(CompanyDTO companyDTO){
		companyService.insertCompany(companyDTO);
		return "redirect:/company/";
	}

//	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getCompanyList(Criteria criteria, Model model){
	    model.addAttribute("companyList", companyService.selectCompanyList(criteria));
		int total = companyService.getTotalCount(criteria);
		model.addAttribute("pageMaker", new PageDTO(criteria, total, 10));
	}
	@RequestMapping(value = "/branch", method = RequestMethod.GET)
	public void getBranchInfo(@RequestParam("bno") int bno, Model model){
		model.addAttribute("branch", companyService.selectBranch(bno));
	}




//	@Secured({"ROLE_ADMIN", "ROLE_MANAGER"})
	@RequestMapping(value = "/branch/register", method = RequestMethod.GET)
	public void getBranchRegister(){	}
	@RequestMapping(value = "/branch/register", method = RequestMethod.POST)
	@Secured({"ROLE_ADMIN", "ROLE_MANAGER"})
	public String postBranchRegister(@AuthenticationPrincipal Albamen albamen, BranchDTO branchDTO){
		branchDTO.setCno(albamen.getCompany().getCno());
		companyService.insertBranch(branchDTO);
		return "redirect:/";
	}

	@PreAuthorize("isAuthenticated() and #cno == #albamen.company.cno")
	@RequestMapping(value = "/branch/", method = RequestMethod.POST)
	public String postBranch(@AuthenticationPrincipal Albamen albamen,
							@RequestParam("cno") int cno, @RequestParam("bno") int bno, Model model){
			model.addAttribute("branch", companyService.selectBranch(bno));
		return "company/branch/branch";
	}

	@PreAuthorize("isAuthenticated() and #cno == #albamen.company.cno")
	@RequestMapping(value = "/branch/modify", method = RequestMethod.GET)
	public void getBranchModify(@AuthenticationPrincipal Albamen albamen,
								@RequestParam("cno") int cno, @RequestParam("bno") int bno, Model model){
		model.addAttribute("branch", companyService.selectBranch(bno));
	}

	@RequestMapping(value = "/branch/modify", method = RequestMethod.POST)
	public String postBranchModify(BranchDTO branchDTO){
		companyService.updateBranch(branchDTO);
		return "redirect:/company/";
	}

	@RequestMapping(value = "/branch/schedule", method = RequestMethod.GET)
	public void getSchedule(@RequestParam("bno") int bno, Model model){
		model.addAttribute("branch", companyService.selectBranch(bno));
	}
	@RequestMapping(value = "/branch/time", method = RequestMethod.GET)
	public void getTime(@RequestParam("bno") int bno, Model model){
		model.addAttribute("branch", companyService.selectBranch(bno));
	}
	@RequestMapping(value = "/branch/time", method = RequestMethod.POST)
	public String postTime(TimeDTO timeDTO){
		log.info(timeDTO);
		scheduleService.insertTime(timeDTO);
		return "company/company";
	}
	@RequestMapping(value = "/branch/timeList", method = RequestMethod.GET)
	@ResponseBody
	public void getTimeList(@RequestParam("bno") int bno){
		scheduleService.selectTimeList(bno);
	}

	@RequestMapping(value = "/branch/member", method = RequestMethod.POST)
	public void postBranchOfMember(@RequestParam("bno") int bno, Model model){
		model.addAttribute("memberList", memberService.selectBranchOfMember(bno));
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void findCompany(Criteria criteria, Model model){
 		model.addAttribute("companyList", companyService.selectCompanyList(criteria));
		int total = companyService.getTotalCount(criteria);
		log.info(new PageDTO(criteria, total, 10).toString());
		model.addAttribute("pageMaker", new PageDTO(criteria, total, 5));
	}

	@RequestMapping(value = "idChk", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id){
		return companyService.idCheck(id);
	}

	@RequestMapping(value = "/auth", method = RequestMethod.GET)
	@Secured({"ROLE_ADMIN"})
	public void getCompanyAuth(Criteria criteria, Model model){
		model.addAttribute("company", companyService.selectAuthList(criteria));
	}

	@RequestMapping(value = "/auth/{cno}/{auth}", method = RequestMethod.GET)
	public String changeAuth(@PathVariable int cno, @PathVariable String auth){
//		companyService.toggleRole(cno, auth);
		return "redirect:/company/auth";
	}
}
