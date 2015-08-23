package com.tonghang.manage.common.exception;

public class EmailAndPhoneExistException extends BaseException{

	public String message = "该邮箱和手机号均已存在";
	public int code = 513;
	
	public EmailAndPhoneExistException(){
		super();
	}
	public EmailAndPhoneExistException(String message){
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
