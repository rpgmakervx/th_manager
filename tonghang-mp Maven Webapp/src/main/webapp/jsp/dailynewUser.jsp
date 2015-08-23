<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>同行后台管理系统</title>
		<meta name="keywords" content="同行" />
		<meta name="description" content="同行" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/daterangepicker.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<script src="<%=basePath%>assets/js/jquery-1.9.1.min.js"></script>
		<script src="<%=basePath%>assets/js/echarts-all.js"></script>
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
			#chart{
				height:400px;
			}
		</style>
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=basePath%>assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="<%=basePath%>assets/js/ace-extra.min.js"></script>
		<!-- core function self definition -->
		<script type="text/javascript">
			
		</script>
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
                    <a href="<%=basePath %>user/index" class="navbar-brand">
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
						<li class="" class="dropdown-toggle">
							<a href="<%=basePath%>admin/setting" class="dropdown-toggle">
								<center><span class="menu-text">用户分析</span></center>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu visible-lg">
								<li>
									<a href="<%=basePath%>statistic/index">
										<center>活跃用户</center>
									</a>
								</li>
                                <li class="active">
									<a href="#">
										<center>新增用户</center>
									</a>
								</li>
								<li>
									<a href="<%=basePath %>statistic/dailyall"">
										<center>每日总用户</center>
									</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="<%=basePath %>statistic/remain" >
								<center><span class="menu-text">留存分析</span></center>
							</a>
						</li>
						<li>
							<a href="#" >
								<center><span class="menu-text">渠道分析</span></center>
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
							<li class="orange"><a href="<%=basePath%>statistic/index" >统计模块</a></li>
							<li class="orange">用户分析</li>
							<li class="orange">新增用户</li>
						</ul><!-- .breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								<span class="orange2">新增用户</span>
							</h1>
						</div><!-- /.page-header -->
						<div class="row">
							<div class="col-sm-4 col-sm-offset-8">
								<label class="col-sm-4 control-label no-padding-right" for="id-date-picker-1">选择时间段：</label>
								<div class="input-group col-lg-9">
									<input class="form-control date-range-picker" type="text" name="duration" id="id-date-range-picker-1" />
									<span class="input-group-addon">
										<i class="icon-calendar bigger-110"></i>
									</span>
								</div>
							</div>  
							<div class="col-sm-12"> 
								<div id="chart"></div>
							</div>
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
		<script src="<%=basePath%>assets/js/date-time/daterangepicker.min.js"></script>
		<script src="<%=basePath%>assets/js/date-time/moment.min.js"></script>
		<script src="<%=basePath%>assets/js/date-time/daterangepicker.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.maskedinput.min.js"></script>
		<script src="<%=basePath%>assets/js/bootstrap-tag.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.validate.min.js"></script>
		<!-- ace scripts -->

		<script src="<%=basePath%>assets/js/ace-elements.min.js"></script>
		<script src="<%=basePath%>assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			$(function(){
				var jsonnull = {"":""};
				$.ajax({
					type:"POST",
					url:"<%=basePath%>statistic/dailyUser",
					dataType:"json",     
					contentType:"application/json",
					data:JSON.stringify(jsonnull),
					success:function(data){
						var numbers = data.result.numbers;
						var myChart = echarts.init(document.getElementById("chart")); 
				        var option = {
							title:{
					            text: "同行后台用户数据统计",
								align:'center'
							},
				            tooltip: {
				                show: true
				            },
				            xAxis : [
				                {
				                    type : 'category',
				                    data : [showdate(-6),showdate(-5),showdate(-4),showdate(-3),showdate(-2),showdate(-1),showdate(0),],
									splitLine:{
										show:false
									}
				                }
				            ],
				            yAxis : [
				                {
				                    type : 'value',
									axisLabel:{
										show:true,
										formatter:function(value){
											return value+"个"
										},
									}
				                }
				            ],
				            series : [
				                {
				                    "name":"新增人数",
				                    "type":"line",
				                    "data":numbers,
				                }
				            ],
							legend: {
				                data:["新增人数"],
								orient:'horizontal'
				            },
				        };
				        // 为echarts对象加载数据 
				        myChart.setOption(option);
					}
				});
				$("#id-date-range-picker-1").daterangepicker({
					format:"YYYY-MM-DD",
					maxDate:moment().startOf("day")
				})
				$(".applyBtn").click(function(){
					var begin = $("input[name='daterangepicker_start']").val();
					var end = $("input[name='daterangepicker_end']").val();
					var duration = begin+" - "+end
					var json = {duration:duration};
					$.ajax({
						type:"POST",
						url:"<%=basePath%>statistic/dailyUser",
						dataType:"json",     
						contentType:"application/json",
						data:JSON.stringify(json),
						success:function(data){
							var numbers = data.result.numbers;
							var myChart = echarts.init(document.getElementById("chart")); 
					        var option = {
								title:{
						            text: "同行后台数据统计",
									align:'center'
								},
					            tooltip: {
					                show: true
					            },
					            xAxis : [
					                {
					                    type : 'category',
					                    data :buildXdate(new Date(begin),new Date(end)),
										splitLine:{
											show:false
										}
					                }
					            ],
					            yAxis : [
					                {
					                    type : 'value',
										axisLabel:{
											show:true,
											formatter:function(value){
												return value+"个"
											},
										}
					                }
					            ],
					            series : [
					                {
					                    "name":"新增人数",
					                    "type":"line",
					                    "data":numbers,
					                }
					            ],
								legend: {
					                data:["新增人数"],
									orient:'horizontal'
					            },
					        };
					        // 为echarts对象加载数据 
					        myChart.setOption(option);
						}
					})
				});
			})
	        function showdate(n){
				var uom = new Date();
				uom.setDate(uom.getDate()+n);
				uom = uom.getFullYear() + "-" + (uom.getMonth()+1) + "-" + uom.getDate();
				return uom;
			}
			function self_define_date(date){
				var uom = new Date(date);
				uom = uom.getFullYear() + "-" + (uom.getMonth()+1) + "-" + uom.getDate();
				return uom;
			}
			function buildXdate(begin,end){
				var result = new Array(); 
				var loop = parseInt(Math.abs(end - begin)/1000/60/60/24+1);
				for(var index = 0;index<=loop;index++){
					result[index] = self_define_date(begin);
					begin.setDate(begin.getDate()+1);
				}
				return result;
			}
	    </script>
</body>
</html>