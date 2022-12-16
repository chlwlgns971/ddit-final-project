package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProdWishVO {
	@NotNull(groups = {InsertGroup.class, DeleteGroup.class})
	private Integer cinfNum;
	@NotBlank(groups = {InsertGroup.class, DeleteGroup.class})
	private String memId;
}
