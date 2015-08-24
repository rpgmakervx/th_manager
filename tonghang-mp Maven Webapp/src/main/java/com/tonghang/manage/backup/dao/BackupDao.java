package com.tonghang.manage.backup.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.tonghang.manage.common.util.Constant;

@Repository("backupDao")
public class BackupDao {

	public List<String> findAllBakDate(){
		List<String> dates = new ArrayList<String>();
		File bakfile = new File(Constant.WIN_BACKUP_PATH);
		for(File f:bakfile.listFiles()){
			String date = f.getName().substring(f.getName().lastIndexOf("_")+1,f.getName().lastIndexOf("."));
			dates.add(date);
		}
		return dates;
	}
}
