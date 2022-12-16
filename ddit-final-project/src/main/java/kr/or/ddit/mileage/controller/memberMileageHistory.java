package kr.or.ddit.mileage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.mileage.service.mileageService;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.SearchVO;
import kr.or.ddit.vo.UseMileageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/member/personal/mileage")
public class memberMileageHistory {
	@Inject
	private mileageService mlService;

	
	
	@GetMapping
	public String mileageHistory(Model model, @AuthenticationPrincipal AccountVOWrapper accountWrapper,
			@AuthenticationPrincipal(expression = "realUser") AccountVO account
			,@ModelAttribute("simpleCondition") SearchVO simpleCondition
			,@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage
			) {
		
		PagingVO<UseMileageVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		
		// 세션에 있는 인증객체를 AccountVO로 저장
		AccountVO test1 = accountWrapper.getRealUser();
		// AccountVO에 저장된 ID를 userId에 저장.
		String memId = test1.getAccId();
		
		Map<String, Object> detailMap = new HashMap<>();
		detailMap.put("memId", memId);
		pagingVO.setDetailMap(detailMap);
		
		int totalRecord = mlService.retrieveMLCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		log.info(memId);
		
		List<UseMileageVO> mileList=mlService.mileagetList(pagingVO);

		
		model.addAttribute("mileTempVO", mileList);
		model.addAttribute("pagingVO", pagingVO);
		
		return "myPage/member/personal/mileage";
	}

}
