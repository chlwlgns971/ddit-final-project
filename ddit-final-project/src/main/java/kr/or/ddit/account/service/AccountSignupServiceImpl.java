package kr.or.ddit.account.service;

import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.account.joinController;
import kr.or.ddit.account.dao.AccountSignDAO;
import kr.or.ddit.vo.AccountSignVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AccountSignupServiceImpl implements AccountSignupService{
	
	@Inject
	AccountSignDAO dao;
	
	/**
	 * 비밀번호 암호화
	 */
	@Autowired
	PasswordEncoder passwordEncoder;
	
	/*
	 * 사업자회원 가입
	 */
	@Override
	public void accountBisReg(AccountSignVO account) throws Exception {
		log.info("accountbisREG", account);
		account.setAccStat("bis");
		dao.accountBisReg(account);
	}

	/* 
	 * 일반회원 가입
	 */
	public void accountReg(AccountSignVO account){
		account.setAccStat("n");
		dao.accountReg(account);
		
	}
	
	/* 
	 * 아이디 중복 검사
	 */
	public int idCheck(String accId) {
		int cnt = dao.idCheck(accId);
		log.info("cnt : " + cnt);
		return cnt;
	}

	/*
	 * 아이디 찾기
	 */
	@Override
	public String find_id(String phoneNum) {
		log.info("serviceImpl "+phoneNum);
		String result = "";
		
		try {
		 result= dao.find_id(phoneNum);
		 log.info("serviceImpl result : {}", result);
		 
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return result ;
	}
	@Override
	public String accountRegPhone(String phoneNum) {
		log.info("serviceImpl reg"+phoneNum);
		String result = "";
		
		try {
			result= dao.accountRegPhone(phoneNum);
			log.info("serviceImpl result reg: {}", result);
			
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return result ;
	}

	/**
	 * 비밀번호 찾기 메일 발송
	 */
	@Override
	public void sendEmail(AccountSignVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; 
		String hostSMTPid = "rest4trip@gmail.com";
		String hostSMTPpwd = "vgdbeumchywitjju";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "rest4trip@gmail.com";
		String fromName = "rest4trip 여정";
		String subject = "";
		String msg = "";
		

		if(div.equals("updatePw")) {
			
			subject = "rest4Trip '여정' 비밀번호 입니다.";
			msg = "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getAccId() + " 님의 임시 비밀번호 입니다. <br>로그인 후 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getAccPw() ;
			msg += "</p></div>";
			
		}

		// 받는 사람 E-Mail 주소
		String mail = "";
		if(vo.getSumMail() == null){
			log.info("이메일 발송 실패");
		}else {
			mail = vo.getSumMail();
			log.info("이메일 발송 성공" );
		}

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); 

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			log.info("발송실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findPw(HttpServletResponse resp, AccountSignVO vo) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		// 가입된 아이디가 없으면
		if(dao.idCheck(vo.getAccId()) == 0) {
			log.info("등록되지 않은 아이디");
		}else {
			// 임시 비밀번호 생성
			String pw ="";
			String st[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M"
						  ,"N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
						  ,"a","b","c","d","e","f","g","h","i","j","k","l","m"
						  ,"n","o","p","q","r","s","t","u","v","w","x","t","z"
						  ,"1","2","3","4","5","6","7","8","9","0"};
			Random r = new Random();
			for(int i=1; i<=16; i++) {
				
				pw += st[r.nextInt(62)];
			}
			log.info("랜덤값 : " + pw);
			// 비밀번호 변경
			vo.setAccPw(pw);
			log.info("vo값 : " + vo);
			// 변경된 비밀번호 불러오기
			dao.findPw(vo);
			log.info("vo?");
			
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "updatePw");
			log.info("이메일로 임시비밀번호를 발송함");

			String encPassword = passwordEncoder.encode(vo.getAccPw());
			log.info("encPw : " + vo);
			vo.setAccPw(encPassword);
			log.info("encPw change : " + encPassword);
			dao.findPw(vo);
			log.info("change secc Pw : " + vo);
		}
	}
}
