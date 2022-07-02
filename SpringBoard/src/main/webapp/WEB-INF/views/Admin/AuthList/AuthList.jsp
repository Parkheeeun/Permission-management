<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Pkg.Admin.DTO.AuthDTO, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="jscss/js/common.js"></script>

<script>

	$(document).ready(
		function(){
			$("#btnSearch").on("click",function(){
				location.href="AuthList?authName="+$("#SauthName").val();
			});//$("#btnSearch")끝
			
			$("#btnAdd").on("click",function(){
				var strHTML="";
				strHTML+=`<tr>`;
				strHTML+=`<td width="100px" height="30px" align="center">`;
				strHTML+=	`<input type="checkbox" name="chk" value=""/>`;
				strHTML+=`</td>`;
				strHTML+=`<td width="200px" height="30px" align="center">`;
				strHTML+=`<input type="text" name="authID" value="NEWID"style="width:98%; height:98%" readonly/>`;
				strHTML+=`</td>`;
				strHTML+=`<td width="400px" height="30px" align="center">`;
				strHTML+=`<input type="text" name="authName" style="width:98%; height:98%"/>`;
				strHTML+=`</td>`;
				strHTML+=`<td height="30px" align="center"style="visibility:hidden">`;
				strHTML+=`<input type="text" name="gbn" style="visibility:hidden" value="I"/>`;
				strHTML+=`</td>`;
				strHTML+=`</tr>`;
				$("#authTbl").append(strHTML);
				
			});//$("#btnAdd")끝
			
			//CHECKBOX 전체선택,전체해제
			chkClickFunc();
			
			//authname의 change event시작
			$("input[name='authName']").on("change",function(){
				var selectedNum=$(this).attr("data");
				$("input[name='gbn']").eq(selectedNum).val("U");
				
			});//authname의 change event 끝
			
			//저장버튼(btnSave)시작
			$("#btnSave").on("click",function(){
				var isChk=true;
				$("input[name='authName']").each(
					function(){
						if($(this).val()==""){
							isChk=false;
						}
					}		
				
				);
				if(!isChk){
					alert("권한명을 정확하게 입력하세요");
					return;
				}
				$("#authListForm").attr("action","SaveAuthList");
				$("#authListForm").submit();
			});//저장버튼(btnSave)끝
			
			//삭제버튼시작
			$("#btnDelete").click(
				function(){
					 var isCheck=false;
					 $("input[name='chk']").each(
						function(){
						if($(this).is(":checked")){
							isCheck=true;
						}	
						}
					 );
					 if(!isCheck){
						 alert("선택하세요!!");
						 return;
					 }
					var hiddenNames=[];
					var hiddenVals=[];
					var i=0;
					$("input[name='chk']").each(
							function(index){
								if($(this).prop("checked")){
									hiddenNames[i]="authID";
									hiddenVals[i]=$(this).val();
									i+=1;
								}
							}		
						);
					var obj=new objectSubmit("chkForm","deleteAuthList","post",hiddenNames,hiddenVals);
					obj.linkSubmit();
					
				}		
			);//삭제버튼시작끝
		}		
	
	);
	
	
	
	var chkClickFunc=function(){ //CHECKBOX 전체선택,전체해제
		 $("input[name='chkAll']").on("click",function(){
			if($(this).is(":checked")){
				$("input[name='chk']").prop("checked", true);
			} 
			else{
				$("input[name='chk']").prop("checked", false);
			}
			 
		 });
	 }
</script>
</head>
<body>
	<%
		List<AuthDTO> authList=(List<AuthDTO>)request.getAttribute("authList");
		String authName=(String)request.getAttribute("authName");
		authName=(authName==null)? "" :authName;
	%>
	<form name="authListForm" id="authListForm" method="post">
	<table	cellpadding="0" cellspacing="0" width="700px" align="center" border="1px" id="authTbl">
		<tr>
			<td width="700px" height="30px" align="center" colspan="4">
				<input type="text" name="SauthName" id="SauthName" value="<%=authName%>"/>
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="조회" id="btnSearch"/>
				<input type="button" value="추가" id="btnAdd"/>
				<input type="button" value="저장" id="btnSave"/>
				<input type="button" value="삭제" id="btnDelete"/>
			</td>
		</tr>
		<tr>
			<td width="100px" height="30px" align="center" >
				<input type="checkbox" name="chkAll" id="chkAll" value=""/>
			</td>
			<td width="200px" height="30px" align="center" >
			권한아이디
			</td>
			<td width="400px" height="30px" align="center">
			권한이름	
			</td>
		</tr>
	
	<%
	int i=0;
	for(AuthDTO dto:authList){
	%>
		<tr>
			<td width="100px" height="30px" align="center" >
				<input type="checkbox" name="chk" value="<%=dto.getAuthID()%>"/>
			</td>
			<td width="200px" height="30px" align="center" >
				<input type="text" name="authID" value="<%=dto.getAuthID()%>"style="width:98%; height:98%" readonly/>
			</td>
			<td width="400px" height="30px" align="center" >
			<input type="text" name="authName" data="<%=i%>" value="<%=dto.getAuthName()%>"
			style="width:98%; height:98%"/>
			</td>
			<td width="30px" height="30px" align="center" style="visibility:hidden">
				<input type="text" name="gbn" value="" style="visibility:hidden"/>
			</td>
		</tr>
	
	<%
	i +=1;
	} %>
	</table>
	</form>
</body>
</html>