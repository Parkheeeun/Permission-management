<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List, Pkg.Admin.DTO.MenuDTO" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="jscss/js/common.js"></script>
<script>

var rowObj = {
		menuID : "", menuLvl : "", rowIdx : ""
	};

//저장하기전에 필요한값들 체크하는함수
var checkVal=function(){
	$("input[name='menuName']").each(
		function(){
			var chkIdx=$("input[name='menuName']").index(this);
			var objMenuSeq=$("input[name='menuSeq']").eq(chkIdx);
			
			var isResult=true;
			if($(this).val().trim().length <=0 || objMenuSeq.val().trim().length<=0){
				isResult=false;
			}
			
			if(!isResult){
				alert("빈값일수없습니다.!!");
				return;
			}
			$("#menuForm").submit();
		}	
		
	);
	/*
	$("input[name='menuSeq']").each(
			function(){
				var isResult=true;
				if($(this).val().trim().length <=0){
					isResult=false;
				}
				
				if(!isResult){
					alert("메뉴순서는 빈값일수없습니다.!!");
					return;
				}
			}		
		);
	*/
	
	
}


$(document).ready(
	function(){
		$("#btnSearch").click(
			function(){
				location.href="MenusList?sMenuName="+$("#sMenuName").val();
			}		
		);//$("#btnSearch").click끝
		
		$("input[name='menuName']").on("change",function(){
			var chgIdx=$("input[name='menuName']").index(this);
			$("input[name='hVal']").eq(chgIdx).val("U")
		});//$("input[name='menuName']").onchange끝
	
		$("input[name='menuSeq']").on("change",function(){
			var chgIdx=$("input[name='menuSeq']").index(this);
			$("input[name='hVal']").eq(chgIdx).val("U")
		});//$("input[name='menuName']").onchange끝
		
		
		$("#btnAdd").click(
			function(){
				var strHTML="";
				strHTML+='<tr>';
				strHTML+='<td width="50px" height="30px">';
				strHTML+='	<input type="checkbox" name="chk"/>';
				strHTML+='</td>';
				strHTML+='<td width="150px" height="30px">';
				strHTML+='	<input type="text" name="menuID" value="" style="width:150px; height:30px;" readonly/>';
				strHTML+='</td>';
				strHTML+='<td width="250px" height="30px">';
				strHTML+='	<input type="text" name="menuName" value="" style="width:250px; height:30px;"/>';
				strHTML+='</td>';
				strHTML+='<td width="75px" height="30px">';
				strHTML+='	<input type="text" name="menuSeq" value="" style="width:75px; height:30px;"/>';
				strHTML+='</td>'
				strHTML+='<td width="75px" height="30px">';
				strHTML+='	<input type="text" name="menuLvl" value="" style="width:75px; height:30px;" readonly/>';
				strHTML+='</td>';
				strHTML+='<td width="150px" height="30px">';
				strHTML+='	<input type="text" name="parentID" value="" style="width:150px; height:30px;" readonly/>';
				strHTML+='</td>';
				strHTML+='<td width="0px" height="30px">';
				strHTML+='	 <input type="hidden" name="hVal" value="I"/>';
				strHTML+='</td>';
				strHTML+='</tr>';
				
				$("#menuTbl tbody").append(strHTML);
			}		
		
		);//$("#btnAdd").click끝
		
		
		
		$("#btnSave").click(
			function(){
				checkVal();
			}		
		
		);//$("#btnSave").click끝
		
		
		$("#allChk").click(
			function(){
				var isAllChk=$(this).prop("checked");
				if(isAllChk){
					$("input[name='chk']").prop("checked",true);
				}
				else{
					$("input[name='chk']").prop("checked",false);
				}
				
			}		
		);//$("#allChk").click끝
		
		
		$("#btnDelete").click(
			function(){

				var isConfirm=confirm("삭제하시겠습니까?");
				if(!isConfirm){
					return;
				}
			
				var chkValues=[];
				$("input[name='chk']").each(
					function(){
						var isAllChk=$(this).prop("checked");
						if(isAllChk){
							chkValues.push($(this).val());
						}
						
					}		
				);
				
				var strHTML="";
				strHTML+="<form id='delForm' action='delMenus' method='post'>";
				for(var i=0; i<chkValues.length; i++){
					
					strHTML+="<input type='hidden' name='delMenuID' value='"+chkValues[i]+"/>";
				
				}
				strHTML+="</form>";
			
				
				$("body").append(strHTML);
				alert(strHTML);
				$("#delForm").submit();
			});//$("#btnDelete").click끝
			
			//$("tr[name='row']").click시작
			$("tr[name='row']").click(
				function(){
					var selectedIdx=$("tr[name='row']").index(this);
					var selectMenuID=$("input[name='menuID']").eq(selectedIdx).val();
					
					$.ajax(
						{
							url:"SubMenuList",
							data:{menuID: selectMenuID},
							type:"post",
							async:true,
							dataType:"json",
							success :function(datas){
								var strHTML="";
								var i = 0;
								$(datas).each(
									function(){
										var eachLvl=(this.menuLvl-1)*30;
										strHTML += '<tr name="subRow" onclick="rowChk(this)" data="1234">';
										strHTML += '<td width="50px" height="30px" align="center">';
										strHTML += '	<input type="checkbox" name="subChk" />';
										strHTML += '</td>';
										strHTML += '<td width="150px" height="30px" align="center">';
										strHTML += '	<input type="text" name="SubmenuID" value="' + this.menuID + '" style="width:100%;height:100%"/>';
										strHTML += '</td>';
										strHTML += '<td width="250px" height="30px" align="center">';
										strHTML += '	<input type="text" name="SubmenuName" value="' + this.menuName + '" style="width:100%;height:100%;padding-left:' + eachLvl + 'px;" onchange="updateHid(this)"/>';
										strHTML += '</td>';
										strHTML += '<td width="75px" height="30px" align="center">';
										strHTML += '	<input type="text" name="SubmenuSeq" value="' + this.menuSeq + '" style="width:100%;height:100%" onchange="updateHid(this)"/>';
										strHTML += '</td>';
										strHTML += '<td width="75px" height="30px" align="center">';
										strHTML += '	<input type="text" name="SubmenuLvl" value="' + this.menuLvl + '" style="width:100%;height:100%" onchange="updateHid(this)"/>';
										strHTML += '</td>';
										strHTML += '<td width="150px" height="30px" align="center">';
										strHTML += '	<input type="text" name="SubparentID" value="' + this.parentID + '" style="width:100%;height:100%"/>';
										strHTML += '</td>';
										strHTML += '<td width="0px" height="30px" align="center">';
										strHTML += '	<input type="text" name="SubhVal" value="" style="width:100%;height:100%"/>';
										strHTML += '</td>';
										strHTML += '</tr>';
										i+=1;
									});
								//$("#subMenuTbl tbody").html("");
								$("#subMenuTbl tbody").append(strHTML);
							},
							error:function(){
								alert("err");
							}
						}
					);
				});//$("tr[name='row']").click끝
				
			/********************************************************/	
			/********************서브메뉴관련이벤트시작********************/	
		
			
			//$("#btnSubAdd").click시작
			$("#btnSubAdd").click(
				function(){
					var objSelectedRow = $("tr[name='subRow']").eq(rowObj.rowIdx);
					var addSubMenuLvl = parseInt(rowObj.menuLvl) + 1;
					var addParentID = rowObj.menuID;
					var strHTML="";
					strHTML+='<tr name="SubRow" onclick="rowChk(this)">';
					strHTML+='<td width="50px" height="30px">';
					strHTML+='	<input type="checkbox" name="Subchk"/>';
					strHTML+='</td>';
					strHTML+='<td width="150px" height="30px">';
					strHTML+='	<input type="text" name="SubmenuID" id="SubmenuID" value="" style="width:100%; height:100%"/>';
					strHTML+='</td>';
					strHTML+='<td width="250px" height="30px">'
					strHTML+='	<input type="text" name="SubmenuName" id="SubmenuName" value="" style="width:100%; height:100%;" onchange="updateHid(this)"/>';
					strHTML+='</td>';
					strHTML+='<td width="75px" height="30px">';
					strHTML+='	<input type="text" name="SubmenuSeq" id="SubmenuSeq" value="" style="width:100%; height:100%" onchange="updateHid(this)"/>';
					strHTML+='</td>';
					strHTML+='<td width="75px" height="30px">';
					strHTML+='	<input type="text" name="SubmenuLvl" id="SubmenuLvl" value="'+addSubMenuLvl+'" style="width:100%; height:100%" onchange="updateHid(this)"/>';
					strHTML+='</td>';
					strHTML+='<td width="150px" height="30px">';
					strHTML+='	<input type="text" name="SubparentID" id="SubparentID" value="'+addParentID+'" style="width:100%; height:100%"/>';
					strHTML+='</td>';
					strHTML+='<td width="0px" height="30px">';
					strHTML+='  <input type="text" name="SubhVal" value="I" style="width:100%; height:100%"/>';
					strHTML+='</td>';
					strHTML+='	</tr>';
					
					
					$("subMenuTbl tbody").append(strHTML);
				});	//$("#btnSubAdd").click끝
			
				$("#btnSubSave").click(
					function(){
						var sendJsonData={};
						var sendDatas=[];
						for(var i=0; i<$("input[name='SubmenuID']").length; i++){
							var eachRowData = {};
							eachRowData.menuID = $("input[name='SubmenuID']").eq(i).val();
							eachRowData.menuName = $("input[name='SubmenuName']").eq(i).val();
							eachRowData.menuSeq = $("input[name='SubmenuSeq']").eq(i).val();
							eachRowData.menuLvl = $("input[name='SubmenuLvl']").eq(i).val();
							eachRowData.parentID = $("input[name='SubparentID']").eq(i).val();
							eachRowData.hidVal = $("input[name='SubhVal']").eq(i).val();
							
							if(eachRowData.hidVal == "U" || eachRowData.hidVal == "I"){
								sendDatas.push(eachRowData);
							}
						}
						
						sendJsonData.subMenuList = sendDatas;
						
						console.log(JSON.stringify(sendDatas));
						
						$.ajax(
								{
									url : "saveSubMenu",
									data : JSON.stringify(sendData),
									type : "post",
									async : true,
									dataType : "json",
									contentType:"application/json",
									success : function(datas){
										alert("성공");
										$("#btnSubAdd").click();
									},
									
									error : function(err){
										alert("err");
									}
									
								});
					});
				
				
				
			
			/********************************************************/	
			/********************서브메뉴관련이벤트끝********************/	
		
	});//$(document).ready끝
	
	//SubmenuName,SubmenuSeq,SubmenuLvl change event function
	var updateHid=function(eventObj){
		var selectedIdx=$("input[name='"+eventObj.name+"']").index(eventObj);
		$("input[name='SubhVal']").eq(selectedIdx).val("U");
	}

	//rowChk function
	var rowChk=function(selectedObj){
		var selectedIdx = $("tr[name='SubRow']").index(selectedObj);
		rowObj.menuID = $("input[name='SubmenuID']").eq(selectedIdx).val();
		rowObj.menuLvl = $("input[name='SubmenuLvl']").eq(selectedIdx).val();
		rowObj.rowIdx = selectedIdx;
	}
