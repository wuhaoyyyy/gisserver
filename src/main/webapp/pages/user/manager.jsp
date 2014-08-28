<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/inctaglib.jsp"%>
<!DOCTYPE html>
<html lang="ch">
	<head>
	<meta name="decorator" content="default" />
<%-- 	<link rel="stylesheet" href="${syspath}/css/jqGrid.css" media="screen"> --%>

<!-- <link rel="stylesheet" href="http://demo.sc.chinaz.com/Files/DownLoad/moban/201312/chahua3109/assets/css/ace.min.css" media="screen"> -->
<!-- <link rel="stylesheet" href="http://demo.sc.chinaz.com/Files/DownLoad/moban/201312/chahua3109/assets/css/ace-rtl.min.css" media="screen"> -->
<!-- <link rel="stylesheet" href="http://demo.sc.chinaz.com/Files/DownLoad/moban/201312/chahua3109/assets/css/ace-skins.min.css" media="screen"> -->
<%-- <link rel="stylesheet" href="${syspath}/css/jqGrid.css" media="screen"> --%>



<!-- <script src="http://demo.sc.chinaz.com/Files/DownLoad/moban/201312/chahua3109/assets/js/ace-extra.min.js"></script> -->
<!--     <script src="http://demo.sc.chinaz.com/Files/DownLoad/moban/201312/chahua3109/assets/js/jqGrid/jquery.jqGrid.min.js"></script> -->
<!-- 	<script src="http://demo.sc.chinaz.com/Files/DownLoad/moban/201312/chahua3109/assets/js/typeahead-bs2.min.js"></script> -->
<!-- 	<script src="http://demo.sc.chinaz.com/Files/DownLoad/moban/201312/chahua3109/assets/js/ace-elements.min.js"></script> -->
<!-- 	<script src="http://demo.sc.chinaz.com/Files/DownLoad/moban/201312/chahua3109/assets/js/ace.min.js"></script> -->
<!-- 	<script src="http://demo.sc.chinaz.com/Files/DownLoad/moban/201312/chahua3109/assets/js/jqGrid/i18n/grid.locale-en.js"></script> -->
	<%@ include file="/common/include.jsp" %>
	<title>Insert title here</title>  
	<style type="text/css">
		.pagination{
			margin:0px;
		}
	</style>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").attr("action",path+"/user/manager");
			$("#searchForm").submit();
	    	return false;
	    }


	</script>
	</head>  
	<body>  
	  <form:form id="searchForm" action="user/manager" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value=""/>
		<input id="pageSize" name="pageSize" type="hidden" value=""/>
		<input id="orderBy" name="orderBy" type="hidden" value=""/>
		<div>
			<label>登录名：</label><input type="text"  htmlEscape="false" maxlength="50" class="input-small"/>	
			<label>姓&nbsp;&nbsp;&nbsp;名：</label><input type="text"  htmlEscape="false" maxlength="50" class="input-small"/>
			&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
			&nbsp;<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
			&nbsp;<input id="btnImport" class="btn btn-primary" type="button" value="导入"/>
		</div>
	</form:form>
	    <table class="table table-striped table-bordered table-condensed">  
	        <tr>  
	            <th>用户名</th>  
	            <th>用户权限</th>  
	            <th>用户id</th>  
	        </tr>  
	        <c:forEach items="${page.list}" var="user">
			<tr>
				<td><a href="">${user.username}</a></td>
				<td>${user.userrole}</td>
				<td>${user.userid}</td>
			</tr>
		</c:forEach> 
	    </table>  
	    ${page}

	</body>  
</html>  