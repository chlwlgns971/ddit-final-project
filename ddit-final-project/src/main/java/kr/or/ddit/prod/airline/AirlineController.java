package kr.or.ddit.prod.airline;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.prod.rentcar.dao.RentcarDAO;
import kr.or.ddit.vo.CategoryVO;

@RequestMapping("/prod")
@Controller
public class AirlineController {
	@Inject 
	private RentcarDAO dao;
	
	//국가리스트 호출
	@ResponseBody
	@RequestMapping(value="/airline/country", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<CategoryVO> contriesList(
			Model model
			, @RequestParam(name="name") String continentName
			) {
		List<CategoryVO> nationsList = (List<CategoryVO>) dao.getNations(continentName);
		return nationsList;
	}

	//도시리스트 호출
	@ResponseBody
	@RequestMapping(value="/airline/city", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<CategoryVO> citiesList(
			Model model
			, @RequestParam(name="name") String countryName
			) {
		List<CategoryVO> citiesList = (List<CategoryVO>) dao.getcities(countryName);
		return citiesList;
	}
	//대륙리스트 호출
	@RequestMapping("/airline")
	public String continentsList(
			Model model
			) {
		List<CategoryVO> continentsList = (List<CategoryVO>) dao.getContinents();
		model.addAttribute("continentsList",continentsList);
	
		return "prod/airline";
	}

}
