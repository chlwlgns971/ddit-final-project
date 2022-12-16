package kr.or.ddit.prod.packageTrip;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.prod.packageTrip.service.PackageService;
import kr.or.ddit.vo.CategoryVO;

@Controller
@RequestMapping("/prod")
public class PackageController {
	@Inject
	private PackageService service;
	
	//대륙리스트 호출
		@RequestMapping("/packageList")
		public String continentsList(
				Model model
				) {
			List<CategoryVO> continentsList = (List<CategoryVO>) service.getContinents();
			model.addAttribute("continentsList",continentsList);
			return "prod/packageList";
		}
		//국가리스트 호출
		@ResponseBody
		@RequestMapping(value="/packageList/country", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
		public List<CategoryVO> contriesList(
				Model model
				, @RequestParam(name="name") String continentName
				) {
			List<CategoryVO> nationsList = (List<CategoryVO>) service.getNations(continentName);
			return nationsList;
		}
		
		//도시리스트 호출
		@ResponseBody
		@RequestMapping(value="/packageList/city", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
		public List<CategoryVO> citiesList(
				Model model
				, @RequestParam(name="name") String countryName
				) {
			List<CategoryVO> citiesList = (List<CategoryVO>) service.getcities(countryName);
			return citiesList;

	    }
	
	@PostMapping("/packageList")
	public String packageList() {
		return "prod/packageList";
		
	}
	@RequestMapping("/packageView")
	public String packageView() {
		return "prod/packageView";
		
	}
}
