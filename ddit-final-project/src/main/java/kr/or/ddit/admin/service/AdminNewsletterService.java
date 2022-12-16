package kr.or.ddit.admin.service;

import kr.or.ddit.vo.MailVO;


public interface AdminNewsletterService {
	//뉴스레터 전송 메서드
	public String sendNewsletter(MailVO mailvo);
	
	public boolean sendMail(MailVO sendMail);
}
