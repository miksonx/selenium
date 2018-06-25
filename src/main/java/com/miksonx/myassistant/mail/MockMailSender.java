package com.miksonx.myassistant.mail;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class MockMailSender implements MailSender{


    private static Log log = LogFactory.getLog(MockMailSender.class);

    @Override
    public void send(String to, String subject, String body) {
        log.info("Sending Mock mail to " + to);
        log.info("wit subject " + subject);
        log.info("and body " + body);
    }
}
