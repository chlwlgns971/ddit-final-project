package kr.or.ddit.member.company.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.account.service.AccountService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.company.service.CompanyMemberService;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import kr.or.ddit.vo.CompanyMemberVO;
import kr.or.ddit.vo.PersonalMemberVO;
import kr.or.ddit.vo.ProfileImageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/member/company/companyMemberEdit")
public class CompanyMemberModify {
	@Inject
	private CompanyMemberService cmService;
	@Inject
	private AccountService acService;

	@Value("#{appInfo.attatchFolder}")
	private String imageFolderURL;
	@Value("#{appInfo.attatchFolder}")
	private Resource imageFolderRes;
	private File saveFolder;

	File save;
	File getFileName;

	@PostConstruct
	public void init() throws IOException {
		saveFolder = imageFolderRes.getFile();
		if (!saveFolder.exists())
			saveFolder.mkdirs();
	}

	@ModelAttribute("command")
	public String command() {
		return "UPDATE";
	}

	/*
	 * 
	 * =============================================================================
	 * ============================== 회원정보 보여주는 부분
	 * =============================================================================
	 * 
	 */
	@GetMapping
	public String companyMemberView(Model model, @AuthenticationPrincipal AccountVOWrapper accountWrapper,
			@AuthenticationPrincipal(expression = "realUser") AccountVO account) {

		// 인증객체에 멀티파트파일이미지 설정
		account.setMultipartImage(account.getMultipartImage());

		// 인증객체에 자기소개 설정
		account.setAccIntro(account.getAccIntro());

		// 세션에 있는 인증객체를 AccountVO로 저장
		AccountVO accountVO = accountWrapper.getRealUser();

		// AccountVO에 저장된 ID를 userId에 저장.
		String comId = accountVO.getAccId();

		// jsp에 전달할 객체구하기
		CompanyMemberVO memberVO = cmService.SelectCompanyMember(comId);
		ProfileImageVO imgInfoVO = acService.retrieveImgInfo(comId);
		AccountVO acc = acService.selectAccount(comId);
		String accImgName = acc.getAccImg();

		// model을 view에 던져줌
		model.addAttribute("accImgName", accImgName);
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("imgInfoVo", imgInfoVO);
		return "myPage/member/company/companyMemberEdit";
	}

