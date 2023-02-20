package org.hdcd.controller.common.login;


import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Hex;
import org.hdcd.service.student.enroll.EnrollCheckService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import de.taimos.totp.TOTP;
import de.taimos.totp.TOTPData;

@Controller
@RequestMapping("/otp")
public class PageController4 {


	
	private static Logger logger = LoggerFactory.getLogger(PageController4.class);
	String otp = "";
	String hexKey ="";

	
	@GetMapping("/login.do")
	public String login(ModelMap model) {
		logger.info("login");
			
		String url = "http://chart.apis.google.com/chart?cht=qr&amp;chs=400x400&amp;chl=";
		// 비밀키 생성 
		byte[] secret =TOTPData.createSecret(); // 바이트로 구성됨 
		
		// 그냥 방법
		//보낼 16진수 
		hexKey = Hex.encodeHexString(secret); //sdk21klwakdasldalskjdas
		logger.info("hexKey : " + hexKey);
		
		//보낼otp 생성 
		otp  = TOTP.getOTP(hexKey); // 124662
		logger.info("otp :" + otp);
		
		String urlall = url + getGoogleOTPAuthURL(hexKey, "eunhyeok0901@naver.com", "한국대학교"); 
		
		model.addAttribute("url", urlall);
		model.addAttribute("hexKey", hexKey);
		
		return "firstLoginSuccess";
	}

	@PostMapping("/second")
	public String otpSecond(String otp, Model model, HttpServletRequest request) {
		logger.debug("OTP 검증 후 메서드입니다");
		//검증 
		boolean result = TOTP.validate(hexKey, otp);
		logger.info("result : " + result);
		if(result) { //성공
			
			String userId = (String)request.getSession().getAttribute("userId");
			
			return "redirect:/main/home";
		}else {
			model.addAttribute("msg", "인증 실패 다시 시도 ");
			return "/logout";
		}
		
	}

    // 최초 개인키 생성 시 사용하는 메소드
    public String getSecretKey() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[20];
        random.nextBytes(bytes);
        Base32 base32 = new Base32();
        return base32.encodeToString(bytes);
    }

    // OTP검증 요청 때마다 개인키로 OTP 생성하는 메소드
    public String getTOTPCode(String secretKey) {
        Base32 base32 = new Base32();
        byte[] bytes = base32.decode(secretKey);
        String hexKey = Hex.encodeHexString(bytes);
        return TOTP.getOTP(hexKey);
    }

    // 개인키, 계정명(유저ID), 발급자(회사명)을 받아서 구글OTP 인증용 링크를 생성하는 메소드
    public String getGoogleOTPAuthURL(String secretKey, String account, String issuer) {
        try {
            return "otpauth://totp/"
                    + URLEncoder.encode(issuer + ":" + account, "UTF-8").replace("+", "%20")
                    + "?secret=" + URLEncoder.encode(secretKey, "UTF-8").replace("+", "%20")
                    + "&issuer=" + URLEncoder.encode(issuer, "UTF-8").replace("+", "%20");
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    // url, 파일생성할경로, 높이px, 폭px을 받아서 QR코드 이미지를 생성하는 메소드
    public void getQRImage(String googleOTPAuthURL, String filePath, int height, int width) throws WriterException, IOException {
        BitMatrix matrix = new MultiFormatWriter().encode(googleOTPAuthURL, BarcodeFormat.QR_CODE, width, height);
        try (FileOutputStream out = new FileOutputStream(filePath)) {
            MatrixToImageWriter.writeToStream(matrix, "png", out);
        }
    }
    
}
