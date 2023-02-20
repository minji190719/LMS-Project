package org.hdcd.service.manager.mail;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailException;
import org.springframework.web.multipart.MultipartFile;

public interface MailService {

	String sendMail(String[] receiver, List<MultipartFile> emailFiles, HttpServletRequest req, String title, String content) throws EmailException, IllegalStateException, IOException;

}
