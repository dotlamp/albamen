package com.example.albamen.controller;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Log4j2
public class MainController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(){
        return "main";
    }

    @RequestMapping(value = "/company", method = RequestMethod.GET)
    public String company(){
        return "redirect:/company/";
    }

    @RequestMapping(value = "/member", method = RequestMethod.GET)
    public String member(){
        return "member/member";
    }

}

