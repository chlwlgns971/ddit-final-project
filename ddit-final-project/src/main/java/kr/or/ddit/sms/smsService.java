package kr.or.ddit.sms;


public interface smsService {

	   //인증번호 문자발송
	   void certifiedPhoneNumber(String phoneNumber, String numStr);
	   
	   //아이디찾기 문자 발송
//	   void passSms(String phoneNumber, String name);
}
