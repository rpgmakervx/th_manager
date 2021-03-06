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
	public static final String AGREE_ADD_MSG = "同意添加您为好友"; 
	public static final String REFUSE_ADD_MSG = "拒绝添加您为好友";
	public static final String INVITATION_MSG = "请求添加您为好友";
	public static final String NEWBE_MSG = "是和您行业相近的新用户";
	public static final String ISOLATE_MSG = "您已被管理员封号，详情请咨询客服tonghangtinghang@126.com";
	public static final String DEISOLATE_MSG = "您已被管理员解封，欢迎您再次使用";
	
	
	public static final String PICTURE_SERVER = "http://114.215.143.83:8080/tonghang-serverapi";
	public static final String HUANXIN_URL = "http://a1.easemob.com/tonghang/tonghang/";
	public static final String IMAGE_PATH = "/images/";
	public static final String IMAGE_NAME = "sign.jpg";
	public static final String ADV_IMAGE = "advertise_";
	
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
	public static final String CMD_HEAD = "cmd /c ";
	public static final String SHELL_HEAD = "/bin/sh ";
	/**mysql备份指令*/
	public static final String BACKUP_SHELL = "mysqldump -h localhost -uroot -p123456 tonghang>";
	/**mysql恢复指令*/
	public static final String RECOVER_SHELL = "mysql -h localhost -uroot -p123456 tonghang<";
	/**windows备份路径*/
	public static final String WIN_BACKUP_PATH = "D:/th_backup/";
	/**linux备份路径*/
	public static final String LINUX_BACKUP_PATH = "'/root/th_backup/'";
	/** apk的存放路径*/
	public static final String APK_HOME = "home/app";
	/** windows下apk的解压路径*/
	public static final String APK_UNPACK_PATH = "home/unpack";
	/**windows下的解压命令*/
	public static final String WIN_UNPACK_SHELL = "D:/apk_unzip/apktool d -f ";
	/**linux下的解压命令*/
	public static final String LINUX_UNPACK_SHELL = "/root/apk_unzip/./apktool d -f ";
	/**apk文件在windows下的全路径*/
	public static final String WIN_APK_PATH = "D:/codekit/java/Web/TomCat/apache-tomcat-7.0.40/webapps/tonghang/home/app/";
	/**apk文件在linux下的全路径*/
	public static final String LINUX_APK_PATH = "/root/apache-tomcat-7.0.57/webapps/tonghang/home/app/"; 
	/**apk文件在linux下的全路径 测试用*/
	public static final String LINUX_APK_PATH_TEST = "/root/tomcat-7-test1/webapps/tonghang/home/app/"; 
	
	/**apk配置文件未知*/
	public static final String ANDROID_MANIFAST_PATH = "home/unpack/AndroidManifest.xml";
	
	
	/**好友邀请的推送标记*/
	public static final String INVITATION = "0";
	/**同意添加为好友的推送标记*/
	public static final String AGREE_ADD_FRIEND = "1";
	/**拒绝添加为好友的推送标记*/
	public static final String REFUSE_ADD_FRIEND = "2";
	/**新人推荐的推送标记*/
	public static final String RECOMMEND_NEWBE = "3";
	/**封号的推送标记*/
	public static final String ISOLATE = "4";
	/**解封的推送标记*/
	public static final String DEISOLATE = "5";
	/**删除话题的推送标记*/
	public static final String DELETE_TOPIC = "6";
}
