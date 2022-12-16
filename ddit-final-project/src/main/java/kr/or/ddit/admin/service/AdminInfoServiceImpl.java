package kr.or.ddit.admin.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.maven.doxia.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.admin.dao.AdminInfoDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.ImageVO;
import kr.or.ddit.vo.ProfileImageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminInfoServiceImpl implements AdminInfoService {
	
	@Inject
	private AdminInfoDAO dao;
	
	// 비밀번호 암호화
	@Autowired
	PasswordEncoder passwordEncoder;
	
	// 유저의 정보를 반환하는 메서드
	@Override
	public HashMap<String, Object> getUserInfo(String userId) {
		return dao.getUserInfo(userId);
	}

	// 유저의 PW를 반환하는 메서드
	@Override
	public String getUserPW(String userId) {
		return dao.getUserPW(userId);
	}
	
	// 해당 유저의 pw를 변경하는 메서드
	@Override
	public int setNewPassword(AccountVO accountEdit) {
		return dao.setNewPassword(accountEdit);
	}
	
	// 해당 유저의 소개글을 변경하는 메서드
	@Override
	public int setNewIntro(AccountVO accountEdit) {
		return dao.setNewIntro(accountEdit);
	}
	
	// 에러 발생 시 롤백 진행
	@Transactional(rollbackFor=Exception.class)
	@Override
	public ServiceResult updateAdminInfo(AccountVO account, String realFilePath) {
		// 유저 아이디 변수 선언
		String userId = account.getAccId();
		
		// 변경할 PW가 있다면 비밀번호 변경 실행
		// PW가 null이거나 ""이면
		
		if(null==account.getAccPw()||""==account.getAccPw()||account.getAccPw().length()<=1) {
			//비밀번호 변경 실행 안함.
			log.info("비밀번호 변경 안함: '{}'",account.getAccPw());
		}else {
			// 패스워드를 변경할 경우 패스워드 변경 사항 암호화
			account.setAccPw(passwordEncoder.encode(account.getAccPw()));
			log.info("update userPW: {}", account.getAccPw());
			// 패스워드 변경에 실패한 경우(결과가 1보다 작은 경우) 고의로 exception 발생 (rollback 위해)
			if(dao.setNewPassword(account)!=1) {
				try {
					Exception e = new Exception("패스워드 업데이트 중 오류 발생");
					throw e;
				} catch (Exception e) {
					log.info("예외 발생: {}",e.getMessage());
					return ServiceResult.FAIL;
				}
			}
		}
		//소개글 변경
		log.info("update intro:{}", account.getAccIntro());
		if(dao.setNewIntro(account)<1) {
			// 1보다 작다는 것은 실패한 것.
			try {
				Exception e = new Exception("소개글 업데이트 중 오류 발생");
				throw e;
			} catch (Exception e) {
				log.info("예외 발생: {}",e.getMessage());
				return ServiceResult.FAIL;
			}
		}
		if(null!=account.getMultipartImage()) {
			ProfileImageVO profileImg = new ProfileImageVO(account.getMultipartImage());
			// 프로필 이미지에 아이디 주입
			profileImg.setAccId(userId);
		
			// 파일 저장 위치 설정
			File save = new File(realFilePath);
			// 파일 삭제를 위한 경로 설정
			File realFile = new File(realFilePath+"/"+profileImg.getImgNam());
			// 프로필 이미지로 값이 넘어왔다면(파라미터로 받은 이미지 파일이 null이 아니라면)
			if(!"".equals(profileImg.getImgONam())) {
	
				log.info("profileImg original name: {}", profileImg.getImgONam());
				log.info("profileImg saveName: {}", profileImg.getImgNam());
				try {
					// 정상적으로 실행될 때 
					int oldImgCnt =  dao.getImageData(userId);
					// 기존 이미지 데이터가 있다면
					if(oldImgCnt>0) {
						// db에서 기존의 파일 메타데이터 삭제에 실패하면(결과가 1보다 작거나) 예외 발생
						if(dao.deleteImgdata(userId)<1) {
							try {
								Exception e = new Exception("기존 이미지 메타데이터 삭제 중 오류 발생");
								throw e;
							} catch (Exception e) {
								log.info("예외 발생: {}",e.getMessage());
								return ServiceResult.FAIL;
							}
						}
						// 메타데이터 삭제 시 실제 파일 삭제
						realFile.delete();
					}
					
					log.info("insert cont: {}",profileImg.toString());
					// 메타데이터  저장하고 
					if(dao.insertImgData(profileImg)<1) {
					// insert 실행 결과가 0이면 exception 발생
						try {
							Exception e = new Exception("프로필 이미지 메타데이터 등록 중 오류 발생");
							throw e;
						} catch (Exception e) {
							log.info("예외 발생: {}",e.getMessage());
							return ServiceResult.FAIL;
						}
						
					}
					// 계정에 이미지 정보 저장 (새로운 이미지명)
					account.setAccImg("/rest4Trip/resources/file/profile/"+profileImg.getImgNam());
					log.info("update cont: {}",account.toString());
					// update 실행 결과가 0이면 exception 발생
					if(dao.UpdateImgData(account)<1) {
						try {
							Exception e = new Exception("프로필 이미지 메타데이터 등록 중 오류 발생");
							throw e;
						} catch (Exception e) {
							log.info("예외 발생: {}",e.getMessage());
							return ServiceResult.FAIL;
						}
						
					}
					// 메타데이터가 잘 저장되었다면 파일명을 변경하고 실제 파일 저장
					profileImg.saveTo(save);
				} catch (IOException e) {
					log.info("예외 발생: {}",e.getMessage());
					return ServiceResult.FAIL;
				}
			}
		}

		return ServiceResult.OK;
	}

}
