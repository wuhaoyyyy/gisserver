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
</style>
<script type="text/javascript">
	$(function(){
		$("li:has(ul)").bind("click",function(event){
			if(this==event.target){
				if($(this).children().is(":hidden")){
					$(this).children().fadeIn(300);
				}
				else{
					$(this).children().fadeOut(300);
				}
			}
			
		})
		.css("cursor","pointer")
		.click();
		$("li:not(:has(ul))").css("cursor","default");
	})
	
</script>
</head>
<body>
    <fieldset>
      <legend>Collapsible List &mdash; Take 1</legend>
      <ul>
        <li>Item 1</li>
        <li>Item 2</li>
        <li>
          Item 3
          <ul>
            <li>Item 3.1</li>
            <li>
              Item 3.2
              <ul>
                <li>Item 3.2.1</li>
                <li>Item 3.2.2</li>
                <li>Item 3.2.3</li>
              </ul>
            </li>
            <li>Item 3.3</li>
          </ul>
        </li>
        <li>
          Item 4
          <ul>
            <li>Item 4.1</li>
            <li>
              Item 4.2
              <ul>
                <li>Item 4.2.1</li>
                <li>Item 4.2.2</li>
              </ul>
            </li>
          </ul>
        </li>
        <li>Item 5</li>
      </ul>
    </fieldset>
  </body>
</html>
