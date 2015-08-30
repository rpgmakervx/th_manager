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
		<link rel="stylesheet" href="<%=basePath%>assets/css/datepicker.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap-timepicker.css" />

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
						<li>
							<a href="<%=basePath%>admin/index" class="dropdown-toggle">
								<center><span class="menu-text">app控制台</span></center>
							</a>
						</li>
						<li class="active">
							<a href="#" class="dropdown-toggle">
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
								<a href="<%=basePath%>admin/index">首页</a>
							</li>
							<li class="orange">全局</li>
							<li class="orange">数据备份和还原</li>
						</ul><!-- .breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								<span class="orange2">数据备份和还原</span>
							</h1>
						</div><!-- /.page-header -->
						<h4>
							<span class="blue">数据备份</span>
						</h4>
						<div class="row">
							<div class="col-lg-12" >
	                            <div class="col-lg-6">
	                            	<div class="col-md-8">
										<button class="btn btn-info" type="button" id="backup">
											<i class="icon-ok bigger-100"></i>
											数据备份
										</button>
									</div>
									<div class="col-md-4">
										<span id="bak_note"></span>
									</div>
	                            </div>
                       		</div>
						</div><!-- /.row -->
						<hr/>
						<h4>
							<span class="blue">数据还原</span>
						</h4>
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-6">
	                                <div class="col-xs-8 col-sm-11">
										<label for="id-date-picker-1">选择日期</label>
										<div class="row">
											<div class="col-xs-8 col-sm-11">
												<div class="input-group">
													<input class="form-control date-picker" id="id-date-picker-1" readonly type="text" data-date-format="yyyy-mm-dd" />
													<span class="input-group-addon">
														<i class="icon-calendar bigger-110"></i>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-12">
                            			<div class="block-h-2"></div>
                            		</div>
									<div class="col-md-10">
										<button id="recover" class="btn btn-info" type="button" >
											<i class="icon-ok bigger-100"></i>
											数据恢复
										</button>
									</div>
									<div class="col-md-4">
										<span id="rec_note"></span>
									</div>
	                            </div>
							</div>
						</div>
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
		<script src="<%=basePath%>assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script src="<%=basePath%>assets/js/date-time/bootstrap-timepicker.min.js"></script>
		<script src="<%=basePath%>assets/js/date-time/moment.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.sparkline.min.js"></script>
		<script src="<%=basePath%>assets/js/flot/jquery.flot.min.js"></script>
		<script src="<%=basePath%>assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="<%=basePath%>assets/js/flot/jquery.flot.resize.min.js"></script>

		<!-- ace scripts -->

		<script src="<%=basePath%>assets/js/ace-elements.min.js"></script>
		<script src="<%=basePath%>assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			$(function(){
				$(".date-picker").datepicker({  
    				 endDate:new Date()+1
				})
				$("#backup").click(function(){
					$("#bak_note").html("");
					$.ajax({
						type:"POST",
						url:"<%=basePath%>backup/backupData",
						dataType:"json",     
						contentType:"application/json",
						success:function(data){
							if(data.result.code==200)
								$("#bak_note").html("<strong class='green' >"+data.result.message+"</strong>");
							else $("#bak_note").html("<strong class='red' >"+data.result.message+"</strong>");
						}
					})
				})
				$("#recover").click(function(){
					$("#rec_note").html("");
					var date = $("#id-date-picker-1").val();
					var json = {date:date};
					$.ajax({
						type:"POST",
						url:"<%=basePath%>backup/recoverData",
						dataType:"json",     
						contentType:"application/json",
						data:JSON.stringify(json),
						success:function(data){
							if(data.result.code==200)
								$("#rec_note").html("<strong class='green' >"+data.result.message+"</strong>");
							else $("#rec_note").html("<strong class='red' >"+data.result.message+"</strong>");
						}
					})
				})
			})
		</script>
</body>
</html>