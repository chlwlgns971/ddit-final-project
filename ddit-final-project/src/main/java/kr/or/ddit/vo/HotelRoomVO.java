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
public class HotelRoomVO extends ProdSearchVO{
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer romNum;
	private String romNam;
	private Integer romPrice;
	private String romExtnt;
	private String romBed;
	private String romGrade;
	private Integer romGuest;
	private String romBal="NO";
	private String romSho="NO";
	private String romAirc="NO";
	private String romRef="NO";
	private String romTv="NO";
	private String romHeat="NO";
	private String romInt="NO";
	private String romCof="NO";
	private String romPet="NO";
}
