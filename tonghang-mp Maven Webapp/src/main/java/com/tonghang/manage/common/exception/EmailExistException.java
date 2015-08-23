package com.tonghang.manage.common.exception;

public class EmailExistException extends BaseException{

	public String message = "该邮箱已存在";
	public int code = 512;
	
	public EmailExistException(){
		super();
	}
	public EmailExistException(String message){
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
