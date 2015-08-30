<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
		<link rel="stylesheet" href="<%=basePath%>assets/css/jquery-ui-1.10.3.full.min.css" />
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
		<script src="<%=basePath%>assets/js/ace-extra.min.js"></script>
		
		<!-- self code-->
		<script type="text/javascript">
			$(function(){
				$.ajax({
					type:"POST",
					url:"<%=basePath%>user/checkAllUser?pageindex=1",
					dataType:"json",     
					contentType:"application/json",
					success:function(data){
						$("#datas").children().remove();
						var list= data.result.users;
						if(list.length!=0){
							for(var index=0;index<list.length;index++){
								var user = list[index];
								createTable(user.client_id,user.username,user.sex,user.email,user.city,user.phone,user.status);
							}
							$("#account").html(data.result.account)
							ACCOUNT = data.result.account;
							PAGES = parseInt((ACCOUNT+SIZE-1)/SIZE);
							if(PAGES<SIZE)
								createPage(1,PAGES);
							else createPage(1,PAGESIZE);
						}else{
							$("#datas").children().remove()
							$("#datas").append("<tr></tr>");
							$("#datas").children(":last").append("<td colspan=6 align='center'><strong class='red'>没有更多数据了！</strong></td>");
							$("#account").html(data.result.account)
							createPage(1,1);
						}
					}
				});
			})
			function searchflush(pageindex){
				var name = $("#search_name").val()	;
				var label_name = $("#search_label_name").val()	;	
				var json = {name:name,label_name:label_name};	
				$.ajax({
					type:"POST",
					url:"<%=basePath%>user/checkUser?pageindex="+parseInt(pageindex),
					dataType:"json",     
					contentType:"application/json",     
					data:JSON.stringify(json),
					success:function(data){
						$("#datas").children().remove();
						var list= data.result.users;
						if(list.length!=0){
							for(var index=0;index<list.length;index++){
								var user = list[index];
								createTable(user.client_id,user.username,user.sex,user.email,user.city,user.phone,user.status);
							}
							$("#account").html(data.result.account)
							ACCOUNT = data.result.account;
							PAGES = parseInt((ACCOUNT+SIZE-1)/SIZE);
							if(PAGES<SIZE)
								createPage(1,PAGES);
							else createPage(1,PAGESIZE);
						}else{
							$("#datas").children().remove()
							$("#datas").append("<tr></tr>");
							$("#datas").children(":last").append("<td colspan=6 align='center'><strong class='red'>没有更多数据了！</strong></td>");
							$("#account").html(data.result.account)
							createPage(1,1);
						}
					}
				});
			}
			/**
			*	业务功能：点击搜索icon后，刷新分页按键以及搜索总数等信息
			*/
			function search(pageindex){
				var name = $("#search_name").val()	;	
				var label_name = $("#search_label_name").val()	;	
				var json = {name:name,label_name:label_name};	
				$.ajax({
					type:"POST",
					url:"<%=basePath%>user/checkUser?pageindex="+parseInt(pageindex),
					dataType:"json",     
					contentType:"application/json",     
					data:JSON.stringify(json),
					success:function(data){
						$("#datas").children().remove();
						var list= data.result.users;
						if(list.length!=0){
							for(var index=0;index<list.length;index++){
								var user = list[index];
								createTable(user.client_id,user.username,user.sex,user.email,user.city,user.phone,user.status);
							}
							$("#account").html(data.result.account)
						}else{
							$("#datas").children().remove()
							$("#datas").append("<tr></tr>");
							$("#datas").children(":last").append("<td colspan=6 align='center'><strong class='red'>没有更多数据了！</strong></td>");
							$("#account").html(data.result.account)
							createPage(1,1);
						}
					}
				});
			}
			/**
			* 业务功能：根据数据动态生成表格
			*
			*/
			function createTable(client_id,username,sex,email,city,phone,status){
				$("#datas").append("<tr class='"+client_id+"'></tr>");
				$("#datas").children(":last").append("<td>"+username+"</td>");
				$("#datas").children(":last").append("<td>"+sex+"</td>");
				$("#datas").children(":last").append("<td>"+email+"</td>");
				$("#datas").children(":last").append("<td>"+city+"</td>");
				$("#datas").children(":last").append("<td>"+phone+"</td>");
				if(status==1)
					$("#datas").children(":last").append("<td>正常</td>");
				else $("#datas").children(":last").append("<td>封号</td>");
				$("#datas").children(":last").append("<td><form action='<%=basePath%>user/"+client_id+"' method='POST'><button type='submit' class='btn btn-error btn-sm' >查看更多信息</button></form></td>");
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
                	<a href="<%=basePath %>admin/index" class="navbar-brand">
                        <small>
                            	全局模块
                        </small>
                    </a>
                    <a href="#" class="navbar-brand">
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
							<a href="<%=basePath%>user/index" class="dropdown-toggle">
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
							<li class="orange">用户</li>
							<li class="orange">用户查询</li>
						</ul><!-- .breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								<span class="orange2">用户查询</span>
							</h1>
						</div><!-- /.page-header -->
						<div class="row">
                            <div class="col-xs-12">
								<h3 class="header smaller lighter blue"><b>全部用户信息概况</b></h3>
                                <div class="table-header">
                                	<span class="input-icon">
                                        <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                            <input id="search_name" type="text" name="attribute" class="grey" placeholder="用户名" class="nav-search-input" id="nav-search-input" autocomplete="off" />
                                            <input id="search_label_name" type="text" name="attribute" class="grey" placeholder="标签" class="nav-search-input" id="nav-search-input" autocomplete="off" />
                                            <a class="orange" href="javascript:searchflush(1)">
                                                <i class="icon-search bigger-130"></i>
                                            </a>
                                        </div>
                                    </span>
                                </div>
								<div class="table-responsive">
									<table id="sample-table-2" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>昵称</th>
                                                <th>性别</th>
												<th>邮箱</th>
												<th class="hidden-580">籍贯</th>
												<th class="hidden-580">电话</th>
												<th>状态</th>
                                                <th></th>
											</tr>
										</thead>
										<tbody id="datas">													
										</tbody>
									</table>
								</div> 
                                  
							</div><!-- table div--> 
                            <div class="table-foot row">
                            	<span class="col-md-3">
                                	<div class="space-10"></div>
                                	<div class="numbers">
                                    	&nbsp;&nbsp;&nbsp;<b>总人数：<span id="account"></span></b>
                                    </div>
                                </span>
                                <span class="col-md-3 col-sm-offset-6">
                                	<div class="page-divider">
                                    	<ul class="pagination" id="page-divider">
                                            <li class="disabled" id="Previous"><a href="javascript:pre_page()" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                       <!-- <li id="p1"class="active"><a href="javascript:page_divider(1)">1 </a></li>
                                            <li id="p2"><a href="javascript:page_divider(2)">2</a></li>
                                            <li id="p3"><a href="javascript:page_divider(3)">3</a></li>
                                            <li id="p4"><a href="javascript:page_divider(4)">4</a></li>
                                            <li id="p5"><a href="javascript:page_divider(5)">5</a></li>-->
                                            <li id="Next"><a href="javascript:next_page()" aria-label="Next"><span aria-hidden="true">»</span></a></li>   
                                   		</ul>
                                   	</div>
                                </span>
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
		<script src="<%=basePath%>assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script src="<%=basePath%>assets/js/date-time/bootstrap-timepicker.min.js"></script>
		<script src="<%=basePath%>assets/js/bootstrap-colorpicker.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
		<script src="<%=basePath%>assets/js/bootstrap-tag.min.js"></script>
		<script src="<%=basePath%>assets/js/jquery.validate.min.js"></script>
		<!-- ace scripts -->

		<script src="<%=basePath%>assets/js/ace-elements.min.js"></script>
		<script src="<%=basePath%>assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			/**
			*	自定义分页控件相关的概念：
			*
			*一个分页键 指 在页面上显示的每个分页数字对应的那个控件。
			*分页大小 是指一个html页面上有几个分页键。
			*数据页 指的是所有从后台反馈来的数据，分页显示，一页叫做一个数据页。
			*总页数 指 一共需要几个分页键
			*当前分页 指 处于class属性为active的那个分页键的值
			*页尾 值 最后一个分页键
			*/
			//分页部分业务逻辑，分页按键不包括next和previous
			/*每页显示的用户数据行数*/
			var SIZE = 10;
			/*分页按键一页面的个数*/
			var PAGESIZE = 5;
			/*服务器返回的数据总条数*/
			var ACCOUNT = 0;
			/*总页数*/
			var PAGES = 0;
			/**
			*	nowpage：当前所在第几页
			*	pages：当前这一页需要几个分页按键
			*	生成 分页按键 时第一个按键置为高亮，按键 class属性名 均为 p* , * 代表当前分页
			*	生成完后考虑一种情况：当前分页 值 等于总页数，即到达最后一个数据页，此时Next需要被禁用。
			*/
			function createPage(nowpage,pages){
				$("#Previous").nextAll().not("#Next").remove();
				for(var index=(nowpage-1)*PAGESIZE;index<pages+(nowpage-1)*PAGESIZE;index++){
					if(index%PAGESIZE==0)
						$("#Next").before("<li id='p"+(index+1)+"'class='active'><a href='javascript:page_divider("+(index+1)+")'>"+(index+1)+"</a></li>");
					else $("#Next").before("<li id='p"+(index+1)+"'class=''><a href='javascript:page_divider("+(index+1)+")'>"+(index+1)+"</a></li>");
				}
				var page_index = parseInt($("#page-divider").children(".active").children().html());
				if(page_index==PAGES){
					$("li#Next").addClass("disabled");
				}
			}
			/**
			*	page_index：当前在第一个分页按键上
			*	通过判断当前位置，跳到下一个位置。
			*	当当前位置是5的倍数时。跳到1的位置，同时向前键失效
			*	当当前位置是在最后一组分页控件所在的页的时候，到达最后一个分页控件时，向后键失效
			*/
			function page_divider(page_index){
//				alert("num: "+num+"  page_index: "+page_index)
				$("#page-divider li").not("#Previous").not("#Next").removeClass("active");
				$("li#p"+page_index).addClass("active");
				if(page_index==1){
					$("li#Previous").addClass("disabled");
					$("li#Next").removeClass("disabled");
				}else if(page_index==PAGES){
					$("li#Next").addClass("disabled");
					$("li#Previous").removeClass("disabled");
				}else{
					$("li#Previous").removeClass("disabled");
					$("li#Next").removeClass("disabled");
				}
				search(page_index);
			}
			//在这里我有两个方案处理翻到尾页和首页
			/**
			*检查Next键是不是禁用，禁用则不给予点击事件
			
			*不是禁用则获取一下当前位置(分页键的值)，
			*	1.如果是 分页大小 的倍数，则表示按下Next键是进入下一组 分页键，则需要先删除页面上的 分页组，重绘一遍。
			*	之后需要看看重绘的时候，绘制几个 分页键，如果 总页数 - 当前分页 大于 分页大小，则表明 下一页不是最后一个 数据页；
			*	反之表示下一页是最后一个数据页。该动作会影响下一页的显示，下一页是最后一个数据页，则显示 总页数 - 当前分页 等值个数的 分页键；
			*	反之显示 和分页大小 等值个数的 分页键。
			*	重绘完检查如果 当前分页+1 正好是 页尾，则 Next键被禁用。
			*
			*	2.不是倍数则说明按下Next键不会进入下一个分页组，则正常的调用page_divider(pageindex)前进一页
			*
			*/
			function next_page(){
				if($("#Next").hasClass("disabled")){
					$("#Next > a").attr("href","javascript:void(0)");
/*					$("#datas").children().remove()
					$("#datas").append("<tr></tr>");
					$("#datas").children(":last").append("<td colspan=7 align='center'><strong class='red'>没有更多数据了！</strong></td>");*/				
				}else{
					var pageindex = parseInt($("#page-divider").children(".active").children().html());
					if(pageindex%PAGESIZE==0){
						$("#Previous").next().nextAll().not("#Next").remove();
						if(PAGES-pageindex>PAGESIZE)
							createPage((pageindex/PAGESIZE)+1,PAGESIZE);
						else createPage((pageindex/PAGESIZE)+1,PAGES-pageindex);
						//重绘分页按键后发现最后一页只有一个，即当前分页按键的值为最大值，则禁用下一页按键
						
					}else{
						page_divider(pageindex+1);
					}
					//此处加上发请求的部分
					search(pageindex+1);
				}
			}
			/**
			*检查Next键是不是禁用，禁用则不给予点击事件
			
			*不是禁用则获取一下当前位置(分页键的值)，
			*	1.如果是 分页大小 的倍数，则表示按下Next键是进入上一组 分页键，则需要先删除页面上的 分页组，重绘一遍。
			*	因为向前翻页不会出现 分页键 不足 分页大小的情况，所以重绘时一律生成分页大小 数量的 分页键。并传入当前
			*	在第几个数据页，并
			*	重绘完检查如果 当前分页+1 正好是 页尾，则 Next键被禁用。
			*
			*	最后调用page_divider(pageindex-1); 向前移动一个分页键 
			*
			*/
			function pre_page(){
				if($("#Previous").hasClass("disabled")){
					$("#Previous > a").attr("href","javascript:void(0)")
/*					$("#datas").children().remove()
					$("#datas").append("<tr></tr>");
					$("#datas").children(":last").append("<td colspan=7 align='center'><strong class='red'>没有更多数据了！</strong></td>");*/				
				}else{
					var pageindex = parseInt($("#page-divider").children(".active").children().html());
					if((pageindex-1)%PAGESIZE==0){
						$("#Previous").next().nextAll().not("#Next").remove();
						createPage(parseInt((pageindex/PAGESIZE)),PAGESIZE);
					}
					page_divider(pageindex-1);
					//此处加上发请求的部分
					search(pageindex-1);
				}
			}
		</script>
</body>
</html>