package kr.or.ddit.vo;

import java.io.File;
import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import org.apache.commons.io.FileUtils;
import java.util.UUID;

@Data
@ToString(exclude="adaptee")
@NoArgsConstructor
public class ProdImageVO {
	private MultipartFile adaptee;
	
	public ProdImageVO(MultipartFile adaptee) {
		super();
		this.adaptee = adaptee;
		this.pImgOname = adaptee.getOriginalFilename();
		this.pImgName = UUID.randomUUID().toString();
		this.pImgExnam = adaptee.getContentType();
		this.pImgSize = adaptee.getSize();
		this.pImgFSize = FileUtils.byteCountToDisplaySize(pImgSize);
		this.pImgLocat="/resources/file/prod";
	}
	
	private Integer prodNum;
	@NotBlank
	private String pImgName;
	@NotBlank
	private String pImgOname;
	private String pImgExnam;
	@NotNull
	private Long pImgSize;
	@NotBlank
	private String pImgFSize;
	@NotBlank
	private String pImgLocat;
	
	public void saveTo(File saveFolder) throws IOException {
		if(adaptee==null) return;
		File saveFile= new File(saveFolder, pImgName);
		adaptee.transferTo(saveFile);
	}
}
