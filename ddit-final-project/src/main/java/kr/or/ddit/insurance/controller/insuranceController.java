package kr.or.ddit.insurance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.insurance.charge.service.ChargeService;
import kr.or.ddit.insurance.cusinfo.service.CusInfoService;
import kr.or.ddit.insurance.insinfo.service.InsInfoService;
import kr.or.ddit.insurance.proinfo.service.ProInfoService;
import kr.or.ddit.insurance.reservation.service.ReservationService;
import kr.or.ddit.insurance.service.InsuranceService;
import kr.or.ddit.member.personal.service.PersonalMemberService;
import kr.or.ddit.vo.ChargeVO;
import kr.or.ddit.vo.CusInfoVO;
import kr.or.ddit.vo.InsInfoVO;
import kr.or.ddit.vo.InsuranceVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProInfoVO;
import kr.or.ddit.vo.ReservationVO;
import kr.or.ddit.vo.chargeAndResVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/insurance")
public class insuranceController {
	
	@Inject
	private ProInfoService service;
	@Inject
	private InsuranceService insuranService;
	@Inject
	private CusInfoService cusInsService;
	@Inject
	private InsInfoService insInfoService;
	@Inject
	private PersonalMemberService personService;
	
	
	private int prodNum;
	private int inserted = 0;
	
	
	@RequestMapping("/iForm")
	public String insuranceForm(
			Model model,
			@AuthenticationPrincipal User user,
			PersonalMemberVO mem
			) {
		List<ProInfoVO> list = service.retrieveProInfoList();
		log.info("list:{}",list);
		model.addAttribute("list",list);
		
		log.info("USER:{}", user);
		log.info("model:{}", model);
		if(user != null) {

			log.info("userId: {}",user.getUsername());
			mem = personService.retrievePersonalMember(user.getUsername());
			log.info("mem:{}",mem);
			model.addAttribute("mem", mem);
			log.info("MODEL:{}",model);
			
		}
		
		return "insurance/iForm";
	}
	
	@PostMapping(value="/dd",produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> dd(
		@RequestBody List<Map<String, Object>> listMap
			) {
		
		InsuranceVO insurance = new InsuranceVO();
		InsInfoVO insInfo = new InsInfoVO();
		CusInfoVO cusInfo = new CusInfoVO();
		
		log.info("listMap:{}", listMap);
		
		int j = 0;
		
		for(int i = 0; i<listMap.size(); i++) {
			
			log.info("list 순서 {} 번째", i);

			for(Entry<String, Object> elem : listMap.get(i).entrySet()) {
				log.info(String.format("키: %s, 값: %s", elem.getKey(), elem.getValue()));

				if(i<=1) {
					
				}else if(1< i && i<=3) {
					//2, 3번째는 수량과 총금액
					if( i % 2 == 0) {
						//수량
						int qty = Integer.parseInt(String.valueOf(elem.getValue()));
						insurance.setInsQty(qty);
					}
					else {
						//총금액
						int cost = Integer.parseInt(String.valueOf(elem.getValue()));
						insurance.setResCost(cost);
						//수량과 총금액 세팅한 후에 insert
						insuranService.createInsurance(insurance);
						prodNum = insuranService.retrieveMaxInsurance();
						
					}
				}else if(3<i && i<=39) {

					if(i % 2 == 0) {
						//보험상품상세 insert
						insInfo.setInsNum(prodNum);
						int num = Integer.parseInt(String.valueOf(elem.getValue()));
						insInfo.setPinfNum(num);
					}
					else {
						String code = String.valueOf(elem.getValue());
						insInfo.setPinCode(code);
						insInfoService.createInsInfo(insInfo);
						
					}
				}else if(39<i) {
					if(j == 0) {
						String name = String.valueOf(elem.getValue());
						cusInfo.setCusNam(name);
						j++;
					}else if(j == 1) {
						String birth = String.valueOf(elem.getValue());
						cusInfo.setCusBirth(birth);
						j++;
					}else if(j == 2) {
						String email = String.valueOf(elem.getValue());
						cusInfo.setCusEmail(email);
						j++;
					}else if(j == 3) {
						String phon = String.valueOf(elem.getValue());
						cusInfo.setCusPhon(phon);
						cusInfo.setInsNum(prodNum);
						cusInsService.createCusInfo(cusInfo);
						j = 0;
					}
				}
				
			}
		}
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("resultCode", "S");
		result.put("resultMessage", "보험상품이 선택되었습니다.");
		
		return result;
		
	}
	
	@Inject
	private ChargeService cService;
	
	@Inject
	private ReservationService rService;
	
	
	@RequestMapping("/insCheck")
	public ModelAndView insCheck(
			@ModelAttribute("charge") chargeAndResVO charge
			, @AuthenticationPrincipal User user
			) {
		ModelAndView mv = new ModelAndView();
		log.info("inserted처음:{}",inserted);
		
		if(inserted == 0) {
			log.info("charge: {}",charge);
			log.info("prodNum: {}",prodNum);
			log.info("memId:{}",charge.getMemId());
			ChargeVO cvo = new ChargeVO();
			ReservationVO rvo = new ReservationVO();
			
			
			cvo.setCharCode(charge.getCharCode());
			cvo.setCharPrice(charge.getCharPrice());
			log.info("cvo:{}",cvo);
			cService.createCharge(cvo);
			
			rvo.setResCode(charge.getResCode());
			rvo.setResSdate(charge.getResSdate());
			rvo.setResEdate(charge.getResEdate());
			rvo.setResQty(charge.getResQty());
			rvo.setProdNum(prodNum);
			charge.setProdNum(prodNum);
			log.info("memID:{}",charge.getMemId());
			if(user != null) {
				
				rvo.setMemId(user.getUsername());
			}else {
				rvo.setMemId(charge.getMemId());
			}
			rvo.setCharCode(charge.getCharCode());
			rvo.setProdPrice(charge.getCharPrice());

			log.info("rvo:{}",rvo);
			
			rService.createReservation(rvo);
			log.info("rService:{}", rService);
			inserted++;
			
			log.info("rvo:{}",rvo);
		}

		log.info("inserted마지막:{}",inserted);
		
		mv.addObject("charge", charge);
		mv.setViewName("insurance/insCheck");
		
		return mv;
	}
	
	
	
	
}
