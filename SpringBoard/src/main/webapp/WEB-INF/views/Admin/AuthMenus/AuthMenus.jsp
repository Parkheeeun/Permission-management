<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, Pkg.Admin.DTO.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%
	String receiveAuthID = (String)request.getAttribute("authID");
	String receiveMenuID = (String)request.getAttribute("menuID");

%>

<title>권한별 상세 권한 관리</title>
	<style>
		body{
			font-size:13px;
			margin:0px;
			padding:0px;
		}
	
		#wrap{
			width:1490px;
			height:630px;
			border:0px solid blue;
			clear:both;
			padding:0px;margin:0px;
		}
		
		.leftMenu{
			width:390px;height:628px;border:2px solid #444;float:left;
		}
		
		.authes_row{
			width:390px;height:30px;border:0px solid red;clear:both;
		}
		
		.authes_col1{
			width:150px;height:20px;border:1px solid #888;float:left;
			text-align:center;display:block;padding:5px 0px 5px 0px;
		}
		
		.authes_col2{
			width:236px;height:20px;border:1px solid #888;float:left;
			text-align:center;display:block;padding:5px 0px 5px 0px;
		}
		
		
		.rightMenu{
			width:1096px;height:630px;border:0px solid red;float:left;
		}
		
		.detailAuthes{
			width:1096px;height:630px;border:0px solid red;
		}
		
		.menus{
			width:1096px;height:180px;border:0px solid blue;clear:both;
		}
		.menus_row{
			width:1096px;height:30px;border:0px solid pink;clear:both;
		}
		
		
		.submenus{
			width:1096px;height:440px;border:0px solid blue;clear:both;
		}
		.menus_row_title{
			width:1096px;height:30px;border:0px solid pink;clear:both;
		}
		
		.menus_col1{
			width:148px;height:20px;border:1px solid #777;display:block;float:left;
			padding:5px 0px 5px 0px;text-align:center;
		}
		.menus_col2{
			width:250px;height:20px;border:1px solid #777;display:block;float:left;
			padding:5px 0px 5px 0px;
		}
		.menus_col3{
			width:67px;height:20px;border:1px solid #777;display:block;float:left;
			padding:5px 0px 5px 0px;text-align:center;
		}
	</style>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	
		var selectedVal = {authID : "<%=receiveAuthID%>", menuID : "<%=receiveMenuID%>", subMenuID : ""};
	
		var selectedAuth = function(selectedAuthID){
			selectedVal.authID = selectedAuthID;
			location.href="DetailAuthes?authID=" + selectedAuthID + "&menuID=";
		}
		
		var selectedMenu = function(selectedMenuID){
			selectedVal.menuID = selectedMenuID;
			location.href="DetailAuthes?authID=" + selectedVal.authID + "&menuID=" + selectedMenuID;
		}
	
		
		
		$(document).ready(
			function(){
				$(".menus_row")
				.click(
					function(){

						var selectedIdx = $(".menus_row").index(this);
						//alert(selectedIdx);
						var selectedAmID = $("input[name='amID']").eq(selectedIdx).val();
						var vauth_Sel = ($("input[name='sel']").eq(selectedIdx).prop("checked")) ? "Y" : "N";
						var vauth_Ins = ($("input[name='add']").eq(selectedIdx).prop("checked")) ? "Y" : "N";
						var vauth_Up = ($("input[name='update']").eq(selectedIdx).prop("checked")) ? "Y" : "N";
						var vauth_Del = ($("input[name='del']").eq(selectedIdx).prop("checked")) ? "Y" : "N";
						var vauth_FileUp = ($("input[name='upload']").eq(selectedIdx).prop("checked")) ? "Y" : "N";
						var vauth_fileDn = ($("input[name='download']").eq(selectedIdx).prop("checked")) ? "Y" : "N";
						//alert(vauth_Up);
						$.ajax(
								{
									url : "SaveAuthMenus",
									data : {amID: selectedAmID, auth_Sel : vauth_Sel, auth_Ins : vauth_Ins, auth_Up : vauth_Up, auth_Del : vauth_Del, auth_FileUp : vauth_FileUp, auth_fileDn : vauth_fileDn},
									type : "post", //post or get
									async : true, //true or false
									dataType : "json",	
									success : function(datas){
										
									},
									error : function(err){
										alert("err");
									}
								}
							); //$.ajax
					}		
				);
			}		
		);
	</script>
	
