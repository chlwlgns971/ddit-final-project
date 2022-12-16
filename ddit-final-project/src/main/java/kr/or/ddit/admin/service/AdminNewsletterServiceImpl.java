package kr.or.ddit.admin.service;

import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.dao.AdminNewsletterDAO;
import kr.or.ddit.vo.MailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminNewsletterServiceImpl implements AdminNewsletterService {
	@Inject
	AdminNewsletterDAO dao;
	
	@Autowired
	JavaMailSender mailSender;
		
	@Value("${spring.mail.username}")
	String sendFrom;
	
	@Autowired 
	Environment env;
	
	
	@Override
	public String sendNewsletter(MailVO mailvo) {
		log.info("AdminNewsletterServiceImpl.sendNewsletter 진입");
		// 뉴스레터 수신 희망 목록 가져오기
		List<String> mailList = dao.mailList();
		log.info("수신 동의 이메일 수: {}", mailList.size());
		
		//성공 or 실패를 반환하기 위한 변수 (succCount/failCount)
		int succCount = 0;
		int failCount = 0;
		
		// for문으로 한 이메일마다 뉴스레터 전송 및 성공 여부 반환
		for(String address : mailList) {
			mailvo.setAddress(address);
			boolean result = sendMail(mailvo);
			if(result==true) {
				succCount++;
			}else {
				failCount++;
			}
			
		}
		// 성공 n건, 실패 m건 반환
		String resultMessage = String.format("메일 전송 결과: %d 성공, %d 실패.",succCount, failCount);
		log.info(resultMessage);
		
		return resultMessage;
	}

	@Override
	public boolean sendMail(MailVO sendMail){
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper message = new MimeMessageHelper(mimeMessage,true,"UTF-8");

				message.setTo(sendMail.getAddress());
				message.setFrom(sendFrom);	//env.getProperty("spring.mail.username")
				message.setSubject(sendMail.getTitle());
				message.setText(sendMail.getContent(), true); //true : html 형식 사용
					
//				//Mail에 img 삽입
//				ClassPathResource resource = new ClassPathResource("img 주소/img 이름.png");
//				message.addInline("img", resource.getFile());
			}
		};
			
		try{
			mailSender.send(preparator);
		} catch (MailException e){
			return false;
		}
		return true;
		
		
	}

}
