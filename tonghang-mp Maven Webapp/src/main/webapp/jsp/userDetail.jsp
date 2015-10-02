<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = path+"/";
	String client_id = (String)request.getAttribute("client_id");
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>同行管理平台</title>
		<meta name="keywords" content="同行" />
		<meta name="description" content="同行" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/daterangepicker.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/jquery-ui.css" />
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
			h1,h2,h3,span,div{
				font-family: "微软雅黑","Lucida Grande", "Lucida Sans Unicode", Helvetica, Arial, Verdana, sans-serif;
			}
			#reason{resize: none; height: 100px;}
			#nav_model a:hover{
				color:#FB8B1C;
				cursor:pointer;
				text-decoration: none; 
				border-bottom:4px #000 solid;
			}
		</style>
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=basePath%>assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="<%=basePath%>assets/js/ace-extra.min.js"></script>
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
                    <a href="<%=basePath %>user/index" class="navbar-brand">
                        <small>
                           	 用户模块
                        </small>
                    </a>
                    <a href="<%=basePath%>advertise/indexs" class="navbar-brand">
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
						<li>
							<a href="<%=basePath%>admin/setting" class="dropdown-toggle">
								<center><span class="menu-text">用户查询</span></center>
							</a>
						</li>
						<li>
							<a href="<%=basePath%>feedback/index" class="dropdown-toggle">
								<center><span class="menu-text">信息反馈</span></center>
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
							<li>
								<i class="icon-home home-icon"></i>
								<a href="<%=basePath%>admin/index">首页</a>
							</li>
							<li class=""><a href="<%=basePath%>user/index">用户</a></li>
							<li class="orange">用户查询</li>
						</ul><!-- .breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								<span class="orange2">用户详情</span>
							</h1>
						</div><!-- /.page-header -->
                        <div>
                            <div id="user-profile-2" class="user-profile">
                                <div class="tabbable">
                                    <ul class="nav nav-tabs padding-18">
                                        <li class="active">
                                            <a data-toggle="tab" href="#home">
                                                <i class="green icon-user bigger-120"></i>
                                                		个人资料
                                            </a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#friends">
                                                <i class="blue icon-group bigger-120"></i>
                                               			 好友
                                            </a>
                                        </li>
                                    </ul>

                                    <div class="tab-content no-border padding-24">
                                        <div id="home" class="tab-pane in active">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-3 center">
                                                    <span class="profile-picture">
                                                        <img class="editable img-responsive" id="image" alt="Alex's Avatar" id="avatar2" src="<%=basePath%>assets/avatars/profile-pic.jpg" />
                                                    </span>
                                                </div><!-- /span -->

                                                <div class="col-xs-12 col-sm-9">
                                                    <h4 class="blue">
                                                        <span id="online_color" class="label label-info">
                                                            <i  class="icon-circle smaller-80 align-middle"></i>
                                                            <span id="isonline"></span>
                                                        </span>
                                                    </h4>
													<h4 class="red">
                                                        <span id="isolate_color" class="label label-info">
                                                            <i  class="icon-circle smaller-80 align-middle"></i>
                                                            <span id="isolatnote"></span>
                                                        </span>
                                                    </h4>
                                                    <div class="profile-user-info">
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name"> 昵称 </div>

                                                            <div class="profile-info-value">
                                                                <span id="nickname"></span>
                                                            </div>
                                                        </div>
														<div class="profile-info-row">
                                                            <div class="profile-info-name"> 邮箱 </div>

                                                            <div class="profile-info-value">
                                                                <span id="email"></span>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name"> 联系电话 </div>

                                                            <div class="profile-info-value">
                                                                <span id="phone"></span>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name"> 所在地 </div>

                                                            <div class="profile-info-value">
                                                                <i class="icon-map-marker light-orange bigger-110"></i>
                                                                <span id="place"></span>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">性别 </div>
    
                                                            <div class="profile-info-value">
                                                                <span id="sex"></span>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name"> 年龄 </div>

                                                            <div class="profile-info-value">
                                                                <span id="age"></span>
                                                            </div>
                                                        </div>

                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name"> 创号时间 </div>

                                                            <div class="profile-info-value">
                                                                <span id="created_at"></span>
                                                            </div>
                                                        </div>

                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name"> 上次登录时间 </div>

                                                            <div class="profile-info-value">
                                                                <span id="lase_login_at"></span>
                                                            </div>
                                                        </div>
                                                    </div>
													<div class="hr hr-8 dotted"></div>
                                                    <div class="profile-user-info">
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name"> 标签 </div>
                                                            <div class="profile-info-value" id="labels"></div>
                                                        </div>
                                                    </div>
                                                </div><!-- /span -->
                                            </div><!-- /row-fluid -->

                                            <div class="space-10"></div>
                                            <div class="row">
                                            	<div class="col-sm-2 col-sm-offset-4">
                                                	<a id="operation" data-toggle="modal" href="#myModal" class="btn btn-sm btn-block btn-danger">
                                                        <i class="icon-ban-circle bigger-120"></i>
                                                        <span id="isolate" class="bigger-110"></span>
                                                    </a>
                                                </div>
											</div>	
                                        </div><!-- #home -->
                                        <div id="friends" class="tab-pane">
                                            <div class="profile-users clearfix">
                                                <div class="itemdiv memberdiv">
                                                    <div class="inline position-relative">
                                                        <div class="user">
                                                            <a href="#">
                                                                <img src="" alt="Alexa Doe's avatar" />
                                                            </a>
                                                        </div>
                                                        <div class="body">
                                                            <div class="name">
                                                                <a href="#">
                                                                    <span class="user-status status-offline"></span>
                                                                    Alexa Doe
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div><!-- person mes-->
                                            </div>

                                            <div class="hr hr10 hr-double"></div>

                                            <ul class="pager pull-right">
                                                <li class="previous disabled">
                                                    <a href="#">&larr; Prev</a>
                                                </li>

                                                <li class="next">
                                                    <a href="#">Next &rarr;</a>
                                                </li>
                                            </ul>
                                        </div><!-- /#friends -->
                                    </div>
                                </div>
                            </div>
                        </div>
					</div><!-- /.page-content -->                    
				</div><!-- /.main-content -->
        	</div>
		</div><!-- /.main-container-->
		<div class="modal fade" id="myModal" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
		        	<div class="modal-header">
		            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		                  &times;
		            	</button>
			            <h3 class="modal-title" id="myModalLabel">
			               	<span class='smaller' >用户封号</span>
			            </h3>
		         	</div>
		         	<div class="space-10"></div>
		         	<div align="center"><span><strong>请选择封号时间段</strong></span></div>
		         	<div class="space-10"></div>
	         		<div align="center">
		         		<form id="form" action="<%=basePath%>user/isolate" method="post">
							<div class="row">
								<div class="form-group name">
									<label class="col-sm-3 control-label no-padding-right" for="id-date-picker-1">封号时间段：</label>
									<div class="input-group col-lg-8">
										<input type="hidden" name="admin_id" value="${login_admin.admin_id}"/>
										<input type="hidden" name="client_id" value="<%=client_id%>"/>
										<input class="form-control date-range-picker" type="text" name="duration" id="id-date-range-picker-1" />
										<span class="input-group-addon">
											<i class="icon-calendar bigger-110"></i>
										</span>
									</div>
								</div>
								<div class="col-sm-12"></div>
								<div class="form-group name">
									<label class="col-sm-3 control-label no-padding-right" for="reason">封号原因：</label>
									<div class="input-group col-lg-8 reason">
										<textarea required class="form-control" name="reason" id="reason" rows="3"></textarea>
									</div>
								</div>
							</div>
							<div class="modal-footer ">
								<button class="btn btn-info"  type="submit">
									<i class="icon-ok bigger-120"></i>
									Submit
								</button>
							</div>		
						</form>
					</div>
		      	</div><!-- /.modal-content -->
			</div>
	    </div><!-- /.modal -->
	    <form action="" method=""></form>
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
		<script src="<%=basePath%>assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<%=basePath%>assets/js/date-time/daterangepicker.min.js"></script>
		<script src="<%=basePath%>assets/js/date-time/moment.min.js"></script>
		<script src="<%=basePath%>assets/js/bootstrap-tag.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.validate.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery-ui.js"></script>
		<!-- ace scripts -->

		<script src="<%=basePath%>assets/js/ace-elements.min.js"></script>
		<script src="<%=basePath%>assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<!-- self code-->
		<script type="text/javascript">
			$(function(){
				var time = new Date(); 
				$("#id-date-range-picker-1").daterangepicker({
					format:"YYYY-MM-DD "+time.getHours()+":"+time.getMinutes()+":"+time.getMinutes(),
					minDate:moment().startOf("day")
				})
				$("#id-date-range-picker-1").click(function(){
					time = new Date();
				})
				$.ajax({
					type:"POST",
					url:"<%=basePath%>user/detail/<%=client_id%>",
					dataType:"json",     
					contentType:"application/json",
					success:function(data){
						var user = data.result.user;
						var labels = user.labels;
						$("#image").attr("src",data.result.pic_server+user.image);
						if(user.isonline==1){
							$("#online_color").addClass("label-info");
							$("#isonline").html("在线");						
						}else{
							$("#online_color").removeClass("label-info")
							$("#isonline").html("离线");
						}
						$("#nickname").html(user.username);
						$("#email").html(user.email);
						$("#phone").html(user.phone);
						$("#created_at").html(user.created_at);
						$("#lase_login_at").html(user.lase_login_at);
						$("#age").html(user.age);
						$("#place").html(user.city);
						$("#operation").removeClass("btn-danger");	
						$("#operation").removeClass("btn-info")	;
						if(user.status==0){	
							$("#operation").addClass("btn-info")	;
							$("#isolate_color").addClass("label-danger");
							$("#isolate_color").removeClass("label-info");
							$("#isolatnote").html("已封号");
							$("#operation").attr("href","");	
							$("#operation").attr("onClick","deisolate('<%=client_id%>','${login_admin.admin_id}')");
							$("#isolate").html("解封")	;
						}else{
							$("#operation").addClass("btn-danger");
							$("#isolate_color").removeClass("label-danger");
							$("#isolate_color").addClass("label-info");
							$("#isolatnote").html("正常");
							$("#operation").attr("href","#myModal");
							$("#isolate").html("封号")	;
						}
						labels.forEach(function(lab){
							$("#labels").append("<span class='label label-info'>"+lab+"</span><span class='space-20'></span>");
						})
					}
				})
			})
			
			function deisolate(client_id,admin_id){
				alert("解封")
				if(confirm("确定解封当前用户吗")){
					$.ajax({
						type:"POST",
						url:"<%=basePath%>user/deisolate?admin_id="+admin_id+"&client_id="+client_id,
						dataType:"json",     
						contentType:"application/json",
						success:function(data){
							location.reload(); 
						}
					});
				}
			}
		</script>
</body>
</html>