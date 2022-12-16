package kr.or.ddit.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "accId")
@ToString(exclude = { "accPw" })
public class AccountVO implements Serializable {
	
	@NotBlank
	@Size(min = 4, max = 12)
	private String accId;
	@NotBlank
	@Size(min = 8, max = 16)
	private transient String accPw;
	@NotBlank
	private String accRdate;
	@NotBlank
	private String accStat;
	@NotBlank
	private String memCode;
	private String accIntro;
	private String accImg;
	
	@JsonIgnore
	private MultipartFile multipartImage;
	
	public void setMultipartImage(MultipartFile multipartImage) {
		if (multipartImage == null || multipartImage.isEmpty())
			return;
		this.multipartImage = multipartImage;
		MultipartFile file = multipartImage;
		ProfileImageVO profileImageVO = new ProfileImageVO(file);
	}
	
	
}
