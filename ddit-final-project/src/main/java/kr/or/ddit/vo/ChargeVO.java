package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode
public class ChargeVO  extends ReservationVO{
	@NotBlank
	private String charCode;
	@NotNull
	private Integer charPrice;
	@NotBlank
	private String charDate;
}
