<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/inctaglib.jsp"%>
<!DOCTYPE html>
<html lang="ch">
<head>
<meta name="decorator" content="default" />
<%@ include file="/common/include.jsp"%>
<title>Insert title here</title>
<style type="text/css">
.changeColor {
	background-color: #D3D3D3;
}
.evenRow{background-color: #D3D3D3;}
.oddRow{background-color: red;}
.activeRow{background-color: blue;}
</style>
<script type="text/javascript">
	$(document).ready(
		function() {
			var myname="qq";
			showname();
			function showname(){
				//alert(showname.caller);
			}
			
			function Person(name){
				this.name=name;
			};
			Person.prototype.company="default";
			Person.prototype.sayHello=function(){
				alert(this.name+"  "+this.company);
			}
			var a=new Person("a");
			a.sayHello();
			
			
			
			
			//创建元素包装集    操作元素包装集
			//子选择器      >  直接子元素                       特性选择器                             容器选择器  :has[a]    位置    first   last              筛选选择器 及其翻转    :not()  (与查找选择器的差异)
			$("tr:nth-child(even)").addClass("even");
			//$("p:even").fadeOut();
			//$("div.fa").fadeOut();				 //不加空格 似乎是表示该标签
			//$("div .fa").fadeOut(); //加空格 似乎是表示之下的标签
			$("div p.fa").fadeOut();
			$("<p>hhh</p>").insertAfter("div.fa"); //我在fa后面插入，调用fa的fadeOut 加入的也执行了fadeOut
			$("tr:first > td").addClass("changeColor"); //子选择器（直接子节点）$("table > tr > td")不行
	
			//$("a[href^=http://],a[href$=.jpg],input[type=text],div[title^my],div[title*my]").addClass("changeColor"); //特性选择器
			
			$("li:has(a)").addClass("changeColor");//选择li
			//$("li a").addClass("changeColor");//选择a
			
			//通过位置选择     :even   :odd。。。。。。。。。。。。
			
			$("#table_1").mytable();

		}
	);
	$.fn.disable = function() {
		return this.each(function() {
			if (typeof this.disable != "undefined")
				this.disabled = true;
		});
	}
</script>
</head>
<body>
	<table id="table_1" width="70%" border="1" cellpadding="2" cellspacing="0">
		<tr>
			<td>a1</td>
			<td>b1</td>
		</tr>
		<tr>
			<td>a</td>
			<td>b</td>
		</tr>
		<tr>
			<td>a</td>
			<td>b</td>
		</tr>
		<tr>
			<td>a</td>
			<td>b</td>
		</tr>
	</table>
	<p>aa</p>
	<p>bb</p>
	<p>cc</p>
	<p>dd</p>
	<div class="fa">aaaa</div>
	<div>
		<ul>
			<li><a href="http://www.baidu.com">a</a></li>
			<li><a href="http://www.baidu.com">b</a></li>
			<li><a href="http://www.baidu.com">c</a></li>
		</ul>
		<p class="fa">aaaaaaaaaa</p>
		<a class="fa">hi!</a>
	</div>
</body>
</html>