</head>
<body>

	<%
		ArrayList<AuthDTO> authList = (ArrayList<AuthDTO>)request.getAttribute("authList");
		ArrayList<AuthMenuDTO> menuList = (ArrayList<AuthMenuDTO>)request.getAttribute("menuList");
		ArrayList<AuthMenuDTO> subMenuList = (ArrayList<AuthMenuDTO>)request.getAttribute("subMenuList");
	%>



	<div id="wrap">
		<div class="leftMenu">
			<div class="authes_row">
				<span class="authes_col1">권한아이디</span>
				<span class="authes_col2">권한명</span>
			</div>
			<% for(AuthDTO dto: authList) {%>
			<div class="authes_row" onclick="selectedAuth('<%=dto.getAuthID() %>')">
				<span class="authes_col1"><%=dto.getAuthID() %></span>
				<span class="authes_col2"><%=dto.getAuthName() %></span>
			</div>
			<%} %>
		</div>
		<div class="rightMenu">
			<div class="detailAuthes">
				<div class="menus">
					<div class="menus_row_title">
						<span class="menus_col1">주메뉴아이디</span>
						<span class="menus_col2" style="text-align:center">주메뉴명</span>
						<span class="menus_col3">레벨</span>
						<span class="menus_col3">조회</span>
						<span class="menus_col3">수정</span>
						<span class="menus_col3">추가</span>
						<span class="menus_col3">삭제</span>
						<span class="menus_col3">업로드</span>
						<span class="menus_col3">다운로드</span>
						<span class="menus_col3"></span>
						<span class="menus_col3"></span>
						<span class="menus_col3"></span>
					</div>	
					<% for(AuthMenuDTO dto: menuList) {%>
					<div class="menus_row" onclick="selectedMenu('<%=dto.getMenuID() %>')">
						<span class="menus_col1"><%=dto.getMenuID() %></span>
						<span class="menus_col2"><%=dto.getMenuName() %></span>
						<span class="menus_col3"><%=dto.getMenuLvl() %></span>
						<span class="menus_col3">
							<input type="checkbox" name="sel" value="" 
								<% if(dto.getAuth_Sel().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3">
							<input type="checkbox" name="update" value="" 
							<% if(dto.getAuth_Up().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3">
							<input type="checkbox" name="add" value="" 
							<% if(dto.getAuth_Ins().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3">
							<input type="checkbox" name="del" value="" 
							<% if(dto.getAuth_Del().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3">
							<input type="checkbox" name="upload" value="" 
							<% if(dto.getAuth_FileUp().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3">
							<input type="checkbox" name="download" value="" 
							<% if(dto.getAuth_fileDn().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3"></span>
						<span class="menus_col3"></span>
						<span class="menus_col3">
							<input type="hidden" name="amID" value="<%=dto.getAmID() %>" />
						</span>
					</div>
					<%} %>
				</div>
				<div style="height:5px;"></div>
				<div class="menus">
					<div class="menus_row_title">
						<span class="menus_col1">서브메뉴아이디</span>
						<span class="menus_col2" style="text-align:center">서브메뉴명</span>
						<span class="menus_col3">레벨</span>
						<span class="menus_col3">조회</span>
						<span class="menus_col3">수정</span>
						<span class="menus_col3">추가</span>
						<span class="menus_col3">삭제</span>
						<span class="menus_col3">업로드</span>
						<span class="menus_col3">다운로드</span>
						<span class="menus_col3"></span>
						<span class="menus_col3"></span>
						<span class="menus_col3"></span>
					</div>
					<% for(AuthMenuDTO dto: subMenuList) {
						int paddingLeft = (Integer.parseInt(dto.getMenuLvl()) - 1) * 30;
						int width = 250 - paddingLeft;
					%>
					<div class="menus_row">
						<span class="menus_col1"><%=dto.getMenuID() %></span>
						<span class="menus_col2" style="text-align:left;padding-left:<%=paddingLeft%>px;width:<%=width%>px;">
							<%=dto.getMenuName() %>
						</span>
						<span class="menus_col3"><%=dto.getMenuLvl() %></span>
						<span class="menus_col3">
							<input type="checkbox" name="sel" value="" 
								<% if(dto.getAuth_Sel().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3">
							<input type="checkbox" name="update" value="" 
							<% if(dto.getAuth_Up().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3">
							<input type="checkbox" name="add" value="" 
							<% if(dto.getAuth_Ins().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3">
							<input type="checkbox" name="del" value="" 
							<% if(dto.getAuth_Del().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3">
							<input type="checkbox" name="upload" value="" 
							<% if(dto.getAuth_FileUp().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3">
							<input type="checkbox" name="download" value="" 
							<% if(dto.getAuth_fileDn().equals("Y")) {%> checked <% } %>
							/>
						</span>
						<span class="menus_col3"></span>
						<span class="menus_col3"></span>
						<span class="menus_col3">
							<input type="hidden" name="amID" value="<%=dto.getAmID() %>" />
						</span>
					</div>
					<%} %>
				</div>
			</div>
		</div>
	</div>
</body>
</html>