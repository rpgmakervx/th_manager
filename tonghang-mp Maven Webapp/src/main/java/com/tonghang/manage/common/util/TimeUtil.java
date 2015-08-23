package com.tonghang.manage.common.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class TimeUtil {
	public static String getFormatStringTime(String datetime){
		DateTimeFormatter dtf = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
		DateTime dt = dtf.parseDateTime(datetime);
		return dt.toString(dtf);
	}
	public static String getFormatShortTime(String datetime){
		DateTimeFormatter dtf = DateTimeFormat.forPattern("yyyy-MM-dd");
		DateTime dt = dtf.parseDateTime(datetime);
		return dt.toString(dtf);
	}
	public static Date getFormatShortDate(String datetime){
		DateTimeFormatter dtf = DateTimeFormat.forPattern("yyyy-MM-dd");
		DateTime dt = dtf.parseDateTime(datetime);
		return dt.toDate();
	}
	
	public static Date getFormatDate(String datetime){
		DateTimeFormatter dtf = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
		DateTime dt = dtf.parseDateTime(datetime);
		return dt.toDate();
	}

	public static String getFormatString(Date date) {
		 DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 if(date==null)
			 return "1900-1-1 00:00:00";
		 return format.format(date);
	}
	public static String getFormatDateString(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		 if(date==null)
			 return "1900-1-1 00:00:00";
		 return format.format(date);
	}
	public static String getFormatStringDate(Date date) {
		 DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		 if(date==null)
			 return "1900-1-1 00:00:00";
		 return format.format(date);
	}
	
	public static Date plusHourForDateTime(int hours,Date datetime){
		DateTimeFormatter dtf = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
		DateTime dt = dtf.parseDateTime(getFormatString(datetime));
		dt.plusHours(hours);
		return dt.toDate();
	}
	
	public static Date plusDateForDateTime(int day,Date datetime){
		DateTimeFormatter dtf = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
		DateTime dt = dtf.parseDateTime(getFormatString(datetime));
		System.out.println("增加的天数："+day);
		dt = dt.plusDays(day);
		System.out.println("增加完后，date:"+dt.getDayOfMonth());
		return dt.toDate();
	}
	public static Date plusDateForDate(int day,Date datetime){
		DateTimeFormatter dtf = DateTimeFormat.forPattern("yyyy-MM-dd");
		DateTime dt = dtf.parseDateTime(getFormatString(datetime));
		dt.plusDays(day);
		return dt.toDate();
	}
	
	public static int getYear(){
		return Calendar.getInstance().get(Calendar.YEAR);
	}
	
	public static int getYear(String date){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(getFormatShortDate(date));
		return cal.get(Calendar.YEAR);
	}
}
