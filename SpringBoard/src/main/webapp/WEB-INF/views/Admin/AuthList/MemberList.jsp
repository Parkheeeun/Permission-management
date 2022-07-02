<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
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
	width:810px;
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
	width:170px;
	padding:4px 0px 5px 0px;	
	display:block;
	text-align:center;
	float:left;

}

.col3{
border:1px solid #444;
	width:170px;
	padding:4px 0px 5px 0px;	
	display:block;
	text-align:center;
	float:left;

}

.col4{
border:1px solid #444;
	width:290px;
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

<script>
var selectMemberList=function(){
	var url="JsonMemberList";
	var type="post";
	var async=false;
	var vars=["searchMName"];
	var params=[$("#search").val()];
	var dataType="json";
	var sucFunc=function(data){
		var strHTML="";
		$(data).each(
			function(){
				var members=this.MemberList;
				var authes=this.AuthList;
				
				var i=0;
				$(members).each(
					function(){
						strHTML+='<div class="row">';
						strHTML+=	'<span class="col1"><input type="checkbox" name="chk" value=""/></span>';
						strHTML+=	'<span><input type="text" name="mID" class="col2" readonly value="'+this.MID+'"/></span>';
						strHTML+=	'<span><input type="text" name="mName" class="col3" value="'+this.MNAME+'" data="'+i+'"/></span>';
						strHTML+=	'<span>';
						strHTML+=		'<select name="authID" class="col4" style="" data="'+i+'">';
						var strAUTHID=this.AUTHID;
						$(authes).each(
							function(){
								strHTML+=		'<option value="'+this.AUTHID+'"';
								if(strAUTHID==this.AUTHID){strHTML+='selected';}
								strHTML+= '>'+this.AUTHNAME+'</option>';
								
							}		
						);
			
			
						strHTML+=	'</select>';
						strHTML+='</span>';
						strHTML+='<span><input type="text" name="hVal" value="" class="col5"/></span>';
						strHTML+='<span><input type="text" name="mthID" value="'+this.MTHID+'" class="col5" style="width:100px"/></span>';
						
						strHTML+='</div>';
						i+=1;
					}	
					
				);
				$("#showList").html(strHTML);
			}		
		
		);
	}
	
	var errFunc=function(err){
		alert("err");
	}
	var obj=new ajaxObj(url,type,vars,params,async,dataType,sucFunc,errFunc);
	obj.toJson();
	obj.ajaxExec();
}



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




$(document).ready(
	function(){
		//페이지로딩시실행되는함수
		selectMemberList();
		//체크박스전체선택,해제
		chkClickFunc();
		
		//조회(btnSearch)클릭시
		$("#btnSearch").click(
			function(){
				selectMemberList();
			}		
		);
		
		//추가클릭시작
		$("#btnAdd").click(
			function(){
				//1.ajax발동해서 data가져오기
				var url="JsonAuthList";
				var type="post";
				var async=true;
				var vars=["authName"];
				var params=[""];
				var dataType="json";
				
				var sucFunc=function(data){
					/*
					$.each(data,function(index,item){
						alert(index+"-"+item.AUTHID);
					});*/
					var strHTML="";
							strHTML+='<div class="row">';
							strHTML+=	'<span class="col1"><input type="checkbox" name="chk" value=""/></span>';
							strHTML+=	'<span><input type="text" name="mID" class="col2" readonly value=""/></span>';
							strHTML+=	'<span><input type="text" name="mName" class="col3" value=""/></span>';
							strHTML+=	'<span>';
							strHTML+=		'<select name="authID" class="col4" style="">';
						
							$(data).each(
								function(){
									strHTML+=		'<option value="'+this.AUTHID+'">'+this.AUTHNAME+'</option>';
									
								}		
							);
				
							strHTML+=	'</select>';
							strHTML+='</span>';
							strHTML+='<span><input type="text" name="hVal" value="I" class="col5"/></span>';
							strHTML+='<span><input type="text" name="mthID" value="" class="col5" style="width:100px"/></span>';
							strHTML+='</div>';
						
						$("#showList").append(strHTML);
				
				}
				var errFunc=function(err){
					alert("err");
				}
				var obj=new ajaxObj(url,type,vars,params,async,dataType,sucFunc,errFunc);
				obj.toJson();
				obj.ajaxExec();
			}		
		);
		
		$("input[name='mName'], select[name='authID']").on("change",function(){
			var selectedNum=$(this).attr("data");
			$("input[name='hVal']").eq(selectedNum).val("U");
			
			
		});
		
		
		//저장클릭시작
		$("#btnSave").click(
			function(){
				$("#memberForm").submit();
				
			}		
		);
		
		//삭제클릭시작
		$("#btnDelete").click();
	}		
		
);//$(document).ready끝
</script>
</head>
<body>
	<div id="wrap">
		<div class="search">
			<input type="text" id="search" name=searchMName/>
			<input type="button" value="조회" id="btnSearch"/>
			<input type="button" value="추가" id="btnAdd"/>
			<input type="button" value="저장" id="btnSave"/>
			<input type="button" value="삭제" id="btnDelete"/>
		</div>
	
		<div class="row">
			<span class="col1"><input type="checkbox" name="chkAll" value=""/></span>
			<span class="col2">회원아이디</span>
			<span class="col3">회원이름</span>
			<span class="col4">회원권한</span>
			<span class="col5">&nbsp;</span>
		</div>
		
		
		<form name="memberForm" id="memberForm" method="post" action="MemberSave">
		<div id="showList"></div>
		</form>
		<!--회원리스트 반복시작 -->
		 
		
	</div>
</body>
</html>