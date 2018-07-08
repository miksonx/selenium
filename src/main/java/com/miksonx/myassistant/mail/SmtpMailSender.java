package com.miksonx.myassistant.mail;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;


public class SmtpMailSender implements MailSender{


    private static Log log = LogFactory.getLog(SmtpMailSender.class);

    @Override
    public void send(String to, String subject, String body) {
        log.info("Sending Smtp mail to " + to);
        log.info("wit subject " + subject);
        log.info("and body " + body);
    }
}
