package kr.or.ddit.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 단순 키워드 검색에 활용.
 *
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class SearchVO {
	private String searchType;
	private String searchWord;
}

