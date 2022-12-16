package kr.or.ddit.listener;

import javax.servlet.ServletContext;

import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CustomEventListener {
	private ServletContext application;

	@EventListener(ContextRefreshedEvent.class)
	public void eventListener(ContextRefreshedEvent event) {
		WebApplicationContext context = (WebApplicationContext) event.getApplicationContext();
		if (application == null)
			application = context.getServletContext();
		application.setAttribute("cPath", application.getContextPath());
		log.info("컨텍스트 refresh : {} \n cPath : {}", context, application.getContextPath());
	}
}
