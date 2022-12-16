package kr.or.ddit.report.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ReportVO;

@Mapper
public interface ReportDAO {
	
	/**
	 * 신고글 추가하기
	 * @param report
	 * @return
	 */
	public int insertReport(ReportVO report);
}
