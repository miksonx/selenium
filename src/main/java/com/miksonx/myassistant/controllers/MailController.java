package com.miksonx.myassistant.controllers;

import com.miksonx.myassistant.mail.MailSender;
import com.miksonx.myassistant.mail.MockMailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailController {

    @Autowired
    public MailController(@Qualifier("smtpMailSender") MailSender smtp) {
        this.mailSender = smtp;
    }

    private MailSender mailSender;

    @RequestMapping("/mail")
    public String mail() {
        mailSender.send("miksonx@gmail.com", "A test mail", "Body of send");
        return "Hello World! Mail is Sent!";
    }
}

