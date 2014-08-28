<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/inctaglib.jsp"%>
<html lang="ch">
<head>
<meta charset="UTF-8">
	<%@ include file="/common/include.jsp" %>
	<style>
			html { 
	        background: url(images/back.png) no-repeat center center fixed; 
			  -webkit-background-size: cover;
			  -moz-background-size: cover;
			  -o-background-size: cover;
			  background-size: cover;
			}
			body{
				padding-top:20px;
				font-size:16px;
				font-family: "Open Sans",serif;
				background: transparent;
			}
			h1 {
	            font-family: "Abel", Arial, sans-serif;
	            font-weight: 400;
	            font-size: 40px;
	        }
	 .container{
	       		width:500px;
		        margin:120px 450px 20px;
	        }
	        .panel {
	            background-color: rgba(0, 0, 0, 0.4);
	            border: 0px solid transparent;
	            border-radius: 14px;
	        }
	        .input-group{
	        	margin:25px 120px;
	        }
	       
	        .checkbox{
	      		margin:30px 150px;
	        }
	       .checkbox.inline input[type="checkbox"] {
				  float: none;
				  margin-top: -3px;
			}
	</style>
	<title>系统管理-登陆</title>
</head>
	<body>
		<div class="container panel panel-default">
			<div class="row">
				<div class="span4"></div>
				<div class="span4">
					<h1 style="margin:50px 0 20px" align="center"><span style="color:#08c;">系统登陆</span></h1>
					<hr width="80%" color="red" size="3">
					<form action="login3.do" method="post" class="margin-base-vertical">
				
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-link"></span></span>
	                      <input type="text" class="form-control input-md" id="username" name="username"  class="required" placeholder="登录名">
						</div>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
	                      <input type="password" class="form-control input-md" id="userpsw" name="userpsw"  class="required" placeholder="密码">
						</div>
						<label class="checkbox inline">
	                        <input type="checkbox" id="rememberMe" name="rememberMe"> <span style="color:#08c;">记住我</span>
	                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-primary" type="submit" value="登 录"/>
	                    </label>
	                    
					</form>	
				</div>
				<div class="span4"></div>
			</div>
		</div>
		  <footer class="white navbar-fixed-bottom">
		Copyright &copy; 2012-2013 <a href="/jeesite3/f">JeeSite Admin</a> - Powered By <a href="https://github.com/thinkgem/jeesite" target="_blank">JeeSite</a> V1.1.0
    </footer>
	</body>
</html>