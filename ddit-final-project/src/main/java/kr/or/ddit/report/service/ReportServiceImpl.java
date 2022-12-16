package kr.or.ddit.report.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.report.dao.ReportDAO;
import kr.or.ddit.vo.ReportVO;

@Service
public class ReportServiceImpl implements ReportService{

	@Inject
	private ReportDAO dao;
	
	@Transactional
	@Override
	public ServiceResult createReport(ReportVO report) {
		
		return dao.insertReport(report)> 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	

}
