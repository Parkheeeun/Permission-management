<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.List,Pkg.Admin.DTO.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램리스트</title>
<style>

body{
	margin:0px;
	font-size:12px;
}

#wrap{
	
}

.search{
	width:710px;
	border:0px solid red;
	padding:4px 0px 4px 0px;
	clear:both;

}

.row{
	width:920px;
	border:0px solid red;
	/*padding:4px 0px 4px 0px;*/
	clear:both;

}

.col1{
	border:1px solid #444;
	width:50px;
	padding:3px 0px 3px 0px;	
	display:block;
	text-align:center;
	float:left;
}

.col2{
border:1px solid #444;
	width:150px;
	padding:4px 0px 5px 0px;	
	display:block;
	text-align:center;
	float:left;

}

.col3{
border:1px solid #444;
	width:150px;
	padding:4px 0px 5px 0px;	
	display:block;
	text-align:center;
	float:left;

}

.col4{
border:1px solid #444;
	width:230px;
	padding:4px 0px 5px 0px;	
	display:block;
	text-align:center;
	float:left;

}


.col5{
border:1px solid #444;
	width:20px;
	padding:4px 0px 5px 0px;	
	display:block;
	text-align:center;
	float:left;

}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="jscss/js/common.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	  <link rel="stylesheet" href="/resources/demos/style.css">
	  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>

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

var getMenuList=function(){
	var menuList=null;
	$.ajax(
			{
				url : "MenuList",
				//data : this.data,//{sid: "", sname:""}
				type : "post",
				async : false,
				dataType : "json",
				//contentType:this.contentType,
				success : function(resultData){
					menuList=resultData;
				},
				
				error : function(){
					alert("err");
				},
				complete:function(){
					return menuList;
				}
				
			} 
		); 
}

	 
	 
	$(document).ready(
		function(){
		chkClickFunc();
		
		//change event  시작
		$("select[name='selMenus']").change(
			function(){
				var selectedIdx = $(this).attr("idx");
				//$("select[name='selMenus']").index($(this));
				
				$("input[name='hidVal']").eq(selectedIdx).val("U");
			}
		);
		
		$("input[name='fileName']").change(
				function(){
					var selectedIdx = $(this).attr("idx");
					
					$("input[name='hidVal']").eq(selectedIdx).val("U");
				}
		);
		
		$("input[name='fileUrl']").on("change", function(){
					
					var selectedNum=$(this).attr("idx");
					$("input[name='hVal']").eq(selectedNum).val("U");
					
					
					/*
					var sel=$("input[name='hVal']").get();
					sel[$("input[name='fileUrl']").index(this)].value="U";
					*/
					
				});//$("input[name='fileUrl']").on("change")끝
		
		
		$("#btnSave").click(
			function(){
		
				var sendData={};
				/*
				 	{
						datas:[
							{pID:"", pName:"", pFileName:"", fileUrl:""},
							{pID:"", pName:"", pFileName:"", fileUrl:""}
						],
						
						datas2:[
							{name:"", gender:""},
							{name:"", gender:""},
							{name:"", gender:""}	
						]
				

				 	}
				
				
				*/
				var datas=[];
				var hVal="";
				for(var i=0; i<$("input[name='pID']").length; i++){
					hVal=$("input[name='hVal']").eq(i).val();
					
					if(hVal !=""){
						var objRow={};
						objRow.pID=$("input[name='pID']").eq(i).val();
						objRow.pName=$("input[name='pName']").eq(i).val();
						objRow.menuID=$("select[name='selMenus']").eq(i).val();
						objRow.pFileName=$("input[name='pFileName']").eq(i).val();
						objRow.fileUrl=$("input[name='fileUrl']").eq(i).val();
						datas.push(objRow);
						}
					}
				sendData.datas=datas;
				//console.log(JSON.stringify(sendData.datas));
				
				var sucFunc=function(data){
					if(data.result=="success"){
						alert("저장성공!");
					}
				}
				var errFunc=function(){
					alert("err");
				}
				
				var objAjax=new ajaxObj("SaveProgramList","post",null,null,true,"json",sucFunc,errFunc,JSON.stringify(sendData),"application/json");
				objAjax.ajaxExec();
				}
		);//$("#btnSave").click끝
		
		
		
		/*
		$("input[name='pFileName']").on("change",function(){
			var sel2=$("input[name='hVal']").get();
			sel2[$("input[name='pFileName']").index(this)].value="U";
		});
		*/
		
		$("#btnAdd").click(
			function(){
				//ajax를 활용해서 menuData를 다시 가지고 오는게 실시간으로 데이터매핑
				$.ajax(
						{
							url : "MenuList",
							//data : this.data,//{sid: "", sname:""}
							type : "post",
							async : false,
							dataType : "json",
							//contentType:this.contentType,
							success : function(result){
								var rowHTML="";
								rowHTML+='<div class="row">';
								rowHTML+='<span class="col1"><input type="checkbox" name="chk"/></span>';
								rowHTML+='<span class="col2"><input type="text" name="pID" value="" class="col2"/></span>';
								rowHTML+='<span class="col4"><input type="text" name="pName" value="" class="col2"/></span>';
								rowHTML+='<span class="col2">';
								rowHTML+='<select id="selMenus" name="selMenus">';
								rowHTML+='<option value="">--선택해주세요--</option>';
								$(result).each(
									function(){
										rowHTML+='<option value="'+this.menuID+'">'+this.menuName+'</option>';
									}
										
								);
								rowHTML+='</select>';
								rowHTML+='</span>';
								rowHTML+='<span class="col2"><input type="text" name="pFileName" value="" class="col2"/></span>';
								rowHTML+='<span class="col2"><input type="text" name="fileUrl" value="" class="col2"/></span>';
								rowHTML+='<span><input type="text" name="hVal" value="I" style="width:10px"></span>';
								rowHTML+='</div>';
								$("#rows").append(rowHTML);
							},
							
							error : function(){
								alert("err");
							}
							
						} 
					); 
			}		
		);//$("#btnAdd").click끝
		
		
		$("#btnDelete").click(
			function(){
				alert($("input[name='chk']").prop("checked"));
				//1.유효성검사
				if(!$("input[name='chk']").prop("checked")){
					$( "#delMsg" ).html("삭제할 데이터가 없습니다. !!!!");
					$( "#delMsg" ).dialog();
					return;
				}
				else{
					//삭제할 데이터 서버로 날리자
					/*
					{
					   delPid : [
						{pid : "P000001"},
						{pid : "P000002"},
						{pid : "P000003"}
					   ]
					}

					*/
					var sendDatas = {};
					var arrDatas = [];
					$("input[name='chk']").each(
						function(){
							if($(this).prop("checked")){
								var rowData = {}
								rowData.pid = $(this).val();
								arrDatas.push(rowData);
							}
						}
					);
					
					sendDatas.delPid = arrDatas;
					
					console.log(JSON.stringify(sendDatas));
				$.ajax(
					{
					url:"MenuDel",
					data:JSON.stringify(sendDatas),
					type:"post",
					async:true,
					dataType:"json",
					contentType:"application/json",
					success :function(datas){
						var strHTML="";
						var i=0;
						datas.each(
							function(){
							  strHTML+='<div class="row">';
							  strHTML+='<span class="col1"><input type="checkbox" name="chk" value="' + this.pID + '"/></span>';
							  strHTML+='<span class="col2"><input type="text" name="pID" value="'+this.pID+'" class="col2"/></span>';
							  strHTML+='<span class="col4"><input type="text" name="pName" value="'+this.pName+'" class="col2"/></span>';
							  strHTML+='<span class="col2">';
							  strHTML+='<select id="selMenus" name="selMenus" idx="'+i+'">';
							  strHTML+='<option value="">---선택해주세요---</option>';
							  for(var a=0; a<this.menus.length; a++){
								  strHTML+='<option value="'+this.menus[i].menuID+'"'
								  if(this.menus[i].menuID==this.menuID){
									  strHTML+='selected';
								  }
								  strHTML+='>'+this.menus[i].menuName+'</option>';
							  }
							  
							  strHTML+='</select>';
							  strHTML+='</span>';
							  strHTML+='<span class="col2"><input type="text" idx="'+i+'" name="pFileName" value="'+this.pFileName+'" class="col2"/></span>';
							  strHTML+='<span class="col2"><input type="text" idx="'+i+'" name="fileUrl" value="'+this.fileUrl+'" class="col2"/></span>';
							  strHTML+='<span><input type="text" name="hVal" value="" style="width:10px"></span>';
							  
							  strHTML+='</div>';
							  i +=1;
							}
							
						);
					},
					
					error:function(){
						alert("err");
					}
					}
				);
			}		
			});//$("#btnDelete").click끝
		
		
		
	});//$(document).ready끝

