package kr.or.ddit.report.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.report.service.ReportService;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.ReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value="/report", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
public class InsertReportController {
	
	@Inject
	private ReportService service;
	
	// 신고글 Insert
	@PostMapping
	public Map<String,Object> insertReport(
			@Validated(InsertGroup.class) @ModelAttribute("report") ReportVO report 
			, BindingResult errors
			, Model model
			) {
		
		log.info("ReportInsertController reportVO:{}", report);
		Map<String, Object> result = new HashMap<>();
		if(!errors.hasErrors()) {
			result.put("result", service.createReport(report));
		}else {
			result.put("errors", errors.getFieldErrorCount());
		}
		return result;
	}

}
