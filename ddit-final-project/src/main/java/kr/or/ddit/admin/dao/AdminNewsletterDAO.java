package kr.or.ddit.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminNewsletterDAO {
	//뉴스레터 수신을 원하는 사람들의 이메일 목록 list로 반환
	public List<String> mailList();
}
