package com.miksonx.myassistant.controllers;

import com.miksonx.myassistant.mail.MailSender;
import com.miksonx.myassistant.mail.MockMailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailController {

    private MailSender mailSender;

    public MailController(MailSender smtp) {
        this.mailSender = smtp;
    }

    @RequestMapping("/mail")
    public String mail() {
        mailSender.send("miksonx@gmail.com", "A test mail", "Body of send");
       if (mailSender.toString().contains("MockMailSender")){
    	   return "Hello World! Mail  is Sent!" +  " Mock mail controller used";
       }else
       {
    	   return "Hello World! Mail  is Sent!" +  " Smtp Mail controller used";
       }
       
    }
}

