package kr.or.ddit.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

public class AccountVOWrapper extends User{
	private AccountVO realUser;

	public AccountVOWrapper(AccountVO realUser) {
		super(realUser.getAccId(), realUser.getAccPw()
				, AuthorityUtils.createAuthorityList(realUser.getMemCode()));
		this.realUser = realUser;
	}
	
	public AccountVO getRealUser() {
		return realUser;
	}
}
