package kr.or.ddit.admin.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.admin.service.AdminInfoService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AccountVO;
import kr.or.ddit.vo.AccountVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/admin")
public class AdminInfoController {
	
	@Inject
	private AdminInfoService service;
	
	//이미지 등록 시 파일을 저장할 경로
	@Value("#{appInfo.attatchFolder}")
	private String filePath;
	
	// 비밀번호 암호화
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@GetMapping("/editForm")
	public String adminEditForm(
		@AuthenticationPrincipal AccountVOWrapper accountWrapper
		,  @AuthenticationPrincipal(expression="realUser") AccountVO account
		, Model model
	){
		String viewName="";
		// 정보 수정을 위해 ID 추출
		String userId = account.getAccId();
		log.info("AdminInfoController.adminEditForm userID: {}", userId);
		HashMap<String, Object> vo = service.getUserInfo(userId);
		for ( String key : vo.keySet() ) {
		    log.info("key: {}, value: {}",key, vo.get(key));
		}
		System.out.println("=======================");
		model.addAttribute("account", vo);
		viewName = "adminPage/infoEdit";
		return viewName;
	}
	
	// 관리자 계정 패스워드 일치 여부 확인을 위한 메서드
	@ResponseBody
	@PostMapping(value="/match", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String adminEdit(
			@AuthenticationPrincipal AccountVOWrapper accountWrapper
			,  @AuthenticationPrincipal(expression="realUser") AccountVO account
			, @RequestParam(name="password") String password
	) {
		// 결과를 표시할 메시지
		String message = "";
		// 세션의 유저 id를 가져온다.
		String userId = account.getAccId();
		//userId와 일치하는 password를 가져온다.
		String userPW = service.getUserPW(userId);
		// 사용자가 입력한 pw와 db의 pw 비교
		// 같은 값이라면 변경 가능 메시지 반환
		if(passwordEncoder.matches(password, userPW)) {
			message="1";
		}else {
		//일치하지 않는 경우
			message="패스워드가 일치하지 않습니다.";
		}
		
		return message;
	}
	
	
	@PostMapping("/edit")
	public String adminInfoEdit(
		@ModelAttribute("accountVO") AccountVO accountEdit
		,Principal principal
		,@AuthenticationPrincipal AccountVOWrapper account
		, @RequestPart(name = "profileImg") MultipartFile multipartImage
		, RedirectAttributes ra
		, HttpServletRequest request
		, HttpSession session
	) {	
		
		//결과를 알릴 메시지 설정
		String message = "";
		
		// ID 세팅
		accountEdit.setAccId(principal.getName());
		log.info("set ID: {}",principal.getName());
		// 이미지 변경 사항을 vo 객체에 반영
		accountEdit.setMultipartImage(multipartImage);
		// 실제 서버 경로
		String realFilePath = request.getSession().getServletContext().getRealPath(filePath);
		log.info("real file path: {}",realFilePath);
		// service에 수정할 정보가 담긴 객체와 파일 저장 경로를 전달
		// 패스워드, 소개글, 프로필 이미지를 빠짐없이 업데이트한 경우 ok 반환
		ServiceResult result =  service.updateAdminInfo(accountEdit, realFilePath);
		
		
		if(result==ServiceResult.OK) {
			message = "개인정보가 성공적으로 변경되었습니다.";
		}else {
			message = "개인정보 변경을 실패했습니다. 다시 시도해주세요.";
		}
		session.setAttribute("profileImg", accountEdit.getAccImg());
		log.info("user Img: {}", accountEdit.getAccImg());
		ra.addFlashAttribute("message", message);
		
		return "redirect:/mypage/admin/editForm";
	}
	
//	@PostMapping("/edit")
//	public String adminInfoEdit(
//			@ModelAttribute("accountVO") AccountVO accountEdit
//			,Principal principal
//			,@AuthenticationPrincipal AccountVOWrapper account
//			, RedirectAttributes ra
//			) {	
//		int rowCnt = 0;
//		//ID 세팅
//		accountEdit.setAccId(principal.getName());
//		// 변경할 PW가 있다면 비밀번호 변경 실행
//		if(null==accountEdit.getAccPw()||""==accountEdit.getAccPw()) {
//			//비밀번호 변경 실행 안함.
//		}else {
//			if(service.setNewPassword(accountEdit)>0) {
//				rowCnt++;
//			}
//			
//		}
//		if(service.setNewIntro(accountEdit)>0) {
//			rowCnt++;
//		}
//		//결과를 알릴 메시지 설정
//		String message = "";
//		if(rowCnt==2) {
//			message = "개인정보가 성공적으로 변경되었습니다.";
//		}else if(rowCnt==1) {
//			message = "개인정보가 성공적으로 변경되었습니다.";
//		}else {
//			message = "개인정보 변경을 실패했습니다. 다시 시도해주세요.";
//		}
//		
//		ra.addFlashAttribute("message", message);
//		
//		return "redirect:/mypage/admin/editForm";
//	}
	
}
