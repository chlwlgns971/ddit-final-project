package kr.or.ddit.member.modal;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.account.service.AccountService;
import kr.or.ddit.member.company.service.CompanyMemberService;
import kr.or.ddit.member.personal.service.PersonalMemberService;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.CompanyMemberVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProfileImageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class myPageModal {
	@Inject
	private PersonalMemberService pmService;
	@Inject
	private CompanyMemberService cmService;
	@Inject
	private AccountService acService;
	

//	@Inject
//	public void setService(PersonalMemberService service) {
//		this.service = service;
//		log.info("주입 객체 kmb:{}",service.getClass().getName());
//	}
	@RequestMapping("/memberView")
	public String myPageModalView(Model model, @AuthenticationPrincipal AccountVOWrapper accountWrapper,
			@AuthenticationPrincipal(expression = "realUser") AccountVO account) {
		AccountVO test1 = accountWrapper.getRealUser();
		log.info("wrapper input : {}", test1.getAccId());
		log.info("expression input : {}", account.getAccId());
		
		String userId = test1.getAccId();
		PersonalMemberVO pmVO = pmService.retrievePersonalMember(userId);
		CompanyMemberVO cmVO=cmService.SelectCompanyMember(userId);
		
		ProfileImageVO imgInfoVO = acService.retrieveImgInfo(userId);
		
		model.addAttribute("cmVO", cmVO);
		model.addAttribute("pmVO", pmVO);
		model.addAttribute("imgInfoVO", imgInfoVO);

		return "/myPage/myPageModal";
	}
}
