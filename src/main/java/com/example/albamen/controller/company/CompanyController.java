package com.example.albamen.controller.company;


import com.example.albamen.dto.company.BranchDTO;
import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.dto.page.Criteria;
import com.example.albamen.dto.page.PageDTO;
import com.example.albamen.dto.security.SecurityAlbamen;
import com.example.albamen.service.company.CompanyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/company")
@AllArgsConstructor
@Log4j2
public class CompanyController {
	private CompanyService companyService;
	@Autowired
	public void setCompanyService(CompanyService companyService){
		this.companyService = companyService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String company(@AuthenticationPrincipal SecurityAlbamen albamen, Model model){
		if (albamen != null){
			model.addAttribute("company", albamen.getCompany());
		}
		return "/company/company";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String getLogout(){
		return "/company/company";
	}
	/*
	* 회사 등록
	* @Param CompanyDTO
	* */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister(){ }
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(CompanyDTO companyDTO){
		companyService.insertCompany(companyDTO);
		return "redirect:/company/";
	}



//	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Criteria criteria, Model model){
	    model.addAttribute("companyList", companyService.selectCompanyList(criteria));
		int total = companyService.getTotalCount(criteria);
		model.addAttribute("pageMaker", new PageDTO(criteria, total, 10));
	}

	@RequestMapping(value = "/branch", method = RequestMethod.GET)
	public void postBranch(@RequestParam("bno") int bno, Model model){
		model.addAttribute("branch", companyService.selectBranch(bno));
	}


	@RequestMapping(value = "/branch/register", method = RequestMethod.GET)
	@Secured({"ROLE_ADMIN", "ROLE_MANAGER"})
	public void getBranch(){	}
	@RequestMapping(value = "/branch/register", method = RequestMethod.POST)
	@Secured({"ROLE_ADMIN", "ROLE_MANAGER"})
	public String postBranch(@AuthenticationPrincipal SecurityAlbamen albamen, BranchDTO branchDTO){
		branchDTO.setCno(albamen.getCompany().getCno());
		companyService.insertBranch(branchDTO);
		return "redirect:/";
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
