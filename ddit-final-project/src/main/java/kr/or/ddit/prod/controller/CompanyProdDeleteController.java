package kr.or.ddit.prod.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.prod.hotel.service.HotelService;
import kr.or.ddit.prod.rentcar.service.RentcarService;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.ProdImageVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller

@RequestMapping("/mypage/member/company/product")
public class CompanyProdDeleteController {
	@Inject
	private final ProdService pService;
	@Inject
	private final RentcarService rcService;
	
	@Inject
	private final HotelService hService;

	@Value("#{appInfo.prodImageFolder}")
	private String imageFolderURL;
	@Value("#{appInfo.prodImageFolder}")
	private Resource imageFolderRes;
	
	File getFileName;
	
	@PostMapping
	@RequestMapping("/rentCarDelete")
	public String deleteRentcarProd(
			@RequestParam(name = "prodNum", required = true) int prodNum
			,HttpServletRequest request
	) {
		
		List<ProdImageVO> deleteList=pService.retrieveProdImage(prodNum);
		int delImgcnt;
		int rentCar;
		int delProd;
		
		
		for(int i=0;i<deleteList.size();i++) {
			getFileName= new File(request.getSession().getServletContext().getRealPath(imageFolderURL)+ "/" + deleteList.get(i).getPImgName());
			getFileName.delete();
			delImgcnt=pService.deletePrImg(deleteList.get(i).getPImgName());
		}
		rentCar=rcService.deleteRentCar(prodNum);
		delProd=pService.deleteProd(prodNum);
		
		return "redirect:/mypage/member/company/product/list";
	}
	
	@PostMapping
	@RequestMapping("/HotelRoomDelete")
	public String deleteHotelProd(
			@RequestParam(name = "romNum", required = true) int romNum
			,HttpServletRequest request
	) {
		
		List<ProdImageVO> deleteList=pService.retrieveProdImage(romNum);
		int delImgcnt;
		int hotel;
		int delProd;
		
		
		for(int i=0;i<deleteList.size();i++) {
			getFileName= new File(request.getSession().getServletContext().getRealPath(imageFolderURL)+ "/" + deleteList.get(i).getPImgName());
			getFileName.delete();
			delImgcnt=pService.deletePrImg(deleteList.get(i).getPImgName());
		}
		hotel=hService.deleteHotel(romNum);
		delProd=pService.deleteProd(romNum);
		
		return "redirect:/mypage/member/company/product/list";
	}
}
