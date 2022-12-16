package kr.or.ddit.comply.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.comply.service.complyService;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.ComplyVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProfileImageVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/mypage/member/personal")
public class ComplyController {
	@Inject
	private complyService cpService;
	
	//
	public void setService(complyService cpService) {
		this.cpService = cpService;
	}

/*=============================================================================================
		<동행목록 관리> 아이디 목록을 볼 수 잇다.	
=============================================================================================*/
	
	@RequestMapping("/complybook")
	public String complybook(Model model
			, @AuthenticationPrincipal AccountVOWrapper accountWrapper
			, @AuthenticationPrincipal(expression="realUser") AccountVO account
			, @RequestParam(name="complyState", required=false, defaultValue="P") String complyState
			) {
		String viewName="";
		// 세션에 있는 인증객체를 AccountVO로 저장
				AccountVO test1 = accountWrapper.getRealUser();
												
				// AccountVO에 저장된 ID를 userId에 저장.
				String memId = test1.getAccId();
		

		
		ComplyVO vo=new ComplyVO();
		vo.setMemId(account.getAccId());
		
		if("P".equals(complyState)) {
			vo.setComplyState(complyState);
			List<ComplyVO> complyVOPostList =cpService.selectPostComplyViewList(vo);
			model.addAttribute("complyVOPostList", complyVOPostList);
			viewName="myPage/member/personal/complybook";
			
		}else{
			vo.setComplyState("C");
			List<ComplyVO> complyVOList =cpService.selectPostComplyViewList(vo);
			model.addAttribute("complyVOList", complyVOList);
			viewName="myPage/member/personal/complycomplete";
		}
		return viewName;
	}
	
/*=============================================================================================
 		<동행예정> 해당아이디의 상세정보를 볼 수 있다.	
 =============================================================================================*/
	@RequestMapping("/ComplyDetailView")
	public String complyDetailView(
			@AuthenticationPrincipal AccountVOWrapper accountWrapper
			, @AuthenticationPrincipal(expression="realUser") AccountVO account
			, Model model
			, @RequestParam(required=true) String what
			
			) {
		PersonalMemberVO complyDetail=cpService.ComplyDetailView(what);
		complyDetail.setMemId(what);
		
		ProfileImageVO imgInfoVO = cpService.complyProfileImage(what);
		
		model.addAttribute("imgInfoVO", imgInfoVO);
		model.addAttribute("complyDetail", complyDetail);

		return "popUp/complyDetailView";
	}
/*=============================================================================================
		<동행완료> 해당아이디의 상세정보를 볼 수 있다.	
=============================================================================================*/
	
//	@RequestMapping(value="/ComplyCompleteScore")
//	@GetMapping
	@RequestMapping(value="/ComplyCompleteScore", method=RequestMethod.GET)
	public String complyCompleteScoreView(
			  Model model
			, @RequestParam(required=true) String what1
			) {
		
		
		ProfileImageVO imgInfoVO = cpService.complyProfileImage(what1);

		model.addAttribute("imgInfoVO", imgInfoVO);
	
		
		PersonalMemberVO complyScore=cpService.ComplyDetailView(what1);
		complyScore.setMemId(what1);
		

		model.addAttribute("complyScore", complyScore);

		return "popUp/complyCompleteScore";
	}
	@RequestMapping(value="/ComplyCompleteScore", method=RequestMethod.POST)
	//@PostMapping
	public String complyCompleteScoreUpdate(
			@AuthenticationPrincipal AccountVOWrapper accountWrapper
			, @AuthenticationPrincipal(expression="realUser") AccountVO account
			,@ModelAttribute("complyScore") PersonalMemberVO memberVO
			, Model model
			, @RequestParam(name="what1",required=true) String complyId
			, @RequestParam(name="what2",required=true) String compSdate
			) {
		memberVO.setMemId(complyId);
		String viewName="";
		AccountVO test1 = accountWrapper.getRealUser();
		
		// AccountVO에 저장된 ID를 userId에 저장.
		String memId = test1.getAccId();
		int saveDegree=0;
		
		
		
		
		
		
		ComplyVO complyCheckVO=new ComplyVO();
		//동행자 온도 준 내역 업데이트 처리
		String strMemDegree=memberVO.getMemDegree();
		complyCheckVO.setMemId(memId);
		complyCheckVO.setComplyId(complyId);
		complyCheckVO.setComplySdate(compSdate);
		String complyCheck=cpService.findComplyCheck(complyCheckVO);
		
		ComplyVO complyVO=new ComplyVO();
		if(complyCheck.equals("N")) {
			int rowcnt=cpService.updateUserDegree(memberVO);
			if(rowcnt>0) {
				complyVO.setMemId(memId);
				complyVO.setComplyId(complyId);
				complyVO.setComplyCheck("Y");
				complyVO.setComplySdate(compSdate);
				complyVO.setComplyDegree(strMemDegree);
				saveDegree=cpService.updateDegreeRecord(complyVO);
				if(saveDegree>0) {
					viewName="popUp/complyCompleteScore";					
				}else {
					viewName="popUp/complyCompleteScore";
					saveDegree=0;
				}
			}else {
				viewName="popUp/complyCompleteScore";
				saveDegree=0;
			}
		}else {
			viewName="popUp/complyCompleteScore";
			saveDegree=0;
		}
		model.addAttribute("saveDegree", saveDegree);
		return viewName;
	}			
}
