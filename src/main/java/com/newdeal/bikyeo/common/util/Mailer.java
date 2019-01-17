package com.newdeal.bikyeo.common.util;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class Mailer {

  @Autowired
  JavaMailSender emailSender;

  @Autowired
  Configuration freemarkerConfig;

  @Autowired 
  ResourceLoader resourceLoader;

  public void sendSimpleMessage(Mail mail) throws MessagingException, IOException, TemplateException {
    MimeMessage message = emailSender.createMimeMessage();
    MimeMessageHelper helper = new MimeMessageHelper(message,
        MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
        StandardCharsets.UTF_8.name());

    Template t = freemarkerConfig.getTemplate(mail.getTemplate());
    String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, mail.getModel());

    helper.setTo(mail.getTo());
    helper.setText(html, true);
    helper.setSubject(mail.getSubject());
    helper.setFrom(mail.getFrom());
    
    emailSender.send(message);
  }
}
