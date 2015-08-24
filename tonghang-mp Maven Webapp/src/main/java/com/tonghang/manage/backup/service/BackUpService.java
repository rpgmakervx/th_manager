package com.tonghang.manage.backup.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tonghang.manage.backup.dao.BackupDao;
import com.tonghang.manage.common.exception.BackupException;
import com.tonghang.manage.common.util.Constant;
import com.tonghang.manage.common.util.TimeUtil;

@Service("backupService")
public class BackUpService {

	@Resource(name = "backupDao")
	private BackupDao backupDao ;
	
	/**
	 * 业务功能：根据文件名备份数据库
	 * @param bakName
	 * notice:项目上线时，要把Constant.WIN_BACKUP_PATH 改成Constant.LINUX_BACKUP_PATH
	 * @throws BackupException 
	 */
	public void backupDB(String bakName) throws BackupException{
		try {
			Runtime.getRuntime().exec(Constant.CMD_HEAD+Constant.BACKUP_SHELL+Constant.WIN_BACKUP_PATH+bakName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new BackupException("数据备份出现异常，请检查服务器！\n操作时间："+TimeUtil.getFormatString(new Date()));
		}
	}
	
	public void recoverDB(String bakName) throws BackupException{
		List<String> baks = backupDao.findAllBakDate();
		if(!baks.contains(bakName)){
			throw new BackupException("没找到该日期的数据备份记录！\n操作时间："+TimeUtil.getFormatString(new Date()));
		}
		try {
			Runtime.getRuntime().exec(Constant.CMD_HEAD+Constant.RECOVER_SHELL+Constant.WIN_BACKUP_PATH+"tonghang_"+bakName+".sql");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new BackupException("数据恢复出现异常，请检查服务器！\n操作时间："+TimeUtil.getFormatString(new Date()));
		}
	}
	
	
}
