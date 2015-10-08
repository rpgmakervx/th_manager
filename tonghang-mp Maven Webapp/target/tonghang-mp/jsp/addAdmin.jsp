<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>控制台 - Bootstrap后台管理系统模版Ace下载</title>
		<meta name="keywords" content="同行" />
		<meta name="description" content="同行" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome.min.css" />
		
		<!--[if IE 7]>
		  <link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<script src="<%=basePath%>assets/js/jquery-1.9.1.min.js"></script>
		<!-- ace styles -->

		<link rel="stylesheet" href="<%=basePath%>assets/css/ace.min.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/ace-skins.min.css" />
		<style type="text/css">
			body,html{
				margin:0;
				padding:0;
				width:100%;
				height:100%;
				font-family: "微软雅黑","Lucida Grande", "Lucida Sans Unicode", Helvetica, Arial, Verdana, sans-serif;
			}
			#nav_model a:hover{
				color:#FB8B1C;
				cursor:pointer;
				text-decoration: none; 
				border-bottom:4px #000 solid;
			}
			#power{
				width:36px;
			}
		</style>
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=basePath%>assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script type="text/javascript">
			$(function(){
				//以下系列方法是点击输入框时去掉错误提示和错误状态
				$("#email").click(function(){
					$(".email").removeClass("has-error");
					$(".email_error").remove()
				})
				$("#phone").click(function(){
					$(".phone").removeClass("has-error");
					$(".phone_error").remove()
				})
				$("#name").click(function(){
					$(".name").removeClass("has-error");
					$(".name_error").remove()
				})
				$("#id_card").click(function(){
					$(".id_card").removeClass("has-error");
					$(".id_card_error").remove()
				})
				$("#power").click(function(){
					$(".power").removeClass("has-error");
					$(".power_error").remove()
				})
				$("#password").click(function(){
					$(".password").removeClass("has-error");
					$(".password_error").remove()
				})
				
				//点击提交按钮异步请求，校验后台返回值，错误返回包括邮箱已存在，电话已存在。二者均存在
			 	$("#submit").click(function(){
				 	var name = $("#name").val()
					var email = $("#email").val()
					var password = $("#password").val()
					var id_card = $("#id_card").val()
					var phone = $("#phone").val()
					var province = $("#province").val()
					var city = $("#city").val()
					var power = $("#power").val()
			 		var phonereg = /^1[3|4|5|8][0-9]\d{4,8}$/; 
			 		var emailreg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
					var json = {name:name,email:email,id_card:id_card,password:password,phone:phone,province:province,city:city,power:power}	
					if(validateForm(name,password,id_card,email,emailreg,phone,phone,phonereg,power)){
						if(confirm("确定保存？")){
							$.ajax({
								type:"POST",
								url:"<%=basePath%>admin/addAdmin",
								dataType:"json",     
								contentType:"application/json",     
								data:JSON.stringify(json),
								success:function(data){
									if(data.result.code==511){
										$(".phone").addClass("has-error");
							 			$(".phone_inner").append("<div class=' help-block phone_error col-xs-12 col-sm-reset inline '>"+data.result.message+"</div>");
							 			$("#phone").val("");
									}else if(data.result.code==512){
										$(".email").addClass("has-error")
							 			$(".email_inner").append("<div class=' help-block email_error col-xs-12 col-sm-reset inline '>"+data.result.message+"</div>");
							 			$("#email").val("");
									}else if(data.result.code==513){
										$(".email").addClass("has-error")
							 			$(".email_inner").append("<div class=' help-block email_error col-xs-12 col-sm-reset inline '>该邮箱已被存在</div>");
							 			$("#email").val("");
							 			$(".phone").addClass("has-error");
							 			$(".phone_inner").append("<div class=' help-block phone_error col-xs-12 col-sm-reset inline '>该手机号已存在</div>");
							 			$("#phone").val("");
									}else{
										$("#name").val("")
										$("#email").val("")
										$("#password").val("")
										$("#id_card").val("")
										$("#phone").val("")
										$("#province").val("")
										$("#city").val("")
										$("#power").val("2")
										$(".notification").html("<span><big><strong class='green'>"+data.result.message+"</strong></big></span>")
									}
								}
							})
						}
					}
						
			 	})
			 	//用来校验表单是否填写全和邮箱手机号是否合法,所有属性校验，
			 	//不合法则再输入框后添加提示信息，并使输入框变成error状态
			 	function validateForm(name,password,id_card,email,emailreg,phone,phone,phonereg,power){
			 		var ereg = emailreg.test(email);
			 		var preg = phonereg.test(phone);
					if(name!=""&&password!=""&&id_card!=""&&power!=""&&ereg&&preg){
						return true;
					}else{
						if(name==""){
							$(".name_error").remove()
							$(".name").addClass("has-error")
				 			$(".name_inner").append("<div class=' help-block name_error col-xs-12 col-sm-reset inline'>请填写用户名！</div>");
						}
						if(id_card==""){
							$(".id_card_error").remove()
							$(".id_card").addClass("has-error")
				 			$(".id_card_inner").append("<div class=' help-block id_card_error col-xs-12 col-sm-reset inline'>请填写身份证！</div>");
						}	
						if(password==""){
							$(".password_error").remove()
							$(".password").addClass("has-error")
				 			$(".password_inner").append("<div class=' help-block password_error col-xs-12 col-sm-reset inline'>请填写登录密码！</div>");
						}	
						if(!ereg){
				 			$(".email_error").remove();
				 			$(".email").addClass("has-error");
				 			$(".email_inner").append("<div class=' help-block email_error col-xs-12 col-sm-reset inline'>邮箱格式错误 </div>");
				 			$("#email").val("");
				 		}
				 		if(!preg){
				 			$(".phone_error").remove()
				 			$(".phone").addClass("has-error");
				 			$(".phone_inner").append("<div class=' help-block phone_error col-xs-12 col-sm-reset inline '>手机号格式错误 </div>");
				 			$("#phone").val("");
				 		}
						if(power==""){
							$(".power_error").remove()
							$(".power").addClass("has-error")
				 			$(".power_inner").append("<div class=' help-block power_error col-xs-12 col-sm-reset inline'>请填写权限！</div>");
						}
						return false;
					}
			 	}
			 })
		</script>
		<script src="<%=basePath%>assets/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="<%=basePath%>assets/js/html5shiv.js"></script>
		<script src="<%=basePath%>assets/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>
		<div class="navbar navbar-default" id="navbar">
			<div class="navbar-container" id="navbar-container">
				<script type="text/javascript">
                    try{ace.settings.check('navbar' , 'fixed')}catch(e){}
                </script>
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="icon-leaf"></i>
							同行后台管理平台
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
				<span class="col-xs-2"></span>
				<div class="navbar-header " id="nav_model" role="navigation">
                	<a href="<%=basePath %>admin/index" class="navbar-brand">
                        <small>
                            	全局模块
                        </small>
                    </a>
                    <a href="<%=basePath%>user/index" class="navbar-brand">
                        <small>
                           	 用户模块
                        </small>
                    </a>
                    <a href="<%=basePath%>advertise/index" class="navbar-brand">
                        <small>
                            	运营模块
                        </small>
                    </a>
                    <a href="<%=basePath%>statistic/index" class="navbar-brand">
                        <small>
                            	统计模块
                        </small>
                    </a>
              	</div>
				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<span class="user-info">
									<small>当前用户：</small>
									${login_admin.name}
								</span>
								<i class="icon-caret-down"></i>
							</a>
							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="<%=basePath%>admin/setting">
										<i class="icon-cog"></i>
										设置
									</a>
								</li>
								<li class="divider"></li>

								<li>
									<a href="<%=basePath%>admin/logout">
										<i class="icon-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>
		<div class="main-container" id="main-container">
			<div class="main-container-inner " >
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>
				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<ul class="nav nav-list">
						<li >
							<a href="<%=basePath%>admin/setting" class="dropdown-toggle">
								<center><span class="menu-text">密码更改</span></center>
							</a>
						</li>
						<li>
							<a href="#" class="dropdown-toggle">
								<center><span class="menu-text">子管理员</span></center>
                                <b class="arrow icon-angle-down"></b>
							</a>
                            <ul class="submenu  visible-lg">
								<li>
									<a href="<%=basePath%>admin/checkAdmin">
										<center>管理员查询</center>
									</a>
								</li>
                                <li class="active">
									<a href="#">
										<center>管理员添加</center>
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.nav-list -->
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>

				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="<%=basePath%>admin/index">首页</a>
							</li>
							<li class="orange"><a href="<%=basePath %>admin/setting">设置</a></li>
							<li class="orange">子管理员</li>
							<li class="orange">管理员添加</li>
						</ul><!-- .breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								<span class="orange2">设置</span>
							</h1>
						</div><!-- /.page-header -->
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
                                <div class="notification"> </div>
								<form class="form-horizontal" id="form1" role="form" action="<%=basePath%>admin/addAdmin" method="post">
                                	<div class="form-group name">
                                   		<label class="col-sm-4 control-label no-padding-right" for="form-field-1">姓名：</label>
										<div class="col-sm-6 name_inner">
											<input type="text" id="name" name="name" class="col-xs-10 col-sm-5" required  />
										</div>
									</div>
                                    <div class="space-4"></div>
                                    <div class="form-group id_card">
                                    	<label class="col-sm-4 control-label no-padding-right" for="form-field-1">身份证号：</label>
										<div class="col-sm-6 id_card_inner">
											<input type="text" id="id_card" name="id_card" class="col-xs-10 col-sm-5"required  />
										</div>
									</div>
                                    <div class="form-group password">
                                    	<label class="col-sm-4 control-label no-padding-right" for="form-field-1">密码：</label>
										<div class="col-sm-6 password_inner" >
											<input type="password" id="password" name="password" class="col-xs-10 col-sm-5"required  />
										</div>
									</div>
                                    <div class="form-group email">
                                    	<label class="col-sm-4 control-label no-padding-right" for="form-field-1">邮箱：</label>
										<div class="col-sm-6 email_inner">
											<span class="block input-icon input-icon-right">
												<input type="text" id="email" name="email" class="col-xs-10 col-sm-5" required  />
											</span>
										</div>
									</div>
									<div class="form-group" >
                                    	<label class="col-sm-4 control-label no-padding-right" for="form-field-1">籍贯：</label>
                                        <div class="col-sm-6">
											<select id="province" name="province" class="col-xs-3 col-sm-4" onchange="selectprovince(this)" required ></select>
											<select id="city" name="city" class="col-xs-3 col-sm-4" required ></select>
										</div>
                                    </div>
                                    <div class="space-4"></div>
                                    <div class="form-group phone">
										<label class="col-sm-4 control-label no-padding-right" for="form-field-1">联系电话：</label>
										<div class="col-sm-6 phone_inner">
											<span class="block input-icon input-icon-right">
												<input type="text" id="phone" name="phone" class="col-xs-10 col-sm-5" required  />
											</span>
										</div>
								<!--	<div class="help-block col-xs-12 col-sm-reset inline"> Error tip help! </div>  -->	
									</div>
                                    <div class="form-group power">
                                    	<label class="col-sm-4 control-label no-padding-right" for="form-field-1">权限等级：</label>
                                        <div class="col-sm-6 power_inner">
											 <input type="text" id="power" name="power" class="input-mini"/>
											 <div class="space-6"></div>
										</div>
                                    </div>
                                    <!--文件上传，待定
                          	        <div class="form-group">
                                    	<label class="col-sm-4 control-label no-padding-right" for="form-field-1">头像上传：</label>
                                        <div class="col-sm-3 ">
                                        	<input multiple="" type="file" id="id-input-file-3" />
                                        </div>
                                    </div> --> 
                                    <div class="space-4"></div>
                                    <div class="form-group">
										<div class="col-md-offset-4 col-md-10">
											<button class="btn btn-info" id="submit" type="button">
												<i class="icon-ok bigger-100"></i>
												Submit
											</button>
											<button class="btn" type="reset">
												<i class="icon-undo bigger-120"></i>
												Reset
											</button>
										</div>
									</div>
                                </form>
                            </div><!-- /.col-xs-12 -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->                    
				</div><!-- /.main-content -->
        	</div>
		</div><!-- /.main-container <span class="label label-warning arrowed arrowed-right">售完</span>-->
		
		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=basePath%>assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=basePath%>assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='<%=basePath%>assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
		</script>
		<script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
		<script src="<%=basePath%>assets/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="<%=basePath%>assets/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="<%=basePath%>assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<%=basePath%>assets/js/chosen.jquery.min.js"></script>
		<script src="<%=basePath%>assets/js/fuelux/fuelux.spinner.min.js"></script>
		<script src="<%=basePath%>assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script src="<%=basePath%>assets/js/date-time/bootstrap-timepicker.min.js"></script>
		<script src="<%=basePath%>assets/js/date-time/moment.min.js"></script>
		<script src="<%=basePath%>assets/js/date-time/daterangepicker.min.js"></script>
		<script src="<%=basePath%>assets/js/bootstrap-colorpicker.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.knob.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.autosize.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.maskedinput.min.js"></script>
		<script src="<%=basePath%>assets/js/bootstrap-tag.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.validate.min.js"></script>
		<!-- ace scripts -->

		<script src="<%=basePath%>assets/js/ace-elements.min.js"></script>
		<script src="<%=basePath%>assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			function reset(){
				$("#spinner1").val("1");
			}
			var list1 = new Array;
			var list2 = new Array;
			list1[list1.length] = "北京市";
			list1[list1.length] = "天津市";
			list1[list1.length] = "河北省";
			list1[list1.length] = "山西省";
			list1[list1.length] = "内蒙古";
			list1[list1.length] = "辽宁省";
			list1[list1.length] = "吉林省";
			list1[list1.length] = "黑龙江省";
			list1[list1.length] = "上海市";
			list1[list1.length] = "江苏省";
			list1[list1.length] = "浙江省";
			list1[list1.length] = "安徽省";
			list1[list1.length] = "福建省";
			list1[list1.length] = "江西省";
			list1[list1.length] = "山东省";
			list1[list1.length] = "河南省";
			list1[list1.length] = "湖北省";
			list1[list1.length] = "湖南省";
			list1[list1.length] = "广东省";
			list1[list1.length] = "广西自治区";
			list1[list1.length] = "海南省";
			list1[list1.length] = "重庆市";
			list1[list1.length] = "四川省";
			list1[list1.length] = "贵州省";
			list1[list1.length] = "云南省";
			list1[list1.length] = "西藏自治区";
			list1[list1.length] = "陕西省";
			list1[list1.length] = "甘肃省";
			list1[list1.length] = "青海省";
			list1[list1.length] = "宁夏回族自治区";
			list1[list1.length] = "新疆维吾尔自治区";
			list1[list1.length] = "香港特别行政区";
			list1[list1.length] = "澳门特别行政区";
			list1[list1.length] = "台湾省";
			list1[list1.length] = "其它";
		
			list2[list2.length] = new Array("北京", "东城区", "西城区", "崇文区", "宣武区", "朝阳区", "丰台区", "石景山区", " 海淀区（中关村）", "门头沟区", "房山区", "通州区", "顺义区", "昌平区", "大兴区", "怀柔区", "平谷区", "密云县", "延庆县", " 其他");
			list2[list2.length] = new Array("和平区", "河东区", "河西区", "南开区", "红桥区", "塘沽区", "汉沽区", "大港区",
						"西青区", "津南区", "武清区", "蓟县", "宁河县", "静海县", "其他");
			list2[list2.length] = new Array("石家庄市", "张家口市", "承德市", "秦皇岛市", "唐山市", "廊坊市", "衡水市",
						"沧州市", "邢台市", "邯郸市", "保定市", "其他");
			list2[list2.length] = new Array("太原市", "朔州市", "大同市", "长治市", "晋城市", "忻州市", "晋中市", "临汾市",
						"吕梁市", "运城市", "其他");
			list2[list2.length] = new Array("呼和浩特市", "包头市", "赤峰市", "呼伦贝尔市", "鄂尔多斯市", "乌兰察布市",
						"巴彦淖尔市", "兴安盟", "阿拉善盟", "锡林郭勒盟", "其他");
			list2[list2.length] = new Array("沈阳市", "朝阳市", "阜新市", "铁岭市", "抚顺市", "丹东市", "本溪市", "辽阳市",
						"鞍山市", "大连市", "营口市", "盘锦市", "锦州市", "葫芦岛市", "其他");
			list2[list2.length] = new Array("长春市", "白城市", "吉林市", "四平市", "辽源市", "通化市", "白山市", "延边朝鲜族自治州", "其他");
			list2[list2.length] = new Array("哈尔滨市", "七台河市", "黑河市", "大庆市", "齐齐哈尔市", "伊春市", "佳木斯市",
						"双鸭山市", "鸡西市", "大兴安岭地区(加格达奇)", "牡丹江", "鹤岗市", "绥化市　", "其他");
			list2[list2.length] = new Array("黄浦区", "卢湾区", "徐汇区", "长宁区", "静安区", "普陀区", "闸北区", "虹口区",
						"杨浦区", "闵行区", "宝山区", "嘉定区", "浦东新区", "金山区", "松江区", "青浦区", "南汇区", "奉贤区", "崇明县", "其他");
			list2[list2.length] = new Array("南京市", "徐州市", "连云港市", "宿迁市", "淮安市", "盐城市", "扬州市", "泰州市",
						"南通市", "镇江市", "常州市", "无锡市", "苏州市", "其他");
			list2[list2.length] = new Array("杭州市", "湖州市", "嘉兴市", "舟山市", "宁波市", "绍兴市", "衢州市", "金华市",
						"台州市", "温州市", "丽水市", "其他");
			list2[list2.length] = new Array("合肥市", "宿州市", "淮北市", "亳州市", "阜阳市", "蚌埠市", "淮南市", "滁州市",
						"马鞍山市", "芜湖市", "铜陵市", "安庆市", "黄山市", "六安市", "巢湖市", "池州市", "宣城市", "其他");
			list2[list2.length] = new Array("福州市", "南平市", "莆田市", "三明市", "泉州市", "厦门市", "漳州市", "龙岩市", "宁德市", "其他");
			list2[list2.length] = new Array("南昌市", "九江市", "景德镇市", "鹰潭市", "新余市", "萍乡市", "赣州市", "上饶市",
						"抚州市", "宜春市", "吉安市", "其他");
			list2[list2.length] = new Array("济南市", "聊城市", "德州市", "东营市", "淄博市", "潍坊市", "烟台市", "威海市",
						"青岛市", "日照市", "临沂市", "枣庄市", "济宁市", "泰安市", "莱芜市", "滨州市", "菏泽市", "其他");
			list2[list2.length] = new Array("郑州市", "三门峡市", "洛阳市", "焦作市", "新乡市", "鹤壁市", "安阳市", "濮阳市",
						"开封市", "商丘市", "许昌市", "漯河市", "平顶山市", "南阳市", "信阳市", "周口市", "驻马店市", "其他");
			list2[list2.length] = new Array("武汉市", "十堰市", "襄樊市", "荆门市", "孝感市", "黄冈市", "鄂州市", "黄石市",
						"咸宁市", "荆州市", "宜昌市", "随州市", "恩施土家族苗族自治州", "仙桃市", "天门市", "潜江市", "神农架林区", "其他");
			list2[list2.length] = new Array("长沙市", "张家界市", "常德市", "益阳市", "岳阳市", "株洲市", "湘潭市", "衡阳市",
						"郴州市", "永州市", "邵阳市", "怀化市", "娄底市", "湘西土家族苗族自治州", "其他");
			list2[list2.length] = new Array("广州市", "清远市市", "韶关市", "河源市", "梅州市", "潮州市", "汕头市", "揭阳市",
						"汕尾市", " 惠州市", "东莞市", "深圳市", "珠海市", "中山市", "江门市", "佛山市", "肇庆市", "云浮市",
						"阳江市", "茂名市", "湛江市", " 其他");
			list2[list2.length] = new Array("南宁市", "桂林市", "柳州市", "梧州市", "贵港市", "玉林市", "钦州市", "北海市",
						"防城港市", "崇左市", "百色市", "河池市", "来宾市", "贺州市", "其他");
			list2[list2.length] = new Array("海口市", "三亚市", "其他");
			list2[list2.length] = new Array("渝中区", "大渡口区", "江北区", "沙坪坝区", "九龙坡区", "南岸区", "北碚区",
						"万盛区", "双桥区", "渝北区", "巴南区", "万州区", "涪陵区", "黔江区", "长寿区", "合川市", "永川市",
						"江津市", "南川市", "綦江县", "潼南县", "铜梁县", "大足县", "璧山县", "垫江县", "武隆县", "丰都县",
						"城口县", "开县", "巫溪县", "巫山县", "奉节县", "云阳县", "忠县", "石柱土家族自治县", "彭水苗族土家族自治县",
						"酉阳土家族苗族自治县", "秀山土家族苗族自治县", "其他");
			list2[list2.length] = new Array("成都市", "广元市", "绵阳市", "德阳市", "南充市", "广安市", "遂宁市",
						"内江市", "乐山市", "自贡市", "泸州市", "宜宾市", "攀枝花市", "巴中市", "资阳市", "眉山市", "雅安",
						"阿坝藏族羌族自治州", "甘孜藏族自治州", "凉山彝族自治州县", "其他");
			list2[list2.length] = new Array("贵阳市", "六盘水市", "遵义市", "安顺市", "毕节地区", "铜仁地区",
						"黔东南苗族侗族自治州", "黔南布依族苗族自治州", "黔西南布依族苗族自治州", "其他");
			list2[list2.length] = new Array("昆明市", "曲靖市", "玉溪市", "保山市", "昭通市", "丽江市", "普洱市",
						"临沧市", "宁德市", "德宏傣族景颇族自治州", "怒江傈僳族自治州", "楚雄彝族自治州", "红河哈尼族彝族自治州",
						"文山壮族苗族自治州", "大理白族自治州", "迪庆藏族自治州", "西双版纳傣族自治州", "其他");
			list2[list2.length] = new Array("拉萨市", "那曲地区", "昌都地区", "林芝地区", "山南地区", "日喀则地区", "阿里地区", "其他");
			list2[list2.length] = new Array("西安市", "延安市", "铜川市", "渭南市", "咸阳市", "宝鸡市", "汉中市", "安康市", "商洛市", "其他");
			list2[list2.length] = new Array("兰州市 ", "嘉峪关市", "金昌市", "白银市", "天水市", "武威市", "酒泉市",
						"张掖市", "庆阳市", "平凉市", "定西市", "陇南市", "临夏回族自治州", "甘南藏族自治州", "其他");
			list2[list2.length] = new Array("西宁市", "海东地区", "海北藏族自治州", "黄南藏族自治州", "玉树藏族自治州",
						"海南藏族自治州", "果洛藏族自治州", "海西蒙古族藏族自治州", "其他");
			list2[list2.length] = new Array("银川市", "石嘴山市", "吴忠市", "固原市", "中卫市", "其他");
			list2[list2.length] = new Array("乌鲁木齐市", "克拉玛依市", "喀什地区", "阿克苏地区", "和田地区", "吐鲁番地区",
						"哈密地区", "塔城地区", "阿勒泰地区", "克孜勒苏柯尔克孜自治州", "博尔塔拉蒙古自治州",
						"昌吉回族自治州伊犁哈萨克自治州", "巴音郭楞蒙古自治州", "河子市", "阿拉尔市", "五家渠市", "图木舒克市", "其他");
			list2[list2.length] = new Array("香港", "其他");
			list2[list2.length] = new Array("澳门", "其他");
			list2[list2.length] = new Array("台湾", "其他");
		
			var ddlProvince = document.getElementById("province");
			var ddlCity = document.getElementById("city");
			for(var i =0;i<list1.length; i++)
			{
				var option = document.createElement("option");
				option.appendChild(document.createTextNode(list1[i]));
				option.value = list1[i];
				ddlProvince.appendChild(option);
				//city initialize
				var firstprovince = list2[0];
				for (var j = 0; j < firstprovince.length; j++) {
					var optioncity = document.createElement("option");
					optioncity.appendChild(document.createTextNode(firstprovince[j]));
					optioncity.value = firstprovince[j];
					ddlCity.appendChild(optioncity);
				}
			}
			function indexof(obj,value)
			{
				var k=0;
				for(;k<obj.length;k++)
				{
					if(obj[k] == value)
					return k;
				}
				return k;
			}
			function selectprovince(obj) {
				ddlCity.options.length = 0;//clear
				var index = indexof(list1,obj.value);
				var list2element = list2[index];
				for(var i =0;i<list2element.length; i++)
				{
					var option = document.createElement("option");
					option.appendChild(document.createTextNode(list2element[i]));
					option.value = list2element[i];
					ddlCity.appendChild(option);
				}
			}
		</script>
		<script type="text/javascript">
			jQuery(function($) {
				
				$('#id-input-file-1 , #id-input-file-2').ace_file_input({
					no_file:'No File ...',
					btn_choose:'Choose',
					btn_change:'Change',
					droppable:false,
					onchange:null,
					thumbnail:false //| true | large
					//whitelist:'gif|png|jpg|jpeg'
					//blacklist:'exe|php'
					//onchange:''
					//
				});
				
				$('#id-input-file-3').ace_file_input({
					style:'well',
					btn_choose:'请选择员工头像',
					btn_change:null,
					no_icon:'icon-cloud-upload',
					droppable:true,
					thumbnail:'small'//large | fit
					//,icon_remove:null//set null, to hide remove/reset button
					/**,before_change:function(files, dropped) {
						//Check an example below
						//or examples/file-upload.html
						return true;
					}*/
					/**,before_remove : function() {
						return true;
					}*/
					,
					preview_error : function(filename, error_code) {
						//name of the file that failed
						//error_code values
						//1 = 'FILE_LOAD_FAILED',
						//2 = 'IMAGE_LOAD_FAILED',
						//3 = 'THUMBNAIL_FAILED'
						//alert(error_code);
					}
			
				}).on('change', function(){
					//console.log($(this).data('ace_input_files'));
					//console.log($(this).data('ace_input_method'));
				});
				
			
				//dynamically change allowed formats by changing before_change callback function
				$('#id-file-format').removeAttr('checked').on('change', function() {
					var before_change
					var btn_choose
					var no_icon
					if(this.checked) {
						btn_choose = "Drop images here or click to choose";
						no_icon = "icon-picture";
						before_change = function(files, dropped) {
							var allowed_files = [];
							for(var i = 0 ; i < files.length; i++) {
								var file = files[i];
								if(typeof file === "string") {
									//IE8 and browsers that don't support File Object
									if(! (/\.(jpe?g|png|gif|bmp)$/i).test(file) ) return false;
								}
								else {
									var type = $.trim(file.type);
									if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif|bmp)$/i).test(type) )
											|| ( type.length == 0 && ! (/\.(jpe?g|png|gif|bmp)$/i).test(file.name) )//for android's default browser which gives an empty string for file.type
										) continue;//not an image so don't keep this file
								}
								
								allowed_files.push(file);
							}
							if(allowed_files.length == 0) return false;
			
							return allowed_files;
						}
					}
					else {
						btn_choose = "Drop files here or click to choose";
						no_icon = "icon-cloud-upload";
						before_change = function(files, dropped) {
							return files;
						}
					}
					var file_input = $('#id-input-file-3');
					file_input.ace_file_input('update_settings', {'before_change':before_change, 'btn_choose': btn_choose, 'no_icon':no_icon})
					file_input.ace_file_input('reset_input');
				});
			
				$('#power').ace_spinner({value:2,min:2,max:4,step:1, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
				.on('change', function(){
					//alert(this.value)
				});
				/////////
				$('#modal-form input[type=file]').ace_file_input({
					style:'well',
					btn_choose:'Drop files here or click to choose',
					btn_change:null,
					no_icon:'icon-cloud-upload',
					droppable:true,
					thumbnail:'large'
				})
				
				//chosen plugin inside a modal will have a zero width because the select element is originally hidden
				//and its width cannot be determined.
				//so we set the width after modal is show
				$('#modal-form').on('shown.bs.modal', function () {
					$(this).find('.chosen-container').each(function(){
						$(this).find('a:first-child').css('width' , '210px');
						$(this).find('.chosen-drop').css('width' , '210px');
						$(this).find('.chosen-search input').css('width' , '200px');
					});
				})
				/**
				//or you can activate the chosen plugin after modal is shown
				//this way select element becomes visible with dimensions and chosen works as expected
				$('#modal-form').on('shown', function () {
					$(this).find('.modal-chosen').chosen();
				})
				*/
			
			});
		</script>
</body>
</html>