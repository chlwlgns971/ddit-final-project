package kr.or.ddit.prodwish.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.prodwish.dao.ProdWishDAO;

@Service
public class ProdWishServiceImpl implements ProdWishService {
	@Inject
	private ProdWishDAO dao;

//	@Override
//	public ServiceResult addItemToWish(int cinfoNum, String memId) {
//		Map<String, Object> map = new HashMap<>();
//		map.put("cinfoNum", cinfoNum);
//		map.put("memId", memId);
//
//		ServiceResult result = (dao.insertItemToWish(map) > 0) ? ServiceResult.OK : ServiceResult.FAIL;
//		return result;
//	}

	@Override
	public int addItemToWish(Map<String, Object> map) {
		int cinfoNum = (int) map.get("cinfoNum");
		int cnt = 0;
		// 해당 상품이 위시리스트에 들어있는지 
		return 0;
	}

	@Override
	public int checkInWish(int cinfoNum, String memId) {
		Map<String, Object> map = new HashMap<>();
		map.put("cinfoNum", cinfoNum);
		map.put("memId", memId);
		return dao.checkInWish(map);
	}




	
}
