package com.tonghang.manage.app.util;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Component;

import com.tonghang.manage.app.pojo.Apk;
import com.tonghang.manage.common.util.Constant;
@Component("configReader")
public class AppConfigReader {

	private SAXReader reader ;
	
	public Apk getApkMessage(HttpServletRequest request){
		reader = new SAXReader();
		Apk apk = null;
		try {
			Document   document = reader.read(new File(request.getSession().getServletContext().getRealPath(Constant.ANDROID_MANIFAST_PATH)));
			Element node = document.getRootElement();
			Element element = node.element("manifest"); 
			Attribute code_attr = element.attribute("android:versionCode"); 
			Attribute version_attr = element.attribute("android:versionName"); 
			String code = code_attr.getText();
			String version = version_attr.getText();
			apk = new Apk();
			apk.setApp_code(code);
			apk.setApp_version(version);
			apk.setUpload_at(new Date());
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return apk;
	}
}
