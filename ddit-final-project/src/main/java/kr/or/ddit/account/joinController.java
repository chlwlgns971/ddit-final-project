package kr.or.ddit.account;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.account.dao.AccountSignDAO;
import kr.or.ddit.account.service.AccountSignupService;
import kr.or.ddit.sms.smsService;
import kr.or.ddit.vo.AccountSignVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/AccLoginn")
public class joinController {
	
	/**
	 * 비밀번호 암호화
	 */
	@Autowired
	PasswordEncoder passwordEncoder;
	
	/**
	 * DAO 연결 
	 */
	@Autowired
	AccountSignDAO asDao;
	
	/**
	 * service 연결
	 */
	@Autowired
	AccountSignupService ass;
	
	/**
	 * 문자발송
	 */
	@Inject
	smsService service;
	
	/**
	 * 아이디 찾아서 출력하기
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/finallyFindId.do", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, String> find_id(String phoneNum) {
		log.info("아이디찾기 진입");
//		log.info(phoneNum);
	String result = ass.find_id(phoneNum);
	
	if(result == null) {
		result = "존재하지 않는 회원이거나, 회원 정보확인이 필요합니다.";
	}else {
		result = "가입하신 ID는 [ " + result + " ] 입니다.";
	}
//	log.info("josinController result : {}", result);
	
	Map<String, String> map =new HashMap<String, String>();
	map.put("result", result);
	return map;
	}
		
	/**
	 * 아이디 중복검사
	 * @param accId
	 * @throws Exception
	 */
	@PostMapping(value = "/idCheck", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String idCheck(@RequestBody Map<String, String> idObj) {
		
		log.info("idCheck() 진입");
		int cnt = ass.idCheck(idObj.get("id"));
		
		System.out.println(cnt);
		return  Integer.toString(cnt);
	}
	
	@ModelAttribute("AccountSignUpVO")
	public AccountSignVO signUp() {
		return new AccountSignVO();
	}
	
	/**
	 * 일반회원 가입양식
	 * @return
	 */
	@RequestMapping(value="/signupIndividual.do")
	public String signupIndividual() {
		log.info("일반회원가입");
		return "AccLoginn/signup/signupIndividual";
	}
	
	/**
	 * 일반회원가입 코드
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/accountSign.do", method=RequestMethod.POST)
	public String accountRegPOST(@ModelAttribute("AccountSignUpVO") AccountSignVO account) throws Exception{
		log.info("AccountSignVO : {}" , account);
		String encPassword = passwordEncoder.encode(account.getAccPw());
		account.setAccPw(encPassword);
		asDao.accountReg(account);
//		ass.accountReg(account);
		
		log.info("일반회원 가입성공");
		
		return "redirect:/";
	}
	
	/**
	 * 사업자 회원 가입 양식
	 * @return
	 */
	@RequestMapping(value="/signupBusiness.do")
	public String signupBusiness() {
		log.info("사업자회원가입");
		return "AccLoginn/signup/signupBusiness";
	}
	
	/**
	 * 일반회원가입 코드
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/accountBisSign.do", method=RequestMethod.POST)
	public String accountRegBisPOST(@ModelAttribute("AccountSignUpVO") AccountSignVO account) throws Exception{
		log.info("AccountSignVO : {}" , account);
		String encPassword = passwordEncoder.encode(account.getAccPw());
		account.setAccPw(encPassword);
		asDao.accountBisReg(account);
//		ass.accountBisReg(account);
		
		log.info("사업자회원 가입성공");
		
		return "redirect:/";
	}
	
	/**
	 * 약관동의
	 * @return
	 */
	@RequestMapping(value="/signup.do")
	public String joinAgreeRegister() {
		log.info("약관동의");
		return "AccLoginn/signup/Agreetoterms";
	}
	
	/**
	 * 아이디 찾기
	 * @return
	 */
	@RequestMapping(value="/forgotId.do")
	public String forgotId() {
		log.info("아이디찾기");
		return "AccLoginn/forgot/forgotId";
	}
	
	/**
	 * 비밀번호 찾기 모달페이지
	 * @return
	 */
	@GetMapping (value="/forgotPw.do")
	public String forgotPw() throws Exception{
		log.info("비밀번호찾기");
		return "AccLoginn/forgot/forgotPw";
	}
	
	/**
	 * 비밀번호 찾기 기능
	 * @param vo
	 * @param resp
	 * @throws Exception
	 */
	@PostMapping (value = "/findPw.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public void findPwPost(@RequestBody AccountSignVO pwObj, HttpServletResponse resp) throws Exception{
		log.info("비밀번호찾기 아이디 입력 : " + pwObj);
		ass.findPw(resp, pwObj);
		
	}

	/**
	 * 메일발송을 위한 의존성 주입
	 */
	@Autowired
	private JavaMailSender mailSender;
	/**
	 * email 인증
	 * @param email
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value="/mailCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + email);
		// 인증번호 난수 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		log.info("인증번호 생성 " + checkNum);
		
		String setFrom = "rest4trip@gmail.com";
		String toMail  = email;
		String title   = "Rest 4 Trip '여정' 입니다.";
		String content = "Rest 4 Trip '여정' 입니다."
					   + "<br><br>"
					   + "요청하신 인증번호는 "
					   + "[" 
					   + checkNum
					   + "]"
					   + " 입니다."
					   + "<br><br>"
					   + "해당 인증번호를 기입하여 주시기 바랍니다.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}		
			String num = Integer.toString(checkNum);
			return num;
	}
	
	/**
	 * 문자발송
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/smsForm")
	public String smsForm() throws Exception {
		log.info("문자인증요청");
		return "AccLoginn/forgot/forgotSms";
	}

	@RequestMapping(value = "/message", method = {RequestMethod.POST} , produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String sendSMS(String phoneNum) throws Exception {
		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		log.info("문자인증 랜덤값 발생");
		System.out.println("controller : "+ phoneNum);
		System.out.println("controller : "+ numStr);
		
		service.certifiedPhoneNumber(phoneNum, numStr);

		return numStr;
	}

}