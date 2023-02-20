package org.hdcd.controller.manager.enroll_member;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hdcd.service.manager.enroll.EnrollUserService;
import org.hdcd.vo.DepartmentVO;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.StudentVO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/enroll")
public class EnrollMemberController {

	@Inject
	EnrollUserService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String enrollMain() {
		return "enroll/registerForm";
	}
	
	
	//엑셀 업로드
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ResponseEntity<List<Map<String, Object>>> uploadExcel(MultipartFile excel, Model model) throws IOException {
		
		
		   Map<String, Object> dataMap = null;
		   List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		      try {
		            
		    	    XSSFWorkbook workBook = new XSSFWorkbook(excel.getInputStream());
		            // 첫번째 시트 불러오기
		            XSSFSheet sheet = workBook.getSheetAt(0);
		            
		            for(int i=1; i<sheet.getLastRowNum() + 1; i++) {
		            	dataMap = new HashMap<String, Object>();
		                XSSFRow row = sheet.getRow(i);
		                
		                // 행이 존재하기 않으면 패스
		                if(null == row) {
		                    continue;
		                }
		                
		                //12개 행
		                XSSFCell cell = row.getCell(0);
		                // 행의 1번째 열(순번) 
		                if(null != cell) 
		                	dataMap.put("mem_no", (int)cell.getNumericCellValue());
		                
		                // 행의 2번째 열(회원명)
		                cell = row.getCell(1);
		                if(null != cell) 
		                	dataMap.put("mem_name", cell.getStringCellValue());
		                
		                // 행의 3번째 열(성별)
		                cell = row.getCell(2);
		                if(null != cell) 
		                	dataMap.put("mem_sex", cell.getStringCellValue());
		                
		                // 행의 4번째 열(단과대학명)
		                cell = row.getCell(3);
		                if(null != cell) 
		                	dataMap.put("col_name", cell.getStringCellValue());
		                	
		                // 행의 5번째 열(학과명)
		                cell = row.getCell(4);
		                if(null != cell) 
		                	dataMap.put("dep_name", cell.getStringCellValue());
		                
		                // 행의 6번째 열(입학일자)
		                cell = row.getCell(5);
		                if(null != cell) 
		                	dataMap.put("stu_joinyear", cell.getStringCellValue());
		                
		                // 행의 7번째 열(연락처)
		                cell = row.getCell(6);
		                if(null != cell) 
		                	dataMap.put("mem_tel", cell.getStringCellValue());
		                
		                // 행의 8번째 열(주민번호 앞)
		                cell = row.getCell(7);
		                if(null != cell) 
		                	dataMap.put("mem_reg1", String.valueOf((int)cell.getNumericCellValue()));
		                
		                // 행의 9번째 열(주민번호 뒤)
		                cell = row.getCell(8);
		                if(null != cell) 
		                	dataMap.put("mem_reg2", String.valueOf((int)cell.getNumericCellValue()));
		                
		                // 행의 10번째 열(이메일)
		                cell = row.getCell(9);
		                if(null != cell) 
		                	dataMap.put("mem_email", cell.getStringCellValue());
		                
		                // 행의 11번째 열(주소)
		                cell = row.getCell(10);
		                if(null != cell) 
		                	dataMap.put("mem_addr1", cell.getStringCellValue());
		                
		                // 행의 12번째 열(상세주소)
		                cell = row.getCell(11);
		                if(null != cell) 
		                	dataMap.put("mem_addr2", cell.getStringCellValue());
		                
		                // 행의 13번째 열(학과코드)
		                cell = row.getCell(12);
		                if(null != cell) 
		                	dataMap.put("dep_code", cell.getStringCellValue());

		                
		                list.add(dataMap);

		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		      
		ResponseEntity<List<Map<String, Object>>> entity = new ResponseEntity<List<Map<String, Object>>>(list, HttpStatus.OK);
		return entity;
	}
	
	
	@Inject
	JavaMailSender mailSender;
	
	@ResponseBody
	@RequestMapping(value = "/enrollReg", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> enrollReg(MemberVO memberVO, StudentVO studentVO) {
		// 학과 코드 가져오기
		DepartmentVO departmentVO = service.selectOne(studentVO.getDep_code());
		
		String tmpPassword = randomPassword();
		
		// 회원번호
		memberVO.setMem_no(studentVO.getSmem_no());
		memberVO.setMem_pass(tmpPassword);
		
		// 학생정보 업로드
		studentVO.setStu_ccl(departmentVO.getDep_ccl());
		studentVO.setStu_cnl(departmentVO.getDep_cnl());
		studentVO.setStu_dep(departmentVO.getDep_name());
		studentVO.setStu_joinyear(2023);
		studentVO.setStu_mcl(departmentVO.getDep_mcl());
		studentVO.setStu_mnl(departmentVO.getDep_mnl());
		studentVO.setStu_record("재학");
		studentVO.setStu_schyear(1);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("MemberVO", memberVO);
		dataMap.put("StudentVO", studentVO);

		// 회원정보, 학생정보 입력
		int result = service.insertMem(dataMap);
		
		String msg;
		msg = "<div onclick='copyFunction()'><span style='color:red;' id='test'>학번은"
		      +memberVO.getMem_no()+" test임시 비밀번호는 "
			  +memberVO.getMem_pass()+" 입니다.</span>"
			  +"</div>"
			  +"<script>"
			  +"function copyFunction(){"
			  +"let text = document.querySelector(#test);"
			  +"text.select();"
			  +"document.execCommand('Copy');"
			  +"}"
			  +"</script>";
		//메일 전송 해봅시다.
		StringBuffer sb = new StringBuffer();
		sb.append("     <div>");
		sb.append("         <xlink href='https://fonts.googleapis.com/css?family=Lato:400,700,900' rel='stylesheet'>");
		sb.append("             <xlink href='https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&amp;display=swap'");
		sb.append("                 rel='stylesheet'>");
		sb.append("                 <table");
		sb.append("                     style='background-color: #ffffff; padding-top: 20px;color: #434245;width: 100%;-webkit-font-smoothing:antialiased; -moz-osx-font-smoothing:grayscale;   border: 0; text-align: center; border-collapse: collapse;'>");
		sb.append("                     <tbody>");
		sb.append("                         <tr>");
		sb.append("                             <td style='vertical-align: top; padding: 0'>");
		sb.append("                                 <center>");
		sb.append("                                     <table");
		sb.append("                                         style='border: 0; border-collapse: collapse; margin: 0 auto; background: white; border-radius: 8px; margin-bottom: 16px;'>");
		sb.append("                                         <tbody>");
		sb.append("                                             <tr>");
		sb.append("                                                 <td style='width: 546px; vertical-align: top; padding-top: 32px'>");
		sb.append("                                                     <div style='max-width: 600px; margin: 0 auto;'>");
		sb.append("                                                         <div");
		sb.append("                                                             style='margin-left: 50px; margin-right: 50px; margin-bottom: 72px; margin-bottom: 30px;'>");
		sb.append("                                                             <div style='margin-top: 18px;'><img width='80' height='80'");
		sb.append("                                                                     style='margin-top: 0; margin-right: 0; margin-bottom: 32px; margin-left: 0px;'");
		sb.append("                                                                     src='http://192.168.144.36/resources/images/한국대학교_로고3.png'");
		sb.append("                                                                     alt='한국대학교 로고' loading='lazy'><span style='position:relative;top:-8px;left:15px; font-size:3rem'>[한국대학교]</span></div>");
		sb.append("                                                             <p");
		sb.append("                                                                 style='font-size: 20px; line-height: 28px; letter-spacing: -0.2px; margin-bottom: 28px; word-break: break-word;'>");
		sb.append("                                                                 [한국대학교] 학번 및 임시비밀번호 발급 안내</p>");
		sb.append("                                                         </div>");
		sb.append("                                                         <div");
		sb.append("                                                             style='background: #F5F4F5; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); border-radius: 4px; padding: 43px 23px; margin-left: 50px; margin-right: 50px; margin-bottom: 72px; margin-bottom: 30px;'>");
		sb.append("                                                             <div");
		sb.append("                                                                 style=' vertical-align: middle; font-size: 30px;'>");
		sb.append("                                                                  <table>");
		sb.append("                                                                     <tr style='margin-bottom:5px;'>");
		sb.append("                                                                         <th>학번: </th>");
		sb.append("                                                                         <th>"+memberVO.getMem_no()+"</th>");
		sb.append("                                                                     </tr>");
		sb.append("                                                                     <tr>");
		sb.append("                                                                         <th>임시비밀번호: </th>");
		sb.append("                                                                         <th>"+memberVO.getMem_pass()+"</th>");
		sb.append("                                                                     </tr>");
		sb.append("                                                                 </table>");
		sb.append("                                                             </div>");
		sb.append("                                                         </div>");
		sb.append("                                                         <div");
		sb.append("                                                             style='margin-left: 50px; margin-right: 50px; margin-bottom: 72px; margin-bottom: 30px;'>");
		sb.append("                                                             <p");
		sb.append("                                                                 style='font-size: 16px; line-height: 24px; letter-spacing: -0.2px; margin-bottom: 28px;'>");
		sb.append("                                                             </p>");
		sb.append("                                                             <p");
		sb.append("                                                                 style='font-size: 16px; line-height: 24px; letter-spacing: -0.2px; margin-bottom: 28px;'>");
		sb.append("                                                                 최초 로그인시 비밀번호를 반드시 변경하셔야 합니다.</p>");
		sb.append("                                                         </div>");
		sb.append("                                                     </div>");
		sb.append("                                                 </td>");
		sb.append("                                             </tr>");
		sb.append("                                         </tbody>");
		sb.append("                                     </table>");
		sb.append("                                 </center>");
		sb.append("                             </td>");
		sb.append("                         </tr>");
		sb.append("                         <tr>");
		sb.append("                             <td style='font-size: 15px;color: #717274;text-align: center;width: 100%;'>");
		sb.append("                                 <center>");
		sb.append("                                     <table");
		sb.append("                                         style='margin: 20px auto 0; background-color: white; border: 0; text-align: center; border-collapse: collapse;'>");
		sb.append("                                         <tbody>");
		sb.append("                                             <tr>");
		sb.append("                                                 <td style='width: 546px; vertical-align: top; padding: 0px;'>");
		sb.append("                                                     <div style='max-width: 600px; margin: 0 auto;'>");
		sb.append("                                                         <div style='padding:0 50px;'>");
		sb.append("                                                             <table width='100%' style='position:relative;top:-30px;'>");
		sb.append("                                                                 <tbody>");
		sb.append("                                                                     <tr>");
		sb.append("                                                                         <td");
		sb.append("                                                                             style='vertical-align: top; text-align: left; position:relative;top:-20px;'>");
		sb.append("                                                                             <img width='80' height='80'");
		sb.append("                                                                                 src='/resources/images/한국대학교_로고3.png'");
		sb.append("                                                                                 alt='한국대학교 로고' loading='lazy'>");
		sb.append("                                                                             </td>");
		sb.append("                                                                         <td");
		sb.append("                                                                             style='vertical-align: top; text-align: center;'>");
		sb.append("                                                                             <a><img");
		sb.append("                                                                                     src='https://a.slack-edge.com/b8be608/marketing/img/icons/icon_colored_twitter.png'");
		sb.append("                                                                                     width='32' height='32'");
		sb.append("                                                                                     ></a>");
		sb.append("                                                                       </td>");
		sb.append("                                                                         <td style='vertical-align: top; text-align: center;'><a");
		sb.append("                                                                                 href='https://facebook.com/slackhq'");
		sb.append("                                                                                ");
		sb.append("                                                                                 rel='noreferrer noopener'");
		sb.append("                                                                                 target='_blank'><img");
		sb.append("                                                                                     src='https://a.slack-edge.com/b8be608/marketing/img/icons/icon_colored_facebook.png'");
		sb.append("                                                                                     width='32' height='32'");
		sb.append("                                                                                     title='Facebook'");
		sb.append("                                                                                     loading='lazy'></a>");
		sb.append("                                                                             </td>");
		sb.append("                                                                         <td style='vertical-align: top; text-align: center;'>");
		sb.append("                                                                             <a><img");
		sb.append("                                                                                     src='https://a.slack-edge.com/b8be608/marketing/img/icons/icon_colored_linkedin.png'");
		sb.append("                                                                                     width='32' height='32'");
		sb.append("                                                                                     title='LinkedIn' loading='lazy'></a>");
		sb.append("                                                                         </td>");
		sb.append("                                                                     </tr>");
		sb.append("                                                                 </tbody>");
		sb.append("                                                             </table>");
		sb.append("                                                                 <div class='footer-menubar'>");
		sb.append("                                                                     <div>");
		sb.append("                                                                         <div>");
		sb.append("                                                                               대전광역시 중구 계룡로 846, 3-4층<br>");
		sb.append("                                                                                 Copyright (C) 2016 <br>");
		sb.append("                                                                             HANKOOK UNIVERSITY All Rights Reserved.");
		sb.append("                                                                         </div>");
		sb.append("                                                                     </div>");
		sb.append("                                                                 </div>");
		sb.append("                                                         </div>");
		sb.append("                                                     </div>");
		sb.append("                                                 </td>");
		sb.append("                                             </tr>");
		sb.append("                                         </tbody>");
		sb.append("                                     </table>");
		sb.append("                                 </center>");
		sb.append("                             </td>");
		sb.append("                         </tr>");
		sb.append("                     </tbody>");
		sb.append("                 </table>");
		sb.append(" ");
		sb.append("             </xlink>");
		sb.append("         </xlink>");
		sb.append("     </div>");

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true,"utf-8");
			messageHelper.setFrom("dlstmdwn@naver.com");
			messageHelper.setTo("hzyen@naver.com");
			messageHelper.setSubject("[한국대학교] 개인학번과 임시비밀번호 입니다.");
			messageHelper.setText(sb.toString(),true);
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
		
		ResponseEntity<String> entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	
	public String randomPassword() {
        char[] charSet = new char[] {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                '!', '@', '#', '$', '%', '^', '&' };

        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int idx = 0;
        int len = charSet.length;
        for (int i=0; i<8; i++) {
            idx = sr.nextInt(len); 
            sb.append(charSet[idx]);
        }
		return sb.toString();
		
	}
	
	
	
	
}


