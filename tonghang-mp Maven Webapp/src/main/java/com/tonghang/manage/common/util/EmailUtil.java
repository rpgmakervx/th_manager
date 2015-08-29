package com.tonghang.manage.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.tonghang.manage.admin.pojo.Admin;
import com.tonghang.manage.user.pojo.User;

public class EmailUtil {
	private static Properties pro = new Properties();
	private static void initMail(){
		String path = EmailUtil.class.getClassLoader().getResource("/").getPath(); 
		System.out.println("initMail："+path);
		InputStream is = EmailUtil.class.getResourceAsStream(path+"/mail.properties");
		try {
			pro.load(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void sendEmail(Admin admin) {
//		initMail();
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
		senderImpl.setHost("smtp.126.com");
		senderImpl.setUsername("tonghangtonghang@126.com");
		senderImpl.setPassword("xiaot2015");
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(admin.getEmail());
		mailMessage.setFrom("tonghangtonghang@126.com");
		mailMessage.setSubject("【同行管理平台】密码已重置");
		mailMessage.setText("尊敬的管理员" + admin.getName() + "，您好！\n\n"
				+ "您的管理员帐户密码已更改，当前密码是：" + admin.getPassword()
				+ "\n请及时更改成您熟悉的密码。\n\n" + "如有疑问请及时联系超级管理员");
		senderImpl.send(mailMessage);
	}
	
	public static void sendEmailToUser(User user) {
//		initMail();
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
		senderImpl.setHost("smtp.126.com");
		senderImpl.setUsername("tonghangtonghang@126.com");
		senderImpl.setPassword("xiaot2015");
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(user.getEmail());
		mailMessage.setFrom("tonghangtonghang@126.com");
		mailMessage.setSubject("【同行】您已被解封");
		mailMessage.setText("尊敬的用户" + user.getUsername() + "，您好！\n\n"
				+ "您的账号已被管理员封锁。如有疑问请及时联系管理员。\n\n 联系方式: tonghangtonghang@126.com");
		senderImpl.send(mailMessage);
	}
}
