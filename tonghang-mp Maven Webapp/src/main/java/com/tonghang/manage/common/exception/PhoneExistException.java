package com.tonghang.manage.common.exception;

public class PhoneExistException extends BaseException{

	public String message = "该手机号已存在";
	public int code = 511;
	
	public PhoneExistException(){
		super();
	}
	public PhoneExistException(String message){
		super(message);
	}
	
	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return message;
	}
	
	public int getCode(){
		return code;
	}
}

