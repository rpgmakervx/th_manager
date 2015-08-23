package com.tonghang.manage.isolate.pojo;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.tonghang.manage.common.util.TimeUtil;


/**
 * 
 * @author Administrator
 *封号日志信息包括： id 管理员id(admin_id) 被封用户id(client_id) 
 *封号操作时间(operated_time) 启封时间(begin_time) 结束时间(end_time)
 */
@Component("isolateLog")
public class IsolateLog {
	public static final boolean ISOLATE = true;
	public static final boolean DEISOLATE = false;
	
	private int id;
	private String admin_id;
	private String client_id;
	private Date operated_time;
	private Date begin_time;
	private Date end_time;
	private String reason;

	
	public String get_format_operated_time(){
		return TimeUtil.getFormatStringDate(operated_time);
	}
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public Date getOperated_time() {
		return operated_time;
	}
	public void setOperated_time(Date operated_time) {
		this.operated_time = operated_time;
	}
	public Date getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(Date begin_time) {
		this.begin_time = begin_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	
}
