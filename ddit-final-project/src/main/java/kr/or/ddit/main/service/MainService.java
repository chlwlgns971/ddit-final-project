package kr.or.ddit.main.service;

import kr.or.ddit.vo.MainVO;

public interface MainService {
	/**
	 * 메인페이지에 필요한 정보를 가져오는 서비스
	 * @return
	 */
	public MainVO getMainInfo();
}
