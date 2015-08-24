package com.tonghang.manage.common.exception;

public class BackupException extends BaseException{

	public int code = 510;
	public String message = "备份失败";
	
	public BackupException(){
		super();
	}
	public BackupException(String message){
		this.message = message;
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
