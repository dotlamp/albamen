package com.example.albamen.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@AllArgsConstructor
@Log4j2
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLogin(String error, String logout, Model model){
        if(error != null){
            model.addAttribute("error", "아이디 또는 패스워드 확인바랍니다.");
        }
        if(logout != null){
            model.addAttribute("logout", "로그아웃");
        }
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String getLogout(){
        return "/";
    }
}
