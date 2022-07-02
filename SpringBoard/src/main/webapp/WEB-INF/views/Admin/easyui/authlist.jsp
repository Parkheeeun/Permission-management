<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Expand row in DataGrid to show details - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/datagrid-detailview.js"></script>
</head>
<body>
    <h2>Expand row in DataGrid to show details</h2>
    <div style="margin-bottom:10px">
        <p>Click the expand button to expand row and view details.</p>
    </div>
    
    <table id="dg" style="width:700px;height:250px"
            url="JsonAuthList"
            pagination="true" sortName="itemid" sortOrder="desc"
            title="DataGrid - Expand Row"
            singleSelect="true" fitColumns="true">
        <thead>
            <tr>
                <th field="AUTHID" width="150">권한아이디</th>
                <th field="AUTHNAME" width="2000">권한이름</th>
         
            </tr>
        </thead>
    </table>
    <script type="text/javascript">
        $(function(){
            $('#dg').datagrid({
                view: detailview,
                detailFormatter:function(index,row){
                    return '<div class="ddv" style="padding:5px 0"></div>';
                },
                onExpandRow: function(index,row){
                    var ddv = $(this).datagrid('getRowDetail',index).find('div.ddv');
                    ddv.panel({
                        height:80,
                        border:false,
                        cache:false,
                        href:'JsonAuthList?itemid='+row.itemid,
                        onLoad:function(){
                            $('#dg').datagrid('fixDetailRowHeight',index);
                        }
                    });
                    $('#dg').datagrid('fixDetailRowHeight',index);
                }
            });
        });
    </script>
    
    
</body>
</html>