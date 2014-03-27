<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" media="screen" href="/resources/jquery.jqGrid-4.4.1/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/resources/jquery.jqGrid-4.4.1/css/ui.jqgrid.person.css" />

<script src="/resources/jquery.jqGrid-4.4.1/js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="/resources/jquery.jqGrid-4.4.1/js/jquery.jqGrid.src.js" type="text/javascript"></script>



<style type="text/css">

	/*将个别几个表头设置为淡红色 */
	#jtable_lastName,#jtable_address,#jtable_age{
		background-color: #fe9a9f;
	}
	
	.bgCFCEBE4{
		background-color: #FCEBE4;;
	}
</style>
</head>
<body>
		<div class="message errormsg"><p>An error message goes here</p></div>

		<div class="message success"><p>A success message goes here</p></div>

		<div class="message info"><p>An informative message goes here</p></div>
		
		<div class="message warning"><p>A warning message goes here</p></div>
	<div>
		<p>Total:<span id="total"></span></p>
	</div>
	<table id="jtable"></table>
	
<script type="text/javascript">
var myDelOptions = {
		//url: '/admin/user/delete.json',
		//mtype : "DELETE",
        afterComplete: function(a,b,c){
        	recalculateTotal();
        	console.log('myDelOptions.afterComplete',a,b,c);
        	return true;
        }
};
var myEditOptions = {
		//url: '/admin/user/delete.json',
		//mtype : "PUT",
        afterComplete: function(a,b,c){
        	recalculateTotal();
        	console.log('myEditOptions.afterComplete',a,b,c);
        	return true;
        }
};
function myelem (value, options) {
	  var el = document.createElement("input");
	  el.type="text";
	  el.value = value;
	  return el;
	}
	 
function myvalue(elem, operation, value) {
	console.log('kkkkkkkkkkkkkkkkkk',elem,operation,value);
    if(operation === 'get') {
       return $(elem).val();
    } else if(operation === 'set') {
       $('input',elem).val(value);
    }
}
	
var lastsel;
	$(function(){
		var grid=$("#jtable").jqGrid({
		   url:'/admin/user/list.json',
		   editurl : '/admin/user/update.json',
		   //cellEdit :true,
		   cellsubmit: 'remote',
	       cellurl: '/admin/user/update.json',
	       
		   datatype: "json",	
		   colNames: ['','','firstName','', 'lastName', 'address', 'age', 'sex', 'money', 'phone', 'mobile', 'qq', 'email'],
		   colModel: [
		         {name: 'id',index: 'id' , width: 100,formatter:function(r,o,c){return "<input type='text' style='width:50%'><button onclick='funAdd(this,\""+r+"\");' style='width:50%'>add</button>"}},
				 {name: 'id',index: 'id' , key:true,frozen : true, width:80, fixed:true, sortable:false, resize:false,
		        	   formatter:'actions',
		               formatoptions:{
		                    keys: true,
		                    editbutton: true,
		                    delbutton: true,
		                    //delOptions:myDelOptions,
		                    //editformbutton: true,
		                    editOptions: myEditOptions,//只有 editformbutton为true时,此选项才起作用 
		                    onSuccess:function(a,b,c){
		                    	console.log('formatoptions.onSuccess',a,b,c);
		                    	recalculateTotal();
		                    },
		                    onEdit:function(a,b,c){
		                    	console.log('formatoptions.onEdit',a,b,c);
		                    }
		                 }
				 },
		         {name: 'firstName', index: 'firstName', width: 80, align: 'center',editable:true,
					 editrules:{number:true}
		         },
		         {name: 'id',index: 'id' , width: 100,formatter:function(r,o,c){return "<button onclick='funAddOneCell(this,\""+r+"\");' style='width:50%'>add</button>"}},
		         {name: 'lastName', index: 'lastName', width: 70 ,editable:true},
		         {name: 'address', index: 'address', width: 75, align: 'right',editable:true},
		         {name: 'age', index: 'age', width: 75, align: 'right',editable:true},
		         {name: 'sex', index: 'sex', width: 75, align: 'right',editable:true},
		         {name: 'money', index: 'money', width: 75, align: 'center',editable:true,classes:'bgCFCEBE4',formatter: 'number'},
		         {name: 'phone', index: 'phone', width: 100, align: 'center',editable:true,edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue}},
		         {name: 'mobile', index: 'mobile', width: 70, sortable: false,editable:true},
		         {name: 'qq', index: 'qq', width: 100, align: 'center',editable:true},
		         {name: 'email', index: 'email', width: 100, align: 'center',editable:true}
		    ],
		    jsonReader : {   
		        root:"listData",
		        page: "currpage",   
		        total: "totalpages",   
		        records: "totalrecords",
		        repeatitems:false
		     },   
		     shrinkToFit: false ,
		   	 width:800,
			height: '100px',
		   gridComplete: function(){ 
			   recalculateTotal();
		    },
	       afterSaveCell: function (rowid, name, val, iRow, iCol) {//当cellEdit为true时才有用 
		        console.log('afterSaveCell');
		        recalculateTotal();
	        },
			onSelectRow: function(id){
				if(id && id!==lastsel){
					$.fn.fmatter.rowactions(lastsel,'jtable','save',1);
					$.fn.fmatter.rowactions(id,'jtable','edit',1);
					//jQuery('#jtable').jqGrid('editRow',id,true);
					lastsel=id;
				}
			}
		});
		$("#jtable").jqGrid('setGroupHeaders', {
			  useColSpanStyle: false, 
			  groupHeaders:[
				{startColumnName: 'lastName', numberOfColumns: 3, titleText: '<em>Price</em>'},
				{startColumnName: 'phone', numberOfColumns: 2, titleText: 'Shiping'}
			  ]	
		});
		//$("#jtable").jqGrid('setFrozenColumns');
		
		/*
		$(document).mousedown(function(event){
			//var a=$("#jtable #"+lastsel);
			var a=$('.ui-widget-overlay');
			if($(event.target).closest(a).length == 0){//out
				$("#jtable").jqGrid('saveRow',lastsel);
				console.log('out');
			}
		});*/
	})
	function recalculateTotal(){
        sum = $("#jtable").jqGrid('getCol','money', false, 'sum');
        $('#total').html(sum);
	}
	function funAdd(a,id){
		console.log(id);
		console.log($(a).parent().children('input').val(123));
	}
	function funAddOneCell(a,id){
		//$("#jtable").jqGrid('editRow',id);
		$("#jtable").jqGrid('saveRow',id,true,{ 
		    successfunc: function( response ) {
		    	console.log(response);
		        return true; 
		    }
		});
	}
</script>
</body>
</html>