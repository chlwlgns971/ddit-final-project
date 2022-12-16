package kr.or.ddit.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/admin")
public class AdminPage {
	
	
	
	
	
	
	@RequestMapping("/chartView")
	public String chartView() {
		return "adminPage/chartView";
	}
}
