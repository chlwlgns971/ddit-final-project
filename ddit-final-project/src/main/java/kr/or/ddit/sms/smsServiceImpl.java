package kr.or.ddit.sms;

import java.util.HashMap;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class smsServiceImpl implements smsService{
	

	/* 
	 * 인증번호 /아이디 찾기 문자 발송
	 */
	String api_key = "<api키>";
	String api_secret = "<api키>";

	@Override
	public void certifiedPhoneNumber(String phoneNumber, String numStr) {
	    Message coolsms = new Message(api_key, api_secret);
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);	// 수신전화번호
	    params.put("from", "<발신번호>");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "rest4Trip 인증번호는 [" + numStr + "]"+ "입니다.");
	    params.put("app_version", "test app 1.2"); // application name and version
	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
//	    System.out.println("service Impl" + phoneNumber);
//	    System.out.println("service Impl" + numStr);
	}
}