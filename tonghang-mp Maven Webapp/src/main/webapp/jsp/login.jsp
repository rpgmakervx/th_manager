<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = path+"/";
%>
<html>
<head>
<meta charset="utf-8" />
<title>管理员登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/css/bootstrapValidator.css" />
<style>
body {
	font-family: 'microsoft yahei', Arial, sans-serif;
	background-color: #222;
}
.container-fluid{
margin-top: 10px;
}
.redborder {
	border: 2px solid #f96145;
	border-radius: 2px;
}

.row {
	padding: 20px 0px;
}

.bigicon {
	font-size: 97px;
	color: #f08000;
}

.loginpanel {
	text-align: center;
	width: 300px;
	border-radius: 0.5rem;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: 10px auto;
	background-color: #555;
	padding: 20px;
}

input {
	width: 100%;
	margin-bottom: 17px;
	padding: 15px;
	background-color: #ECF4F4;
	border-radius: 2px;
	border: none;
}

h2 {
	margin-bottom: 20px;
	font-weight: normal;
	color: #EFEFEF;
}

.btn {
	border-radius: 2px;
	padding: 10px;
}

.btn span {
	font-size: 27px;
	color: white;
}

.buttonwrapper {
	position: relative;
	overflow: hidden;
	height: 50px;
}

.lockbutton {
	font-size: 27px;
	color: #f96145;
	padding: 10px;
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

.validateBtn {
	background-color: #f08000;
	width: 100%;
	-webkit-border-top-right-radius: 0;
	-webkit-border-bottom-right-radius: 0;
	-moz-border-radius-topright: 0;
	-moz-border-radius-bottomright: 0;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	left: -260px;
	position: absolute;
	top: 0;
}
#password{width:250px;height:45px;}
#email{width:250px;height:45px;}
</style>
<script type="text/javascript" src="<%=basePath%>assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/bootstrapValidator.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="loginpanel">
				<h2>管理员登录</h2>
				<div>
					<form id="form" action="<%=basePath%>admin/login" method="post">
						<input  name="email" id="email" type="text"
							placeholder="登录账号" required > 
						<input name="password" id="password"
							type="password" placeholder="输入密码" required >
						<div class="buttonwrapper">
							<input type="submit" value="登录" class="btn btn-info">
						</div>
						<div align="right">
							<a data-toggle="modal" href="#myModal">忘记密码？</a>
						</div>
						<div align="center">
							<span ><big><strong>${notification}</strong></big></span>
						</div>
					</form>
				</div>
			</div>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
			      <div class="modal-content">
			         <div class="modal-header">
			            <button type="button" class="close"
			               data-dismiss="modal" aria-hidden="true">
			                  &times;
			            </button>
			            <h4 class="modal-title" id="myModalLabel">
			               	<h3 >忘记密码？</h3>
			            </h4>
			         </div>
			         <h5 align="center">填写邮箱和用户名，我们将重置的密码发送到这个邮箱中</h5>
			         <div align="center">
						<form id="form" action="<%=basePath%>admin/forget" method="post">
							<input style="width:300px;height:40px;" name="email" id="email" type="text" placeholder="输入邮箱账号" required /> 
							<input style="width:300px;height:40px;" name="username"  type="text" placeholder="输入用户名" required />
							<div class="buttonwrapper">
								<input style="width:300px;height:40px;" type="submit" value="确认发送" class="btn btn-info">
							</div>
							<div class="modal-footer ">
					        </div>
						</form>
					</div>
			      </div><!-- /.modal-content -->
			</div>
		</div><!-- /.modal -->
	</div>
</body>
</html>