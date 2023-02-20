package org.hdcd.service.manager.mail;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public String sendMail(String[] receiver, List<MultipartFile> emailFiles, HttpServletRequest req, String title, String content) throws EmailException, IllegalStateException, IOException {
		
	String savePath = req.getSession().getServletContext().getRealPath("/resources/mailFile");
		
		File file = new File(savePath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		List<String> sendPath = new ArrayList<String>();
		List<String> sendFileName = new ArrayList<String>();
		
		// 매일발송할때 들어온 파일 임시저장
		for (MultipartFile multipartFile : emailFiles) {
			String tempPath = savePath + "/" + multipartFile.getOriginalFilename();
			multipartFile.transferTo(new File(tempPath));
			sendFileName.add(multipartFile.getOriginalFilename());
			sendPath.add(tempPath);
		}
		
		for (int i = 0; i < receiver.length; i++) {
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom("dlstmdwn@naver.com"); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(receiver[i]); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				for (int j = 0; j < sendPath.size(); j++) {
					FileSystemResource fsr = new FileSystemResource(sendPath.get(j));
					messageHelper.addAttachment(sendFileName.get(j), fsr);
				}

				mailSender.send(message);
		
				
			} catch (Exception e) {
				System.out.println(e);
				return "NG";
			}
			
		}
		
		return "OK";
	}

}
