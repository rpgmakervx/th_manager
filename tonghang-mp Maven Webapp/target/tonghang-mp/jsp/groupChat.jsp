<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = path + "/";
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
<link href="<%=basePath%>assets/css/jquery.fancybox.css" rel="stylesheet" />
<link href="<%=basePath%>assets/css/se7en-font.css" rel="stylesheet" />
<link href="<%=basePath%>assets/css/style.css" rel="stylesheet" />

<link href="<%=basePath%>assets/css/new/style.css" media="all" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome.min.css" />

<!--[if IE 7]>
		  <link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

<script src="<%=basePath%>assets/js/jquery-1.9.1.min.js"></script>
<!-- ace styles -->
<link rel="stylesheet"
	href="<%=basePath%>assets/css/jquery-ui-1.10.3.full.min.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/ace-skins.min.css" />
<style type="text/css">
body,html {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	font-family: "微软雅黑", "Lucida Grande", "Lucida Sans Unicode", Helvetica,
		Arial, Verdana, sans-serif;
}

#nav_model a:hover {
	color: #FB8B1C;
	cursor: pointer;
	text-decoration: none;
	border-bottom: 4px #000 solid;
}
.page-content{
	background-color: #E6E6E6;
}
</style>
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=basePath%>assets/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="<%=basePath%>assets/js/ace-extra.min.js"></script>

<!-- self code-->

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
                   <a href="#" class="navbar-brand">
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
		<div class="main-container-inner ">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span> </a>
			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
				<ul class="nav nav-list">
					<li>
						<a href="#" class="dropdown-toggle">
							<center>
								<span class="menu-text">广告投放</span>
							</center> 
						</a>
					</li>
					<li class="active">
						<a href="#" class="dropdown-toggle">
							<center>
								<span class="menu-text">小秘书</span>
							</center> 
						</a>
					</li>
				</ul>
				<!-- /.nav-list -->
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
						<li><i class="icon-home home-icon"></i> <a
							href="<%=basePath%>admin/index">首页</a></li>
						<li class="orange">用户</li>
						<li class="orange">用户查询</li>
					</ul>
					<!-- .breadcrumb -->
				</div>
				<div class="page-content">
					<div class="page-header">
						<h1>
							<span class="orange2">用户查询</span>
						</h1>
					</div>
					<!-- /.page-header -->
					<div class="row"> 
						<div class="col-lg-12">
			            	<div class="widget-container scrollable chat chat-page">
			              		<div class="contact-list">
			                		<div class="heading">
			                  			Contacts (15)<i class="icon-plus pull-right"></i>
			                		</div>
			                		<ul>
			                  			<li>
			                    			<a href="#"><img width="30" height="30" src="images/avatar-female.png" />Walter White<i class="icon-circle text-danger"></i></a>
			                  			</li>
			               		 	</ul>
			              		</div>
				              	<div class="heading">
				                	<i class="icon-comments"></i>Chat with <a href="#">John Smith</a><i class="icon-cog pull-right"></i><i class="icon-smile pull-right"></i>
				              	</div>
			              		<div class="widget-content padded">
			                		<ul>
			                  			<li>
			                    			<img width="35" height="35" src="<%=basePath %>images/0a0f59b6b6032185c38542e6925f684aeba1dc58/sign.jpg" />
			                    			<div class="bubble">
			                      				<a class="user-name" href="#">John Smith</a>
			                      				<p class="message">
			                       				 Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.
			                      				</p>
			                      				<p class="time">
			                        				<strong>Today </strong>3:53 pm
			                      				</p>
			                    			</div>
			                  			</li>
			                  			<li class="current-user">
			                    			<img width="30" height="30" src="images/avatar-female.jpg" />
			                    			<div class="bubble">
			                      				<a class="user-name" href="#">Jane Smith</a>
			                      				<p class="message">
			                        				Donec odio. Quisque volutpat mattis eros.
			                      				</p>
			                      				<p class="time">
			                        				<strong>Today </strong>3:53 pm
			                      				</p>
			                    			</div>
			                  			</li> 
			                		</ul>
			              		</div>
			              		<div class="row">
			              			<input class="col-sm-6" placeholder="Write your message here…" type="text">
			              			<input type="button" class="btn btn-info" value="发送">
			              		</div>
			            	</div>
			        	</div><!-- Conversation -->
			        </div><!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->
		</div>
	</div>
	<!-- /.main-container <span class="label label-warning arrowed arrowed-right">售完</span>-->

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
			if("ontouchend" in document) document.write("<script src='<%=basePath%>assets/js/jquery.mobile.custom.min.js'>" + "<"+"script>");
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
	<script src="<%=basePath%>assets/js/date-time/bootstrap-timepicker.min.js"></script>
	<script src="<%=basePath%>assets/js/bootstrap-colorpicker.min.js"></script>
	<script src="<%=basePath%>assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
	<script src="<%=basePath%>assets/js/bootstrap-tag.min.js"></script>
	<script src="<%=basePath%>assets/js/jquery.slimscroll.min.js"></script>
	<!-- ace scripts -->

	<script src="<%=basePath%>assets/js/ace-elements.min.js"></script>
	<script src="<%=basePath%>assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		
	</script>
</body>
</html>