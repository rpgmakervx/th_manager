package com.tonghang.manage.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("fileUtil")
public class FileUtil {
	
	private List<String> adv_names ;
	
	public void gatherAdv_names(File dir){
		File[] fs = dir.listFiles();
	    for(int i=0; i<fs.length; i++){
		    System.out.println(fs[i].getAbsolutePath());
		    if(fs[i].isDirectory()){
		    	gatherAdv_names(fs[i]);
		    }else{
		    	adv_names.add(fs[i].getName().substring(fs[i].getName().lastIndexOf("_")+1,fs[i].getName().lastIndexOf(".")));
		    }
	    }
	}

	public List<String> getAdv_names() {
		return adv_names;
	}

	public void setAdv_names(List<String> adv_names) {
		this.adv_names = adv_names;
	}

}
