package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.member.personal.dao.ProfileImageDAO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@EqualsAndHashCode(of = "memId")
public class PersonalMemberVO {
	@NotBlank
	private String memId;
	@NotBlank
	private String memKln;
	@NotBlank
	private String memKfn;
	private String memEln;
	private String memEfn;
	@NotBlank
	private String memNick;
	@NotBlank
	private String memBirth;
	@NotBlank
	private String memNat;
	@NotBlank
	private String memGend;
	private String memHphon;
	@NotBlank
	private String memPhon;
	@NotBlank
	private String memMail;
	@NotBlank
	private String memAddr;
	@NotBlank
	private String memDaddr;
	@NotBlank
	private String memCons;
	private String accIntro;
	@NotBlank
	private String memLogin;
	private String memGrade;
	private String memEval;
	private int memMil;
	private String memDegree="0";

}

