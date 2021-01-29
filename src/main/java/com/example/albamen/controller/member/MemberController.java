package com.example.albamen.controller.member;

import com.example.albamen.dto.company.BranchDTO;
import com.example.albamen.dto.company.CompanyDTO;
import com.example.albamen.dto.member.MemberDTO;
import com.example.albamen.dto.security.SecurityAlbamen;
import com.example.albamen.service.company.CompanyService;
import com.example.albamen.service.member.MemberService;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/member")
@AllArgsConstructor
@Log4j2
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    MemberService memberService;
    CompanyService companyService;

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

    //회원정보수정
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateMemberView(@ModelAttribute MemberDTO dto){
//        memberService.loginMember(dto);
        return "update";
    }

    @RequestMapping(value = "/updateMember", method = RequestMethod.POST)
    public String updateMember(MemberDTO dto, HttpSession session){
        memberService.updateMember(dto);
        session.invalidate();
        return "redirect:/login";
    }
    @RequestMapping("/workCheck")
    public String ListWork_M(){

        return "workCheck";

    }
    @RequestMapping("/login")
    public String login(){

        return "member/login";

    }
}
