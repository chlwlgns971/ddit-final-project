package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BlogCateVO {
	@NotBlank(groups= {UpdateGroup.class,DeleteGroup.class})
	private String blogId;
	@NotNull(groups= {UpdateGroup.class,DeleteGroup.class})
	private Integer bcateNum;
	@NotBlank(groups=UpdateGroup.class)
	private String bcateName;
	private String bcateImg;
	private String bcateImginfo;
	
	private MultipartFile bannerImg;
	
	public BlogCateVO(String blogId, Integer bcateNum, String bcateName, String bcateImg, String bcateImginfo) {
		super();
		this.blogId = blogId;
		this.bcateNum = bcateNum;
		this.bcateName = bcateName;
		this.bcateImg = bcateImg;
		this.bcateImginfo = bcateImginfo;
	}
}
