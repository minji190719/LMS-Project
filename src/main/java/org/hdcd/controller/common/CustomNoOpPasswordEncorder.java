package org.hdcd.controller.common;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomNoOpPasswordEncorder implements PasswordEncoder{
   // Override : 메소드 재정의
   @Override
   public String encode(CharSequence rawPassword) {
      log.warn("before encode : " + rawPassword);
      // 아무것도 안하겠다, => 암호화를 안하겠다라는 의미
      return rawPassword.toString();
   }

   @Override
   public boolean matches(CharSequence rawPassword, String encodedPassword) {
      log.warn("matches : " + rawPassword + " : " + encodedPassword);
      // "1234".equals("1234")
      return rawPassword.toString().equals(encodedPassword);
   }
   
}
