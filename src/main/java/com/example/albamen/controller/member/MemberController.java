package com.example.albamen.controller.member;

import com.example.albamen.dto.member.MemberDTO;
import com.example.albamen.service.member.MemberService;
import lombok.extern.log4j.Log4j2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@Log4j2
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    MemberService memberService;

    //회원가입 get
    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public void getInsert(){
        logger.info("get insert");
    }
    //회원가입post
    @RequestMapping(value = "/join",method = RequestMethod.POST)
    public String postInsert(MemberDTO dto){
        logger.info("post Insert");
        int result = memberService.idCheck(dto);
        try{
            if(result==1){

                return "member/join";
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
    @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
    public int idCheck(MemberDTO dto){
        int result = memberService.idCheck(dto);
        return result;
    }

    //로그인
    @RequestMapping(value="/loginMember",method = RequestMethod.POST)
    public ModelAndView loginMember(@ModelAttribute MemberDTO dto, HttpServletRequest req, RedirectAttributes rttr){
        logger.info("post login");
        HttpSession session = req.getSession();
        MemberDTO login = memberService.loginMember(dto);
        ModelAndView mav = new ModelAndView();

        if(login == null){ //로그인 실패
            session.setAttribute("member",null);
            rttr.addFlashAttribute("msg", false);
            mav.setViewName("member/login");

        }else{ //로그인 성공
            session.setAttribute("member", login);
            mav.setViewName("member/workCheck");
        }
        return mav;
    }
    //로그아웃
    @RequestMapping(value = "/logoutMember", method = RequestMethod.GET)
    public String logoutMember(HttpSession session){
        session.invalidate();
        return "redirect:/login";
    }

    //회원정보수정
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateMemberView(@ModelAttribute MemberDTO dto){
        memberService.loginMember(dto);
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
