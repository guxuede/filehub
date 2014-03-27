<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" media="screen" href="/resources/jquery.tablesorter/addons/pager/jquery.tablesorter.pager.css" />

<script src="/resources/jquery.tablesorter/addons/pager/jquery.tablesorter.pager.js" type="text/javascript"></script>

<script src="/resources/jquery.tablesorter/jquery.tablesorter.js" type="text/javascript"></script>

<script src="/resources/jquery-inputs.js" type="text/javascript"></script>


<style type="text/css">

.pure-table {
    /* Remove spacing between table cells (from Normalize.css) */
    border-collapse: collapse;
    border-spacing: 0;
    empty-cells: show;
    border: 1px solid #cbcbcb;
}

.pure-table caption {
    color: #000;
    font: italic 85%/1 arial, sans-serif;
    padding: 1em 0;
    text-align: center;
}

.pure-table td,
.pure-table th {
    border-left: 1px solid #cbcbcb;/*  inner column border */
    border-width: 0 0 0 1px;
    font-size: inherit;
    margin: 0;
    overflow: visible; /*to make ths where the title is really long work*/
   /* padding: 6px 12px; cell padding */
}
.pure-table td:first-child,
.pure-table th:first-child {
    border-left-width: 0;
}

.pure-table thead {
    background: #e0e0e0;
    color: #000;
    text-align: left;
    vertical-align: bottom;
}

/*
striping:
   even - #fff (white)
   odd  - #f2f2f2 (light gray)
*/
.pure-table td {
    background-color: transparent;
}
.pure-table-odd td {
    background-color: #f2f2f2;
}

/* nth-child selector for modern browsers */
.pure-table-striped tr:nth-child(2n-1) td {
    background-color: #f2f2f2;
}

/* BORDERED TABLES */
.pure-table-bordered td {
    border-bottom: 1px solid #cbcbcb;
}
.pure-table-bordered tbody > tr:last-child td,
.pure-table-horizontal tbody > tr:last-child td {
    border-bottom-width: 0;
}


/* HORIZONTAL BORDERED TABLES */

.pure-table-horizontal td,
.pure-table-horizontal th {
    border-width: 0 0 1px 0;
    border-bottom: 1px solid #cbcbcb;
}
.pure-table-horizontal tbody > tr:last-child td {
    border-bottom-width: 0;
}

.pure-table input{
	//width:100%;
}
</style>
</head>
<body>
<div id="tablediv">
	<table id="mytable1" cellspacing="1" class="tablesorter pure-table pure-table-bordered" data-table="T_user">			
		<thead>
			<tr>
				<th>first name</th>
				<th>last name</th>
				<th>age</th>
				<th>total</th>
				<th>discount</th>
				<th>date</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<div id="tablediv2">
	<table id="mytable2" cellspacing="1" class="tablesorter pure-table pure-table-bordered" data-table="T_user">			
		<thead>
			<tr>
				<th>first name</th>
				<th>last name</th>
				<th>age</th>
				<th>total</th>
				<th>discount</th>
				<th>date</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<div id="tablediv3">
	<table id="mytable3" cellspacing="1" class="tablesorter pure-table pure-table-bordered" data-table="T_Foot">			
		<thead>
			<tr>
				<th>name</th>
				<th>number</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	var foods=[{"name":"苹果","number":100},{"name":"栗子","number":100}];
	var users=[];
	users[0]={"firstName":"guxuede","lastName":"xue","age":13,"total":123342,"discount":"100%","date":"2012/2/3","kkkk":'123'};
	users[1]={"firstName":"guxiang","lastName":"xiang","age":22,"total":42232,"discount":"77%","date":"2001/1/3","kkkk":'123'};
	users[0].food=foods[0];
	users[1].food=foods[1];
	
	
	$(function(){
		$(users).each(function(i,o){
			createRow_T_user(o,'T_user');
		});
		$(foods).each(function(i,o){
			createRow_T_foods(o,'T_Foot');
		});
		
		//mytable
		//$(".tablesorter").tablesorter({
		//});
	});
	
	var T_user_ChangeListener=function(){
		//console.log(.parent('table'));
		var table=$(this).parents('table');
		synchronousDataTable(table,users);
		synchronousDataTable($('#mytable3'),foods);
	}
	
	function createRow_T_user(o,T){
		var foodname="";
		if(typeof o.food !== "undefined"){
			foodname=o.food.name;
		}
		var tr="<tr>"+
		"<td><input name='firstName' value="+o.firstName+" path></td>"+
		"<td><input name='lastName' value="+o.lastName+"></td>"+
		"<td><input name='age' value="+o.age+"></td>"+
		"<td><input name='total' value="+o.total+"></td>"+
		"<td><input name='discount' value="+o.discount+"></td>"+
		"<td style='width:100px'><input name='date' value="+o.date+"><input name='food.name' value="+foodname+"></td>"+
		"</tr>"
		var ttrr=$(tr);
		ttrr.find('input').change(T_user_ChangeListener);
		ttrr.appendTo($("table[data-table="+T+"] tbody"));
	}
	
	function createRow_T_foods(o,T){
		var tr="<tr>"+
		"<td><input name='name' value="+o.name+"></td><td><input name='number' value="+o.number+"></td><td><input><button onclick='addFood(2,this);'>add</button></td>"
			+
		"</tr>"
		$(tr).appendTo($("table[data-table="+T+"] tbody"));
	}
	
	function getJsonDataFromTable(table){
		var d=[];
		$('tbody tr',table).each(function(i,e){
			d[i]=$('input',e).inputs('get');
		});
		return d;
	}
	
	//var  modle=[];
	function synchronousDataTable(table,m){
		var a=getJsonDataFromTable(table);
		console.log('before',m);
		 $.each(a,function(i,o) {
			 $.each(o,function(k,v) {
	           m[i][k]=v;
	          // console.log(k,v);
			 });
	     });
		console.log('after',m);
		$("table[data-table="+table.attr('data-table')+"]").each(function(i,e){
			$('tbody tr',this).each(function(ii,ee){
				$(ee).inputs('set',a[ii]);
			});
		});
	}
	
	function addFood(id,e){
		var a=$(e).prev().val();
		console.log(foods[id]);
		foods[id].number=foods[id].number-a;
	}
</script>
</body>
</html>