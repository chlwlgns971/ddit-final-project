package kr.or.ddit.prodwish.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.prodwish.service.ProdWishService;
import kr.or.ddit.vo.ProdWishVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProdWishController {
	@Inject
	private ProdWishService service;


	//상품을 
//	@RequestMapping(value="/addItemToProdWish", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody
//	public Map<String, Object> addItemToWish(
//			@RequestParam(name="what", required=true) int cinfoNum, String memId
//			
//			){
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("cinfoNum", cinfoNum);
//		map.put("memId", memId);
//		log.info("위시리스트에 추가하려는 정보 확인용 map : {}",map);;
//		int count = service.;
//		
//		Map<String, Object> result = new HashMap<>();
//		result.put("count", count);
//		result.put("success",count >=0);
//		return result;
//	}
//	
	
	
	
}
