package org.hdcd.controller.manager.mail;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailException;
import org.hdcd.service.manager.mail.MailService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mail")
public class MailController {
	
	@Inject
	MailService mailService; 
	
	/**
	 * [메일발송 메소드]
	 * @param receiver
	 * @param emailFiles
	 * @param req
	 * @param title
	 * @param content
	 * @return 메일발송 성공시 OK, 실패시 NG
	 * @throws EmailException
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@PostMapping(value = "/send", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String sendMail(String receiver,
							List<MultipartFile> emailFiles,
							HttpServletRequest req,
							String title,
							String content) throws EmailException, IllegalStateException, IOException{
		
		log.debug("매일 발송 처리 메소드 실행~!!!!!!!!");
		
		String[] temp = receiver.split(",");
		
		for (String string : temp) {
			log.debug("이건 어때 {}", string);
		}
		
		String res = mailService.sendMail(receiver.split(","), emailFiles, req, title, content);
		
		log.debug("매일 전송 후 값이다 : {}", res);
		
		return res;
	}
	
}
