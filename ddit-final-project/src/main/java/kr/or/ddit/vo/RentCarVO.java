package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RentCarVO extends ProdVO {
	@NotNull(groups = {UpdateGroup.class, DeleteGroup.class})
	private Integer prodNum;
	private String carKind="소형차";
	private Integer carPrice;
	private String carFuel="휘발유";
	private String carBrand="현대";
	private String carColor="빨강";
	private Integer carSeat=4;
	private String carHp="NO";
	private String carCharg="NO";
	private String carNavi="NO";
	private String carHolder="NO";
	private String carHeat="NO";
	private String carAc="NO";
	private String carGear="STICK";
	private String carBag="1";
	
	private Integer cinfoArate;
	private Integer revNum;
	
	private String resSdate;
	private String resEdate;
	private String cinfoTitle;
	private String comAddr;
	private String comLatit;
	private String comLngit;
	
	
	
	
	
	@JsonIgnore
	private transient List<MultipartFile> prodFiles;
	public void setProdFiles(List<MultipartFile> prodFiles) {
		if(prodFiles==null || prodFiles.isEmpty()) return;
		this.prodFiles = prodFiles;
		this.prodImageList = new ArrayList<>();
		for(MultipartFile file  : prodFiles) {
			if(file.isEmpty()) continue;
			prodImageList.add(new ProdImageVO(file));
		}
	}
	@JsonIgnore
	private transient int startNo;
	@JsonIgnore
	private transient List<ProdImageVO> prodImageList;
	@JsonIgnore
	private transient String[] delProdImageName;
}
