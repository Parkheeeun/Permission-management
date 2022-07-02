<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.ArrayList, Pkg.Boards.VO.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	ArrayList<BoardVO> boardList=(ArrayList<BoardVO>)request.getAttribute("boardList");
	ArrayList<MemberVO> memberList=(ArrayList<MemberVO>)request.getAttribute("memberList");
%>
<style>
	.bRow{
		width:630px;
		height:30px;
		border:0px solid #777;
		clear:both;
	}
	
	.col1{
		width:50px;
		font-size:12px;
		text-align:center;
		padding:8px 0px 5px 0px;
		border:1px solid #999;
		display:block;
		float:left;
	}


	.col2{
		width:100px;
		font-size:12px;
		text-align:center;
		padding:8px 0px 5px 0px;
		border:1px solid #999;
		display:block;
		float:left;
	}
	
	.col3{
		width:200px;
		font-size:12px;
		text-align:center;
		padding:8px 0px 5px 0px;
		border:1px solid #999;
		display:block;
		float:left;
	}
	
		.col4{
		width:150px;
		font-size:12px;
		text-align:center;
		padding:8px 0px 5px 0px;
		border:1px solid #999;
		display:block;
		float:left;
	}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="jscss/js/common.js"></script>
<script>


/*
 $(document).ready(
	function(){
		var idx=$("input[name='title2']").on("change",function(){
			
			var idx2=$("input[name='status2']").get();
			idx2[idx.index(this)].value="U";
		});
		
	}		 
 ); 
 */
 
 var addRowFunc2=function(){
	 $("#btnAdd").on("click",function(){
		 
		var $div=$('<div>hello</div>');
		var div=document.createElement('div');
		var text=document.createTextNode('hello');
		div.appendChild(text);
		 
		 
		 
	 });
	 
 }
 
 
 var addRowFunc=function(){
		$("#btnAdd").on("click",function(){
			var strHTML="";
			strHTML+=`<div name="boardRow" class="bRow">`;
			strHTML+=`<span class="col1"><input type="checkbox" name="chk"/></span>`;
			strHTML+=`<span class="col2"><input type="text" name="idx" style="width:90px"></span>`;
			strHTML+=`<span class="col3"><input type="text" name="title" style="width:180px"/></span>`;
			strHTML+=`<span class="col4">`;
			strHTML+=`<select name="userID">`;
			<%for(MemberVO vo2:memberList){%>
			strHTML+=`<option value="<%=vo2.getUserID()%>"><%=vo2.getUserName()%></option>`;
			<%}%>
			strHTML+=`</select>`;
			strHTML+="</span>";
			strHTML+=`<span class="col2"><input type="text" style="width:90px" name="status" value="I"/></span>`;
			strHTML+="</div>";
			
			
			
			$("#board").append(strHTML);
			
		});
	}	
	 
 
 
 var saveBoardFunc=function(){
	 $("#btnSave").click(
		function(){
			$("#boardForm").attr("action", "saveBoard");
			$("#boardForm").submit();
		}		 
	 );
	 $("#btnDelete").click(
		function(){
			btnDelClick();
		}		 
	);
 }
 
 
 
 var btnDelClick=function(){
	 var isCheck=false;
	 $("input[name='chk']").each(
		function(){
		if($(this).is(":checked")){
			isCheck=true;
		}	
		}
	 );
	 if(!isCheck){
		 alert("선택하세요");
		 return;
	 }
	 
		var formId="delForm";
		var formAction="deleteBoard";
		var formMethod="post";
		var hiddenNames=[];
		var hiddenVals=[];
		var i=0;
	 $("input[name='chk']").each(
		function(){
			if($(this).is(":checked")){
				hiddenVals[i]=$(this).val();
				hiddenNames[i]="idx";
				i+=1;
			}
		}
	 );
	 
	var submitObj=new objectSubmit(formId,formAction,formMethod,hiddenNames,hiddenVals);
	submitObj.linkSubmit();
	 
 }
 
 
 
 $(document).ready(
		 function(){
			 $("input[name='title2']").on("change",function(){
					var idx=$("input[name='title2']");
					var idx2=$("input[name='status2']").get();
					idx2[idx.index(this)].value="U";
				});
			 $("select[name='userID2']").on("change",function(){
					var idx=$("select[name='userID2']");
					var idx2=$("input[name='status2']").get();
					idx2[idx.index(this)].value="U";
				});
			 
			 addRowFunc();
			 saveBoardFunc();
			 chkClickFunc();
			 
		 }
 );
 
 
 var chkClickFunc=function(){
	 $("input[name='headChk']").on("click",function(){
		if($(this).is(":checked")){
			$("input[name='chk']").prop("checked", true);
		} 
		else{
			$("input[name='chk']").prop("checked", false);
		}
		 
	 });
 }
 
 var titleChk=function(chgNumber){
	 var objStatus=document.getElementsByName("status");
	 objStatus[chgNumber].value="U";
 }
 
 
 
