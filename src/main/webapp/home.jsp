<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/inctaglib.jsp"%>
<!DOCTYPE html>
<html lang="ch">
	<head>
	<meta name="decorator" content="default" />
	<%@ include file="/common/include.jsp" %>
	<style type="text/css">
		#main {padding:0;margin:0;} #main .container-fluid{padding:0 7px 0 1px;}
		#header {margin:0 0 1px;position:static;} #header li {font-size:14px;_font-size:12px;}
		#header .brand {font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:26px;padding-left:1px;}
		#footer {margin:0 0 0 0;padding:3px 0 0 0;font-size:11px;text-align:center;border-top:2px solid #0663A2;}
		#footer, #footer a {color:#999;} 
		
		.navbar {margin-bottom: 1px;}
		.container-fluid {padding-left: 0px;}
		.col-md-2 {padding-left: 1px;}
		.col-md-10 {padding-left: 1px;}
		#contentframe{margin:8px 0 0 0px;}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$("html,body").css({"overflow":"auto","overflow-x":"hidden","overflow-y":"auto"});
			//$("#mainFrame").css({"height":window.screen.height-15-document.getElementById("header").offsetHeight-$('.panel-heading')[0].offsetHeight});
			$("#mainFrame").css({"height":"510"});
			$(".panel-heading a").click(function() {
				if($(this).children('i').hasClass('glyphicon glyphicon-chevron-right')){
					$(this).children('i').removeClass('glyphicon glyphicon-chevron-right');
					$(this).children('i').addClass('glyphicon glyphicon-chevron-down');
				}
				else{
					$(this).children('i').removeClass('glyphicon glyphicon-chevron-down');
					$(this).children('i').addClass('glyphicon glyphicon-chevron-right');
				}
			});
			$(".accordion-body a").click(function() {
				$("#menu li").removeClass("active");
				$("#menu li i").removeClass("icon-white");
				$(this).parent().addClass("active");
				$(this).children("i").addClass("icon-white");
			});
			
			
			if(!$("#openClose").hasClass("close")){
				$("#openClose").click();
			}
			//初始化时让右边栏信息信息
			$(".accordion-body a:first i").click();
			document.getElementById("mainFrame").src=path+"/service/explore";
		});
		function changeRight(url,menuname,id){
			document.getElementById("mainFrame").src=path+url;
			$('#myTab ul li').removeClass("active");
			var a=true;
			$("#myTab ul").find("li").each(function(){      //这里会遍历class为c1下的每一个li元素
				this.bind("click",function(){
					alert("test");
				});
			    if($(this).attr("id")==id){
			    	$(this).addClass("active");
			    	a=false;
			    }
			});
			if(a){
				$("<li class='active' id='"+id+"'><a href='#contentframe' data-toggle='tab'>"+menuname+"<i class='glyphicon glyphicon-remove-circle'></i></a></li>").appendTo($("#myTab ul")[0]);
			}
		}
		
		
		

	</script>
	<title>系统管理-主页</title>
	</head>
	<body>
		<% int message = 0; %> 
		<div id="header" class="navbar navbar-fixed-top">
			<nav class="navbar navbar-default" role="navigation">
			   <div class="navbar-header">
			      <a class="navbar-brand" href="#">who who who who </a>
			   </div>
			   <div>
			      <ul class="nav navbar-nav">
			         <li class="active"><a href="#">首页</a></li>
			         <li><a href="#">未知</a></li>
			         <li class="dropdown">
			            <a href="#" class="dropdown-toggle" data-toggle="dropdown">未知<b class="caret"></b></a>
			            <ul class="dropdown-menu">
			               <li><a href="#">未知</a></li>
			               <li><a href="#">未知</a></li>
			               <li><a href="#">未知 </a></li>
			               <li class="divider"></li>
			               <li><a href="#">未知</a></li>
			               <li class="divider"></li>
			               <li><a href="#">未知</a></li>
			            </ul>
			         </li>
			      </ul>
			   </div>
			</nav>

		</div>
	    <div class="container-fluid" id="main">
			<div id="content" class="row-fluid">
				<!-- 左边栏显示 -->
				<div id="left" class="col-md-2">
					<div class="panel-group" id="menuall"  margin="0 0 0 0" padding="0 0 0 0">
						<c:set var="menuList" value="${menus}" />
						<c:set var="firstMenu" value="true" />
						<c:forEach items="${menus}" var="menu">
							<c:if
								test="${menu.parentid eq '0'}">
								<div class="panel panel-default">
									<div class="panel-heading">
										<a class="accordion-toggle" data-toggle="collapse" data-parent="#menu" href="#collapse${menu.menuid}"
											title="${menu.menuname}"><i class="<%message++; if(message==1){  %>glyphicon glyphicon-chevron-down<%}else {%>glyphicon glyphicon-chevron-right<% }%> "></i>&nbsp;${menu.menuname}</a>
									</div>
									<div id="collapse${menu.menuid}" class="<%if(message==1){ %>panel-collapse collapse in<%}else {%>panel-collapse collapse<% }%>">
										<div class="panel-body">
											<ul class="nav nav-list">
												<c:forEach items="${menus}" var="menuChild">
													<c:if test="${menuChild.parentid eq menu.menuid}">
														<li><a href="#" onclick="javascript:changeRight('${menuChild.url}','${menuChild.menuname}','${menuChild.menuid} }')"><i class="glyphicon glyphicon-${not empty menuChild.icon?menuChild.icon:'glyphicon glyphicon-circle'}"></i>&nbsp;${menuChild.menuname}</a></li>
														<c:set var="firstMenu" value="false" />
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>

				<!-- 右边显示 -->
<!-- 				<div id="openClose" class="close">&nbsp;</div> -->
				<div id="right" class="col-md-10">
	 				<div class="tabbable" id="myTab">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#contentframe" data-toggle="tab">服务列表<i class="glyphicon glyphicon-remove-circle"></i></a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="contentframe">
								<iframe id="mainFrame" name="mainFrame" src="" style="overflow:visible;"
								scrolling="yes" frameborder="no" width="100%">11</iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
      	</div>
	
		<div id="footer" class="row-fluid">
	            Copyright &copy; 2012-2015 - Powered By <a href="https://github.com/thinkgem/jeesite" target="_blank">JeeSite</a> 1.0
		</div>
	</body>
		
	
</html>