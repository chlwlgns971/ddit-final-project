package kr.or.ddit.report.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ReportVO;

public interface ReportService {
	public ServiceResult createReport(ReportVO report);
	
}
