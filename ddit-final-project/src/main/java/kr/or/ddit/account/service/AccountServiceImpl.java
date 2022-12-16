package kr.or.ddit.account.service;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import kr.or.ddit.account.dao.AccountDAO;
import kr.or.ddit.member.personal.dao.ProfileImageDAO;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.ProfileImageVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class AccountServiceImpl implements AccountService {
	private final AccountDAO accountDAO;
	private final ProfileImageDAO profileImageDAO;

	@Value("#{appInfo.attatchFolder}")
	private Resource attatchFolder;

	private File saveFolder;

	@PostConstruct
	private void init() throws IOException {
		saveFolder = attatchFolder.getFile();
	}

	@Override
	public AccountVO comparePswd(String accId) {
		AccountVO accountVO = accountDAO.searchAccountPswd(accId);
		return accountVO;
	}

	@Override
	public int AccoutUpdatePswd(AccountVO accountVO) {
		int rowcnt = accountDAO.updatePswd(accountVO);

		return rowcnt;
	}

	@Override
	public int updateAccInfo(AccountVO accountVO) {
		int rowcnt = accountDAO.updateAccInfo(accountVO);
		return rowcnt;
	}

	@Override
	public int updateAccountImageName(AccountVO accountVO) {
		int rowcnt = accountDAO.updateAccountImageName(accountVO);
		return rowcnt;
	}

	@Override
	public AccountVO selectAccount(String accId) {
		log.info("service ID: {}", accId);
		AccountVO accountVO = accountDAO.selectAccount(accId);
		return accountVO;
	}

	@Override
	public AccountVO selectAccInfo(String accId) {
		AccountVO accountVO = accountDAO.selectAccInfo(accId);
		return accountVO;
	}

	@Override
	public int insertImgInfo(ProfileImageVO profileImage) {
		int rowcnt=profileImageDAO.insertProfilImage(profileImage);
		return rowcnt;
	}

	@Override
	public ProfileImageVO retrieveImgInfo(String accId) {
		ProfileImageVO profileImageVO=profileImageDAO.retrieveImgInfo(accId);
		return profileImageVO;
	}

	@Override
	public int countProfileImage(String accId) {
		int rowcnt=profileImageDAO.countImageInfo(accId);
		return rowcnt;
	}

	@Override
	public int deleteProfilImage(String accId) {
		int rowcnt=profileImageDAO.deleteProfilImage(accId);
		return rowcnt;
	}

}
