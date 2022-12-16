package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProdVO  {
	@NotNull(groups = {UpdateGroup.class, DeleteGroup.class})
	private Integer prodNum;
	private String prodNam;
	private Integer prodQty;
	private String prodCode;
	private Integer cinfoNum;
	@NotBlank(groups = {InsertGroup.class})
	private String areaCode;
	@NotBlank(groups = {InsertGroup.class})
	private String comId;
	private String prodImg;
	private String areaName;
	private String pCode;
	
	// 생 이미지가 담긴 리스트 (날 것의 이미지 파일)
	@JsonIgnore
	private transient List<MultipartFile> prodImages;
	public void setProdImages(List<MultipartFile> prodImages) {
		if(prodImages==null || prodImages.isEmpty()) return;
		this.prodImages = prodImages;
		this.prodImageList = new ArrayList<>();
		for(MultipartFile file  : prodImages) {
			if(file.isEmpty()) continue;
			prodImageList.add(new ProdImageVO(file));
		}	
	}
	@JsonIgnore
	private transient int startNo;
	
	// 상품 이미지로 꾸며준 이미지파일정보가 담긴 리스트
	@JsonIgnore
	private transient List<ProdImageVO> prodImageList;
	private List<ProdVO> prodList;
	@JsonIgnore
	private transient String[] delProdImageName;
	
}
