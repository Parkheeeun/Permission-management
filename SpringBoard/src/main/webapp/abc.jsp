<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function goJson(){
		var member={id="123", name="abc"}
		var StringJsonData=JSON.Stringify(member);
		document.getElementById("member").value=StringJsonData;
		document.getElementBtId("myForm").submit();
	}
</script>
</head>
<body>

<form action="test" method="post" name="myForm" id="myForm">
<!--  
<div>
	<input type="text" name="name"/>
	<input type="text" name="id"/>
</div>

<div>
	<input type="text" name="name"/>
	<input type="text" name="id"/>
</div>
<div>
	<input type="text" name="name"/>
	<input type="text" name="id"/>
</div>
-->
<div>
	<input type="hidden" name="member" id="member"/>
	<input type="button" value="확인" onclick="goJson()"/>
</div>
</form>
</body>
</html>