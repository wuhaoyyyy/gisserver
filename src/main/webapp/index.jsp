<%@ include file="/common/include.jsp" %>
<html lang="ch">
<head>

<meta charset="UTF-8">

	<link rel="stylesheet" href="js/bootstrap-3.1.1-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="js/bootstrap-3.1.1-dist/css/bootstrap-theme.min.css">
	<script src="js/jquery-1.9.1/jquery-1.9.1.min.js"></script>
	<script src="js/bootstrap-3.1.1-dist/js/bootstrap.min.js"></script>

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
	
	        .margin-base-vertical {
	            margin: 60px 0;
	        }
	        .panel {
	            background-color: rgba(255, 255, 255, 0.9);
	        }
	</style>
	<title>系统管理-登陆</title>
</head>
	<body>
		<div class="row"></div>
		<div class="row">
			<div class="col-md-4 col-md-offset-4 panel panel-default">
				<h1 class="margin-base-vertical">系统登陆</h1>
				
				<form action="1.php" method="post" class="margin-base-vertical">
			
					<p class="input-group">
						<span class="input-group-addon"><span class="glyphicon glyphicon-link"></span></span>
                      <input type="text" class="form-control input-lg" id="username" name="username"  class="required" placeholder="登录名">
					</p>
					<p class="input-group">
						<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                      <input type="password" class="form-control input-lg" id="password" name="password"  class="required" placeholder="密码">
					</p>
					<label class="checkbox inline">
                        <input type="checkbox" id="rememberMe" name="rememberMe"> <span style="color:#08c;">记住我</span>
                    </label>
                    <input class="btn btn-primary" type="submit" value="登 录"/>
				</form>	
			</div>
		</div>
	</body>
</html>