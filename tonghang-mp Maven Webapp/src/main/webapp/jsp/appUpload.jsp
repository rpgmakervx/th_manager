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
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets/css/default.css">
<link href="<%=basePath%>assets/css/fileinput.min.css" rel="stylesheet" type="text/css" />	

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
</style>
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=basePath%>assets/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="<%=basePath%>assets/js/ace-extra.min.js"></script>

<!-- self code-->
<script type="text/javascript">
	$(function(){
		$.ajax({
			type:"POST",
			url:"<%=basePath%>app/current",
			dataType:"json",     
			contentType:"application/json",
			success:function(data){
				$("#datas").children().remove();
				var apk = data.result.apk;
				createTable(apk.app_code,apk.app_version,apk.context,apk.upload_at);
			}
		})
	})
	
	function createTable(app_code,app_version,context,upload_at){
		$("#datas").append("<tr class='"+app_code+app_version+"'></tr>");
		$("#datas").children(":last").append("<td>"+upload_at+"</td>");
		$("#datas").children(":last").append("<td>"+app_code+"</td>");
		$("#datas").children(":last").append("<td>"+app_version+"</td>");
		$("#datas").children(":last").append("<td>"+context+"</td>");
		$("#datas").children(":last").append("<td><a href=''>更新</a> | <a href='#'>启动</a></td>");
	}
</script>
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
               	<a href="<%=basePath%>admin/index" class="navbar-brand">
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
		<div class="main-container-inner ">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span> </a>
			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
				<ul class="nav nav-list">
					<li >
						<a href="<%=basePath%>admin/index" class="dropdown-toggle">
							<center><span class="menu-text">app控制台</span></center>
						</a>
					</li>
					<li class="active">
						<a href="#" class="dropdown-toggle">
							<center><span class="menu-text">app版本管理</span></center>
						</a>
					</li>
					<li>
						<a href="<%=basePath%>backup/index" class="dropdown-toggle">
							<center><span class="menu-text">数据备份和还原</span></center>
						</a>
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
						<li><i class="icon-home home-icon"></i> <a
							href="<%=basePath%>admin/index">全局</a></li>
						<li class="orange">版本管理</li>
					</ul>
					<!-- .breadcrumb -->
				</div>
				<div class="page-content">
					<div class="page-header">
						<h1>
							<span class="orange2">app版本控制</span>
						</h1>
					</div>
					<!-- /.page-header -->
					<div class="row"> 
						<div class="col-xs-12">
							<h3 class="header smaller lighter blue"><b>当前版本</b></h3>
							<div class="table-responsive">
								<table id="sample-table-2" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>上传日期</th>
											<th>code</th>
											<th>version</th>
											<th>版本文案</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="datas">													
									</tbody>
								</table>
							</div> 
						</div><!-- table div--> 
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
	<script src="<%=basePath%>assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
	<script src="<%=basePath%>assets/js/bootstrap-tag.min.js"></script>
	<script src="<%=basePath%>assets/js/fileinput.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>assets/js/fileinput_locale_zh.js" type="text/javascript"></script>
	<!-- ace scripts -->

	<script src="<%=basePath%>assets/js/ace-elements.min.js"></script>
	<script src="<%=basePath%>assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	</script>
</body>
</html>