</script>
</head>
<body>
<%
List<ProgramDTO> programList=(List<ProgramDTO>)request.getAttribute("programList");
List<MenuDTO> menuList=(List<MenuDTO>)request.getAttribute("menuList");

%>

<div>

	<input type="text" name="search" id="search"/>
	<input type="button" value="조회" id="btnSearch" name="btnSearch"/>
	<input type="button" value="추가" id="btnAdd" name="btnAdd"/>
	<input type="button" value="저장" id="btnSave" name="btnSave"/>
	<input type="button" value="삭제" id="btnDelete" name="btnDelete"/>

</div>

	<div class="row">
		<span class="col1"><input type="checkbox" name="allChk" id="allChk"/></span>
		<span class="col2">프로그램아이디</span>
		<span class="col4">프로그램명</span>
		<span class="col2">연결메뉴</span>
		<span class="col2">jsp파일명</span>
		<span class="col2">url</span>
		<span></span>
	</div>

<div id="rows">	
	<%
	int i=0;
	for(ProgramDTO dto:programList){ 
	%>
	<div class="row">
		<span class="col1"><input type="checkbox" name="chk"/></span>
		<span class="col2"><input type="text" name="pID" value="<%=dto.getpID()%>" class="col2"/></span>
		<span class="col4"><input type="text" name="pName" value="<%=dto.getpName() %>" class="col2"/></span>
		<span class="col2">
			<select id="selMenus" name="selMenus" idx="<%=i%>">
			<option value="">--선택해주세요--</option>
			<%for(MenuDTO dto2:menuList){ %>
			<option value="<%=dto2.getMenuID()%>" 
			<%if(dto.getMenuID().equals(dto2.getMenuID())){ %>
				selected
			<%} %>
			><%=dto2.getMenuName()%></option>
			<%} %>
			</select>
		</span>
		<span class="col2"><input type="text" name="pFileName"  idx="<%=i%>" value="<%=dto.getpFileName()%>" class="col2"/></span>
		<span class="col2"><input type="text" name="fileUrl"  idx="<%=i%>"  value="<%=dto.getFileUrl()%>" class="col2"/></span>
		<span><input type="text" name="hVal" value="" style="width:10px"></span>
	</div>
	
	<%
	i +=1;
	} 
	%>
</div>


	<div id="dialog" title="알림"></div>
 	<div id="delMsg" title="경고창"></div>
</body>
</html>