</script>
</head>
<body>
<form name="boardForm" method="post" id="boardForm">
<div>
	<input type="button" value="조회" id="btnSearch"/>
	<input type="button" value="추가" id="btnAdd"/>
	<input type="button" value="저장" id="btnSave"/>
	<input type="button" value="삭제" id="btnDelete"/>


</div>



	<div id="board" class="">
	
		<div id="boardTitle" class="bRow">
			<span class="col1"><input type="checkbox" name="headChk"/></span>
			<span class="col2">글번호</span>
			<span class="col3">글제목</span>
			<span class="col4">작성자</span>
			<span></span>
		</div>
	
	<%
	int i=0;
	for(BoardVO vo:boardList){
	%>
		<div name="boardRow" class="bRow">
			<span class="col1"><input type="checkbox" name="chk" value="<%=vo.getIdx()%>"/></span>
			<span class="col2"><input type="text" name="idx" style="width:90px" value="<%=vo.getIdx() %>" readonly/></span>
			<span class="col3"><input type="text" name="title" style="width:180px" value="<%=vo.getTitle()%>" onchange="titleChk(<%=i%>)"/></span>	
			<span class="col4">
				<select name="userID" onchange="titleChk(<%=i%>)">
				<%for(MemberVO vo2:memberList){ %>
					<option value="<%=vo2.getUserID()%>" 
					<%if(vo.getUserID().equals(vo2.getUserID())){ %>
					selected
					<%} %>
					><%=vo2.getUserName() %></option>
				<%} %>
				</select>
			</span>
			<span><input type="text" style="visibility:hidden" name="status" /></span>
		</div>
		<%
	i +=1;	
	} %>
	</div>
</form>
	
	
	
<!------------------------------------------------- ----> 	
	
	
<%--- 
	
<div>
	<input type="button" value="조회" id="btnSearch"/>
	<input type="button" value="추가" id="btnAdd"/>
	<input type="button" value="저장" id="btnSave"/>
	<input type="button" value="삭제" id="btnDelete"/>


</div>
	
	
	<div id="board2" class="">
	
		<div id="boardTitle2" class="bRow">
			<span class="col1"><input type="checkbox"/></span>
			<span class="col2">글번호</span>
			<span class="col3">글제목</span>
			<span class="col4">작성자</span>
			<span class="col2">&nbsp</span>
		</div>
	
	<%
	
	for(BoardVO vo:boardList){
	%>
		<div name="boardRow2" class="bRow">
			<span class="col1"><input type="checkbox" name="chk2"/></span>
			<span class="col2"><input type="text" name="idx2" style="width:90px" value="<%=vo.getIdx() %>" readonly/></span>
			<span class="col3"><input type="text" name="title2" style="width:180px" value="<%=vo.getTitle()%>"/></span>	
			<span class="col4">
				<select name="userID2">
				<%for(MemberVO vo2:memberList){ %>
					<option value="<%=vo2.getUserID()%>" 
					<%if(vo.getUserID().equals(vo2.getUserID())){ %>
					selected
					<%} %>
					><%=vo2.getUserName() %></option>
				<%} %>
				</select>
			</span>
			<span class="col2"><input type="text" style="width:90px" name="status2"/></span>
		</div>
		<%} %>
	</div>
	---%>
	
	

	
	
	
	
</body>
</html>