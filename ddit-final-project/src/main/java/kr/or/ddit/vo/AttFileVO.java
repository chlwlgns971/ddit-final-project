package kr.or.ddit.vo;

import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="afileName")
@ToString(exclude="adaptee")
@NoArgsConstructor
public class AttFileVO {
	private MultipartFile adaptee;
	
	public AttFileVO(MultipartFile adaptee) {
		super();
		this.adaptee = adaptee;
		this.afileName = UUID.randomUUID().toString();
		this.afileName = adaptee.getOriginalFilename();
		this.afileSize = adaptee.getSize();
		this.afileFsize = FileUtils.byteCountToDisplaySize(afileSize);
	}
	@NotBlank
	private String afileName;
	@NotBlank
	private String afileOname;
	@NotNull
	private long afileSize;
	@NotBlank
	private String afileFsize;
	private Integer postNum;
	private Integer artNum;
	private String afileId;
	private String afileLocat;
	private String afileDate;
}
