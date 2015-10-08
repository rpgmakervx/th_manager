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
		var before_change
		var btn_choose
		var no_icon
		btn_choose = "请选择图片文件";
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
		var file_input = $('#id-input-file-3');
		file_input.ace_file_input('update_settings', {'before_change':before_change, 'btn_choose': btn_choose, 'no_icon':no_icon})
		file_input.ace_file_input('reset_input');
		$("#url").click(function(){
			$("#notice").html("")
		})
		$("#upload").click(function(){
			$("#notice").html("")
			var url = $("#url").val()
			var file = $("#id-input-file-3").val()
			var reg = new RegExp('^(((ht|f)tp(s?))\://)?(www.|[a-zA-Z].)[a-zA-Z0-9\-\.]+\.(com|edu|gov|mil|net|org|biz|info|name|museum|us|ca|uk)(\:[0-9]+)*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$'); 		
			if(file==""){
				$('#id-input-file-3').ace_file_input('update_settings', {'btn_choose': "您还没有选择广告资源哦！！"})
			}
			if(url==""){
				$("#notice").html("<strong class='red'>请填写广告链接！</strong>")
			}else if(!reg.test(url)){
				$("#notice").html("<strong class='red'>广告链接格式有问题！请重新填写</strong>")
			}else{
				$("#form").submit()
			}
		})
	})
	
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
					<li class="active">
						<a href="#" class="dropdown-toggle">
							<center>
								<span class="menu-text">广告投放</span>
							</center> 
						</a>
					</li>
					<li >
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
						<li class="orange">运营</li>
						<li class="orange">广告投放</li>
					</ul>
					<!-- .breadcrumb -->
				</div>
				<div class="page-content">
					<div class="page-header">
						<h1>
							<span class="orange2">广告投放</span>
						</h1>
					</div>
					<!-- /.page-header -->
					<div class="row"> 
						<div class="col-sm-6 col-sm-offset-3">
							<div class="widget-box">
								<div class="widget-header">
									<h4>在此处添加广告资源</h4>
									<form id="form" enctype ="multipart/form-data" action="<%=basePath%>advertise/adv" method="post">
										<div class="widget-body">
											<div class="widget-main">
												<input type="file" id="id-input-file-3" name="file" required/>
												<input type="text" id="url" placeholder="输入广告地址" name="url" class="col-sm-8" required  />
												<span class="col-sm-4" id="notice"></span>
												<div class="space-20"></div>
												<button class="btn btn-info" id="upload" type="button" >
													<i class="icon-ok bigger-100"></i>
													Submit
												</button>
												<span class="notification">${adv_notification}</span>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
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
		$('#id-input-file-3').ace_file_input({
				style:'well',
				btn_choose:'sss',
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
			
			
	</script>
</body>
</html>