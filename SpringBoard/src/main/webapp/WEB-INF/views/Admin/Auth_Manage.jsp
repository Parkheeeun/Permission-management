<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한관리</title>
</head>
<body>

	<table cellpadding="0px" cellspacing="0px" width="1250px" height="630px" align="center" border="1px">
			<tr>
				<td width="1250px" height="40px" align="center">
					<table cellpadding="0px" cellspacing="0px" width="600px">
						<tr>
							<td width="120px" height="40px" align="center">
								<a href="AuthList" target="bodyFrame">권한관리</a>
							</td>
							<td width="120px" height="40px" align="center">
								<a href="MemberList" target="bodyFrame">회원관리</a>
							</td>
							<td width="120px" height="40px" align="center">
								<a href="MenusList" target="bodyFrame">메뉴관리</a>
							</td>
							<td width="120px" height="40px" align="center">
							<a href="ProgramList" target="bodyFrame">프로그램관리</a>
							</td>
							<td width="120px" height="40px" align="center">
							<a href="DetailAuthes">권한별 상세관리</a>
							</td>
						</tr>
					
					</table>
				</td>
			</tr>
			
			<tr>
				<td width="1250px" align="center" height="40px">
					<%
						String adminID=(String)session.getAttribute("adminID");
						if(adminID!=null){ //로그인o
					%>
						<%=adminID %>	
						<a href="AdminLogout">로그아웃</a>
					<% 
						}else{ //로그인x
							
						}
					%>
				</td>
			
			</tr>
			
			<tr>
				<td width="1250px" height="590px" align="center">
					<iframe name="bodyFrame" style="width:100%; height:580px; border:1px solid red;"></iframe>
				</td>
			</tr>
	</table>
</body>
</html>