	/*
	 * =============================================================================
	 * ============================== 포스트(수정) 부분
	 * =============================================================================
	 * 
	 */
	@PostMapping
	public String personalMemberModify(@ModelAttribute("memberVO") CompanyMemberVO companyMemberVO,
			@AuthenticationPrincipal AccountVOWrapper accountWrapper,
			@AuthenticationPrincipal(expression = "realUser") AccountVO account, Model model,
			HttpServletRequest request, String accIntro,
			@RequestPart(name = "multipartImage") MultipartFile multipartImage, HttpSession session)
			throws IOException {

		account.setAccIntro(account.getAccIntro());
		String viewName = null;
		String message = null;

		// 인증객체 가져옴
		AccountVO test1 = accountWrapper.getRealUser();

		// multiPartFile accImg를 넣어준다.
		account.setMultipartImage(multipartImage);

		// 인증객체의 ID와 personalMemberVO(수정하고자하는 정보)의 ID 일치 여부 확인
		// 인증객체에서 ID 추출
		String comId = test1.getAccId();

		// 해당 ID CompanyMemberVO 객체에 주입
		companyMemberVO.setComId(comId);

		// 이미지의 존재여부와 이미지의 정보를 가져온다.
		int rowcnt = cmService.searchImage(comId);
		ProfileImageVO profImg = cmService.retrieveImgInfo(comId);

		// 자기소개 accInfo는 멤버 vo가 아닌 account테이블에서 수정이 일어 난다.
		test1.setAccIntro(accIntro);
		int accNum = acService.updateAccInfo(account);

		// 프로필 이미지 존재 확인을 위한 메소드
		int profileCount = acService.countProfileImage(comId);

		// 업데이트 후 반환되는 값을 받는 전역변수 선언
		int imgInsertNum = 0;
		int imgDeleteNum = 0;

		// 파일 저장 위치 설정
		if (rowcnt == 0) {
			save = new File(request.getSession().getServletContext().getRealPath(imageFolderURL));
		} else {
			save = new File(request.getSession().getServletContext().getRealPath(imageFolderURL));
			// 파일 삭제를 위한 경로 설정
			getFileName = new File(
					request.getSession().getServletContext().getRealPath(imageFolderURL) + "/" + profImg.getImgNam());
		}

		/*
		 * ======================================================================== 아무런
		 * 파일을 추가하지 않았을 경우
		 * ========================================================================
		 */
		// ProfileImageVO에서 새로운 이미지를 넣어준다
		ProfileImageVO profileImage = new ProfileImageVO(multipartImage);
		profileImage.setImgLocat(imageFolderURL);
		profileImage.setAccId(comId);
		
		//이미지를 넣었는지 확인한다.
		if (multipartImage.getSize()==0) {
			//자기소개를 수정한 경우
			if (accNum > 0) {
				// 수정한 거 던져주고 결과값 받기
				int result = cmService.updateCompanyMember(companyMemberVO);

				// alert나 아니면 문구 띄울 내용 담는 것. 활용 가능

				switch (result) {
				case 0:
					message = "개인회원 정보 수정 실패";
					break;
				case 1:
					message = "개인회원 정보 수정 성공";
					viewName = "myPage/member/company/companyMemberEdit";

					// 수정이 성공하고 나서의 뷰에 보내줄 객체를 찾는다.
					CompanyMemberVO memberVO = cmService.SelectCompanyMember(comId);
					AccountVO accountCompanyVO = acService.selectAccount(comId);


					profImg.setAccId(comId);
					
					String accImgName=account.getAccImg();

					// 객체를 뷰에 던져준다.
					model.addAttribute("accImgName", accImgName);
					model.addAttribute("accountVO", accountCompanyVO);
					model.addAttribute("memberVO", memberVO);
					model.addAttribute("profImg", profImg);

					break;
				default:
					break;
				}
				model.addAttribute("message", message);

			} 
			//자기소개를 수정하지 않은경우
			else {
			}

		}
		/*
		 * ======================================================================== 
		 * 파일을 추가했을 경우
		 * ========================================================================
		 */
		else {
			// <<<<<<<<<<<<<<<<<<<<기존에 파일이 존재하는 경우>>>>>>>>>>>>>>
			if (profileCount > 0) {
				// DB와 기존파일을 삭제한다.
				imgDeleteNum = acService.deleteProfilImage(comId);
				getFileName.delete();

				// 삭제가 성공했을 경우
				if (imgDeleteNum > 0) {
					// 새 이미지를 삽입한다.
					imgInsertNum = acService.insertImgInfo(profileImage);
					// 이미지를 폴더에 저장한다.
					if (imgInsertNum > 0) {
						profileImage.saveTo(save);
						int accImageNameNum = acService.updateAccountImageName(account);
					}
				} else {
					// 실패시 전달해줄 메세지
					message = "사진 수정에 실패 했습니다.";
				}
				// <<<<<<<<<<<<<<<<<<<<기존에 파일이 존재하지 않는 경우>>>>>>>>>>>>>>

			} else {
				// 새 이미지를 삽입한다.
				imgInsertNum = acService.insertImgInfo(profileImage);
				// 이미지를 폴더에 저장한다.
				profileImage.saveTo(save);
			}
			// <<<<<<<<<<<<<<<<<<<<기존에 파일이 존재하지 않는 종료>>>>>>>>>>>>>>
			// 수정한 거 던져주고 결과값 받기
			int result = cmService.updateCompanyMember(companyMemberVO);

			// alert나 아니면 문구 띄울 내용 담는 것. 활용 가능
			switch (result) {
			case 0:
				message = "개인회원 정보 수정 실패";
				break;
			case 1:
				message = "개인회원 정보 수정 성공";
				viewName = "myPage/member/company/companyMemberEdit";
				CompanyMemberVO memberVO = cmService.SelectCompanyMember(comId);

				ProfileImageVO imgInfoVO = acService.retrieveImgInfo(comId);
				
				imgInfoVO.setImgLocat(account.getAccImg());
				imgInfoVO.setAccId(comId);
				
				account.setAccImg("/rest4Trip"+imageFolderURL+"/"+imgInfoVO.getImgNam());
				log.info("accountVO getImgNam: {}",imgInfoVO.getImgNam());
				session.setAttribute("profileImg", account.getAccImg());
				log.info("accountVO getImgNam: {}",account.getAccImg());
				account.setAccId(comId);

				
				int imgUpdateNum = acService.updateAccountImageName(account);
				
				
				model.addAttribute("memberVO", memberVO);
				model.addAttribute("imgInfoVo", imgInfoVO);

				break;
			default:
				break;
			}
			
			String accImgName=account.getAccImg();
			
			// model을 view에 던져줌
			model.addAttribute("accImgName", accImgName);
			model.addAttribute("message", message);
		}

		// model로 view에 던져줌
		return viewName;
	}
}