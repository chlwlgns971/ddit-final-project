package kr.or.ddit.exception;

public class PKNotFoundException extends RuntimeException{

	public PKNotFoundException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PKNotFoundException(String pk, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(String.format("%s 에 해당하는 데이터 없음.", pk), cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public PKNotFoundException(String pk, Throwable cause) {
		super(String.format("%s 에 해당하는 데이터 없음.", pk), cause);
		// TODO Auto-generated constructor stub
	}

	public PKNotFoundException(String pk) {
		super(String.format("%s 에 해당하는 데이터 없음.", pk));
	}
	public PKNotFoundException(int pk) {
		super(String.format("%s 에 해당하는 데이터 없음.", pk));
	}

	public PKNotFoundException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
}
