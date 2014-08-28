<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/inctaglib.jsp"%>
<!DOCTYPE html>
<html lang="ch">
	<head>
	<meta name="decorator" content="default" />
	<%@ include file="/common/include.jsp" %>
	<title>Insert title here</title>  
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loading").css('display','none');
		});
		function serviceOperation(name,type,operation){
			$("#loading").css('display','block');
			$.post(path+"/serviceoperation/"+name+"/"+type+"/"+operation, { },     
			    function (data, textStatus){        
				   //alert(data.result); 
				   location.reload();
				   $("#loading").css('display','none');
				}
			);
		}
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").attr("action","/sys/user/");
			$("#searchForm").submit();
	    	return false;
	    }
		
		function fnPbAJAXMaskProcess(){
            var pbValue = parseInt($("#pbAJAXMask").progressbar( "option", "value" ));
            pbValue = (pbValue + 25)%100;
            $("#pbAJAXMask").progressbar("option", "value", pbValue);
        }
        
//         $(function () {
//             var $dlgAJAXMask = $("#dlgAJAXMask").dialog({ autoOpen: false, modal: true });
//             var $pbAJAXMask = $("#pbAJAXMask").progressbar({
//                 value: 25
//             });
//             var pbAJAXTimer;
//             $.ajaxSetup({
//                 cache:false,//放置ajax的get请求IE缓存
//                 beforeSend:function(){
//                     pbAJAXTimer = setInterval("fnPbAJAXMaskProcess()","250");
//                     $dlgAJAXMask.dialog("open");
//                     return true;//jquery doc - Returning false in the beforeSend function will cancel the request. 
//                 },
//                 complete:function(){
//                     $dlgAJAXMask.dialog("close");
//                     console.log(pbAJAXTimer);
//                     clearInterval(pbAJAXTimer);
//                 }
//             });
//         });
	</script>
	<style>
		.loading{
			width:160px;
			height:56px;
			position: absolute;
			top:40%;
			left:40%;
			line-height:56px;
			color:#fff;
			padding-left:60px;
			font-size:15px;
			background: #000 url(${syspath}/images/loading.gif) no-repeat 10px 50%;
			opacity: 0.7;
			z-index:9999;
			-moz-border-radius:20px;
			-webkit-border-radius:20px;
			border-radius:20px;
			filter:progid:DXImageTransform.Microsoft.Alpha(opacity=70);
		}
	</style>
	</head>  
	<body>  
	    <table class="table table-striped table-bordered table-condensed">  
	        <tr>  
	            <th>服务名称</th>  
	            <th>服务状态</th>  
	            <th>服务类型</th>  
	            <th>操作</th>  
	        </tr>  
	        <c:forEach items="${agsservices}" var="agsservice">  
	            <tr valign="middle">  
	                <td><c:out value="${agsservice.name}" /></td>   
	                <td valign="middle"><c:out value="${agsservice.status}" /></td>
	                <td><c:out value="${agsservice.type}" /></td> 
	                <td>
	                 
	      <div class="btn-group" style="margin: 0px 0;">
	          <button class="btn btn-default btn-sm ${agsservice.status eq '已启动'?'disabled':'enabled'}" onclick="serviceOperation('${agsservice.name}','${agsservice.type}','start')"><i class="glyphicon glyphicon-play"></i>&nbsp;启动</button>
	          <button class="btn btn-default btn-sm ${agsservice.status eq '已启动'?'enabled':'disabled'}" onclick="serviceOperation('${agsservice.name}','${agsservice.type}','stop')"><i class="glyphicon glyphicon-stop"></i>&nbsp;停止</button>
	          <button class="btn btn-default btn-sm" onclick="serviceOperation('${agsservice.name}',${agsservice.type},'restart')"><i class="glyphicon glyphicon-expand"></i>&nbsp;重新启动</button>
	        </div>
					</td>
	            </tr>  
	        </c:forEach>  
	    </table>  
	  
	    <p>${greetings}</p>  
	    
	    <div id="loading" class="loading">等待中...</div>
	</body>  
</html>  