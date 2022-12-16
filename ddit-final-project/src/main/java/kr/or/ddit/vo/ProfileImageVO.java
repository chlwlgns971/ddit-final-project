package kr.or.ddit.vo;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="accId")
@ToString(exclude="adaptee")
@NoArgsConstructor
public class ProfileImageVO {
	private MultipartFile adaptee;
	//이미지 등록 시 파일을 저장할 경로
	@Value("#{appInfo.attatchFolder}")
	private String filePath;
	
	public ProfileImageVO(MultipartFile adaptee) {
		super();
		this.adaptee = adaptee;
		this.imgONam= adaptee.getOriginalFilename();
		this.imgNam= UUID.randomUUID().toString();
		this.imgExnam = adaptee.getContentType();
		this.imgSize = adaptee.getSize();
		this.imgFsize = FileUtils.byteCountToDisplaySize(imgSize);
		this.imgLocat =filePath;
	}

	
	@NotNull
	private String accId;
	@NotBlank
	private String imgNam;
	@NotBlank
	private String imgONam;
//	private String imgLocat;
	private String imgExnam;
	@NotNull
	private long imgSize;
	@NotBlank
	private String imgFsize;
	@NotBlank
	private String imgLocat;
	
	public boolean saveTo(File saveFolder) throws IOException {
		if(adaptee==null) return false;
		File saveFile= new File(saveFolder, imgNam);
		adaptee.transferTo(saveFile);
		return true;
	}
}
