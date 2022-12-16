package kr.or.ddit.vo;

import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class PagingVO<T> {
	
	public PagingVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}

	private int totalRecord;
	private int currentPage;
	private int screenSize=10;
	private int blockSize=5;
	private int totalPage;
	
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	
	private SearchVO simpleCondition;
	private T detailCondition;
	//호텔용 검색 조건 (MAP으로 만든 이유: 여러 테이블을 조인하기 때문에 한 VO 객체로 처리할 수 없음)
	private Map<String, Object> detailMap;
	
	private List<T> dataList;
	
	
	public void setDetailCondition(T detailCondition) {
		this.detailCondition = detailCondition;
	}
	
	public void setSimpleCondition(SearchVO simpleCondition) {
		this.simpleCondition = simpleCondition;
	}
	
	public void setDetailMap(Map<String, Object> detailMap) {
		this.detailMap = detailMap;
	}
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = (totalRecord+(screenSize-1)) / screenSize;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		endRow = currentPage * screenSize;
		startRow = endRow - (screenSize - 1);
		endPage = blockSize * ((currentPage + (blockSize - 1)) / blockSize);
		startPage = endPage - (blockSize - 1);
	}
	
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	private static final String PATTERN = "<li class='page-item'><a class='page-link' href='#' data-page='%d'>%s</a></li>";
	String curPattern = "<li class='page-item'><a class='page-link active' href='#' data-page='%d'>%s</a></li>";
	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();
		html.append("<nav aria-label='Page navigation'>");
		html.append("<ul class='pagination justify-content-center align-items-center'>");
		endPage = endPage > totalPage ?  totalPage : endPage;

		if((currentPage > startPage)) {
			html.append(
				String.format(PATTERN, currentPage-1, "<i class='fas fa-long-arrow-alt-left d-none d-md-inline-block me-md-1' aria-hidden='true'></i> Previous")	
			);
		}
		else html.append(
				String.format(PATTERN, 1, "<i class='fas fa-long-arrow-alt-left d-none d-md-inline-block me-md-1' aria-hidden='true'></i> Previous")	
			);
		
		for(int page = startPage; page <= endPage; page++) {
			if(page == currentPage) {
				html.append(String.format(curPattern, page,page));
			}else {
				html.append(
					String.format(PATTERN, page, page)
				);
			}
		}
		
		if(endPage > currentPage) {
			html.append(
				String.format(PATTERN, currentPage, "Next<i class='fas fa-long-arrow-alt-right d-none d-md-inline-block ms-md-1' aria-hidden='true'></i>")	
			);
		}
		else html.append(
				String.format(PATTERN, endPage+1, "Next<i class='fas fa-long-arrow-alt-right d-none d-md-inline-block ms-md-1' aria-hidden='true'></i>")	
			);
		html.append("</ul>");
		html.append("</nav>");
		return html.toString();
	}
	
	private static final String BLOGPATTERN1 = "<li><a href='#' data-page='%d'>%s</a></li>";
	String curBlogPattern1 = "<li class='active'><span data-page='%d'>%s</span></li>";
	public String getBlogPaging1() {
		StringBuffer html = new StringBuffer();
		html.append("<ul>");
		endPage = endPage > totalPage ?  totalPage : endPage;

		if(startPage > blockSize) {
			html.append(
				String.format(BLOGPATTERN1, startPage-blockSize, "&lt;")	
			);
		}
		
		for(int page = startPage; page <= endPage; page++) {
			if(page == currentPage) {
				html.append(String.format(curBlogPattern1, page,page));
			}else {
				html.append(String.format(BLOGPATTERN1, page, page));
			}
		}
		
		if(endPage < totalPage) {
			html.append(
				String.format(BLOGPATTERN1, endPage+1,"&gt;")	
			);
		}
		html.append("</ul>");
		return html.toString();
	}

	
}