</script>
</head>
<%
	List<MenuDTO> menuList=(List<MenuDTO>)request.getAttribute("menuList");
%>
<body>
	<table border="1px" width="1300px" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td width="750px" align="center" valign="top">
				<form name="menuForm" id="menuForm" action="SaveMenu" method="post">
				<table border="1px" width="750px" align="center" cellpadding="0" cellspacing="0" id="menuTbl">
					<tr >
						<td width="750px" colspan="7" height="30px">
							<input type="text" name="sMenuName" id="sMenuName"/>
							<input type="button" value="조회" id="btnSearch"/>
							<input type="button" value="저장" id="btnSave"/>
							<input type="button" value="추가" id="btnAdd"/>
							<input type="button" value="삭제" id="btnDelete"/>
						</td>
					</tr>
					<!--  
					<tr>
						<td width="650px" height="30px">
						
						</td>
					</tr>-->
					<tr>
						<td width="50px" height="30px">
							<input type="checkbox" name="allChk" id="allChk"/>
						</td>
						<td width="150px" height="30px">
							메뉴아이디
						</td>
						<td width="250px" height="30px">
							메뉴명
						</td>
						<td width="75px" height="30px">
							순서
						</td>
						<td width="75px" height="30px">
							레벨
						</td>
						<td width="150px" height="30px">
							부모아이디
						</td>
						<td width="0px" height="30px">
							<!--  <input type="hidden" name="hVal"/>-->
						</td>
					</tr>
					
					
				
					<%for(MenuDTO dto:menuList){ %>
					<tr name="row">
						<td width="50px" height="30px">
							<input type="checkbox" name="chk" value="<%=dto.getMenuID()%>"/>
						</td>
						<td width="150px" height="30px">
							<input type="text" name="menuID" value="<%=dto.getMenuID() %>" style="width:150px; height:30px;" readonly/>
						</td>
						<td width="250px" height="30px">
							<input type="text" name="menuName" value="<%=dto.getMenuName() %>" style="width:250px; height:30px;"/>
						</td>
						<td width="75px" height="30px">
							<input type="text" name="menuSeq" value="<%=dto.getMenuSeq() %>" style="width:75px; height:30px;"/>
						</td>
						<td width="75px" height="30px">
							<input type="text" name="menuLvl" value="<%=dto.getMenuLvl() %>" style="width:75px; height:30px;" readonly/>
						</td>
						<td width="150px" height="30px">
							<input type="text" name="parentID" value="<%=dto.getParentID()%>" style="width:150px; height:30px;" readonly/>
						</td>
						<td width="0px" height="30px">
							 <input type="hidden" name="hVal"/>
						</td>
					</tr>
					<%} %>
				</table>
				</form>
			</td>
			
			<td width="750px" align="center" valign="top">
				<table border="1px" width="750px" align="center" cellpadding="0" cellspacing="0" id="subMenuTbl">
					<thead>
					<tr>
						<td width="750px" colspan="7" height="30px">
							<input type="text" name="sSubMenuName" id="sSubMenuName"/>
							<input type="button" value="조회" id="btnSubSearch"/>
							<input type="button" value="저장" id="btnSubSave"/>
							<input type="button" value="추가" id="btnSubAdd"/>
							<input type="button" value="삭제" id="btnSubDelete"/>
						</td>
					</tr>
					</thead>
				
					
					<thead>
					<tr>
						<td width="50px" height="30px">
							<input type="checkbox" name="allSubChk" id="allSubChk"/>
						</td>
						<td width="150px" height="30px">
							메뉴아이디
						</td>
						<td width="250px" height="30px">
							메뉴명
						</td>
						<td width="75px" height="30px">
							순서
						</td>
						<td width="75px" height="30px">
							레벨
						</td>
						<td width="150px" height="30px">
							부모아이디
						</td>
						<td width="20px" height="30px">
							<!--  <input type="hidden" name="hVal"/>-->
						</td>
					</tr>
					</thead>
					<td width="0px" height="0px"></td>
	</table>
	</table>
</body>
</html>