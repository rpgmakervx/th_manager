<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<meta name="keywords" content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文" />
		<meta name="description" content="站长素材提供Bootstrap模版,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome-ie7.min.css" />
		<![endif]-->


		<!-- ace styles -->

		<link rel="stylesheet" href="<%=basePath%>assets/css/ace.min.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/ace-skins.min.css" />
		<style>
			body,html{
				margin:0;
				padding:0;
				width:100%;
				height:100%;
				font-family: "微软雅黑","Lucida Grande", "Lucida Sans Unicode", Helvetica, Arial, Verdana, sans-serif;
			}
			.border{
				color:#FFF;
			}
			#nav_model a:hover{
				color:#FB8B1C;
				cursor:pointer;
				text-decoration: none; 
				border-bottom:4px #000 solid;
			}
        	.block-h-1{
        		height: 10px;
        		width: 100%
        	}
        	.block-h-2{
        		height: 20px;
        		width: 100%
        	}
        	.block-h-3{
        		height: 30px;
        		width: 100%
        	}
        	.block-h-4{
        		height: 40px;
        		width: 100%
        	}
        	.block-h-5{
        		height: 50px;
        		width: 100%
        	}
        	.block-w-1{
        		height: 100%;
        		width: 10px;
        	}
        	.block-w-2{
        		height: 100%;
        		width: 20px;
        	}
        	.block-w-3{
        		height: 100%;
        		width: 30px;
        	}
        	.block-w-4{
        		height: 100%;
        		width: 40px;
        	}
        	.block-w-5{
        		height: 100%;
        		width: 50px;
        	}
        </style>
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=basePath%>assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="<%=basePath%>assets/js/ace-extra.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery-1.9.1.min.js"></script>
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
                	<a href="#" class="navbar-brand">
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
						<li class="light-blue">
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
						<li class="active">
							<a href="#" class="dropdown-toggle">
								<center><span class="menu-text">app控制台</span></center>
							</a>
						</li>
						<li>
							<a href="<%=basePath%>app/index" class="dropdown-toggle">
								<center><span class="menu-text">app版本管理</span></center>
							</a>
						</li>
						<li>
							<a href="<%=basePath%>backup/index" class="dropdown-toggle">
								<center><span class="menu-text">数据备份和还原</span></center>
							</a>
						</li>
					</ul><!-- /.nav-list -->
					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
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
								<a href="#">首页</a>
							</li>
							<li class="orange">全局</li>
							<li class="orange">控制台</li>
						</ul><!-- .breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								<span class="orange2">控制台</span>
							</h1>
						</div><!-- /.page-header -->
						<div class="row">
							<div class="col-xs-12">
								<div class="alert alert-block alert-success">
									<button type="button" class="close" data-dismiss="alert">
										<i class="glyphicon glyphicon-remove"></i>
									</button>
                                   	 尊敬的管理员 
                                   	 <strong class="green">
                                   	 	<big>${login_admin.name}</big>
                                   	 </strong>，
									欢迎使用 同行后台管理系统，本系统由
									<strong class="green">
										<big>天津行动科技有限公司</big>
									</strong> 开发,详情请拨打咨询电话：13652179825.	
								</div>
							</div><!-- /.col -->
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
                                <span class="orange"><strong><big>权限控制</big></strong></span>
								<form class="form-horizontal" role="form" method="post" action="<%=basePath%>system/config">
                                	<div class="col-lg-12" >
                                        <div class="col-lg-3">
                                            <h2><strong>注册管理</strong></h2>
                                            <h5><strong>是否允许注册新用户</strong></h5>
                                        </div>
                                        <div class="col-lg-3">
                                            <h2><strong>登录管理</strong></h2>
                                            <h5><strong>是否允许用户登录</strong></h5>
                                        </div>
                                        <div class="col-lg-3">
                                            <h2><strong>升级管理</strong></h2>
                                            <h5><strong>提示升级(OFF)或者静默升级(ON)</strong></h5>
                                        </div>
                                        
                            		</div>
                            		<div class="col-lg-12">
                            			<div class="block-h-2"></div>
                            		</div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <label>
                                                <input name="can_login" class="ace ace-switch ace-switch-2" type="checkbox" 
                                                	<c:if test="${sys_cfg.can_login eq 1}">checked</c:if> />
                                                <span class="lbl"></span>
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <label>
                                                <input name="can_regist" class="ace ace-switch ace-switch-2" type="checkbox" 
                                                		<c:if test="${sys_cfg.can_register_user eq 1}">checked</c:if>/>
                                                <span class="lbl"></span>
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <label>
                                                <input name="upgrade" class="ace ace-switch ace-switch-3" type="checkbox"
                                                	 <c:if test="${sys_cfg.can_upgrade_silently eq 1}">checked</c:if>/>
                                                <span class="lbl"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                    	<hr/>
                                    </div>
                                    <span class="orange"><strong><big>广告控制</big></strong></span>
                                    <div class="col-lg-12" >
                                        <div class="col-lg-3">
                                            <h2><strong>广告开放</strong></h2>
                                            <h5><strong>是否开启广告</strong></h5>
                                        </div>
                                    	<div class="col-lg-3">
                                            <h2><strong>第三方广告</strong></h2>
                                            <h5><strong>关闭(OFF)开启(ON)</strong></h5>
                                        </div>
                                        <div class="col-lg-3">
                                        	 <h2><strong>本站广告</strong></h2>
                                        	<h5><strong>选择当前广告地址</strong></h5>
                                        </div>
                                    </div>
                                    <div class="col-lg-12" >
                                    	<div class="col-lg-3">
                                            <label>
                                                <input name="use_adv" class="ace ace-switch ace-switch-3" type="checkbox"
                                                	 <c:if test="${sys_cfg.use_adv eq 1}">checked</c:if>/>
                                                <span class="lbl"></span>
                                            </label>
                                        </div>
                                    	<div class="col-lg-3">
                                            <label>
                                                <input name="third_adv" class="ace ace-switch ace-switch-3" type="checkbox"
                                                	 <c:if test="${sys_cfg.third_adv eq 1}">checked</c:if>/>
                                                <span class="lbl"></span>
                                            </label>
                                        </div> 
                                        <div class="col-md-6">
	                                        <label class="col-md-6">
	                                            <select id="url" name="url" readonly class="col-md-9" >
	                                            </select>
	                                        </label>
	                                    </div>
                                    </div>
                                    <div class="col-lg-12">
                            			<div class="block-h-4"></div>
                            		</div>
                                    <div class="col-lg-12 ">
	                                    <div class="col-md-10">
											<button class="btn btn-info" type="submit" >
												<i class="icon-ok bigger-100"></i>
												Submit
											</button>
											<button class="btn" type="reset">
												<i class="icon-undo bigger-120"></i>
												Reset
											</button>
										</div>
										<div class="notification">
		                                	<span><big>${cfg_notification}</big></span>
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
		<script src="<%=basePath%>assets/js/jquery.slimscroll.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="<%=basePath%>assets/js/flot/jquery.flot.min.js"></script>
		<script src="<%=basePath%>assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="<%=basePath%>assets/js/flot/jquery.flot.resize.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.sparkline.min.js"></script>
		<!-- ace scripts -->

		<script src="<%=basePath%>assets/js/ace-elements.min.js"></script>
		<script src="<%=basePath%>assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			$(function(){
				$.ajax({
					type:"POST",
					url:"<%=basePath%>system/adv_url",
					dataType:"json",     
					contentType:"application/json",
					success:function(data){
						var urls = data.result.advertise_urls
						var now_url = data.result.now_url
						for(var index=0;index<urls.length;index++){
							if(urls[index]==now_url){
								$("#url").append("<option selected>"+urls[index]+"</option>")
							}else{
								$("#url").append("<option>"+urls[index]+"</option>")
							}						
						}
					}
				})
			})
		</script>
</body>
</html>