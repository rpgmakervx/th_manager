package com.tonghang.manage.common.util;

/**
 * 涵盖了server端要使用的所有常量，其中继承了环信Util,负责初始化获得 app管理员的TOKEN
 * @author Administrator
 *
 */
public class Constant{

	private Constant(){
		
	}
	
	public static final String ISOLATED = "您已被同行管理员封号，如有疑问请联系我们";
	public static final String PASSWORD_INVALID = "邮箱或密码不正确";
	public static final String NOUSER = "用户不存在";
	public static final String EMAIL = "邮件已发送";
	public static final String EMAIL_EXIST = "该邮箱已被注册";
	public static final String PHONE_EXIST = "该手机号已被注册";
	public static final String ADDSUCCESS = "管理员添加成功";
	
	public static final String PICTURE_SERVER = "http://114.215.143.83:8080/tonghang-serverapi";
	public static final String HUANXIN_URL = "http://a1.easemob.com/tonghang/tonghang/";
	public static final String IMAGE_PATH = "/images/";
	public static final String IMAGE_NAME = "sign.jpg";
	
	public static String JPushBasic="ZWI0ZTc5YzRhYjE4MmQ3MjVlYzJmZjE1OmVkMzIxNjdhODY0MWFiMWVlODY1OGIzYQ==";
	public static final String CLIENT_ID = "YXA6zpmeoHX8EeS5LFOLSMeZrA";
	public static final String CLIENT_SECRET = "YXA62xaG_k1OsmSdGYtjIKE3XbO0ahw";
	
	public static final int PAGESIZE = 10;
	
	public static final String CREATEGROUP = "server create group";
	public static final String HUANXIN_SALT = "HUANXIN-SECRET";
	
	public static final int MON = 1;
	public static final int TUE = 2;
	public static final int WEN = 3;
	public static final int THU = 4;
	public static final int FRI = 5;
	public static final int SAT = 6;
	public static final int SUN = 7;
	
	public static final int WEEK = 7;
	public static final int MONTH = 30;
	/** METHOD_DELETE value:GET */
	public static final String METHOD_GET = "GET";

	/** METHOD_DELETE value:POST */
	public static final String METHOD_POST = "POST";

	/** METHOD_DELETE value:PUT */
	public static final String METHOD_PUT = "PUT";

	/** METHOD_DELETE value:DELETE */
	public static final String METHOD_DELETE = "DELETE";
	
	/** error code*/
	public static int ERROR = 500;
	public static int SUCCEES = 200;
	/***/
	public static final String CMD_HEAD = "cmd /c";
	/**mysql备份指令*/
	public static final String BACKUP_SHELL = "mysqldump -h localhost -uroot -pxingtianyu tonghang>";
	/**mysql恢复指令*/
	public static final String RECOVER_SHELL = "mysql -h localhost -uroot -pxingtianyu tonghang<";
	/**windows备份路径*/
	public static final String WIN_BACKUP_PATH = "D:/th_backup/";
	/**linux备份路径*/
	public static final String LINUX_BACKUP_PATH = "/root/th_backup/";
}
