<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- 
<link rel="stylesheet" type="text/css" media="screen" href="/resources/bootstraptwbs/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/resources/bootstraptwbs/css/google-bootstrap.css" />
 -->

<link rel="stylesheet" type="text/css" media="screen" href="/resources/jquery.tablesorter/addons/pager/jquery.tablesorter.pager.css" />


<script src="/resources/jquery.tablesorter/addons/pager/jquery.tablesorter.pager.js" type="text/javascript"></script>

<script src="/resources/jquery.tablesorter/jquery.tablesorter.js" type="text/javascript"></script>

<script src="/resources/jquery-inputs.js" type="text/javascript"></script>

<script src="/resources/jquery-datatable3.js" type="text/javascript"></script>

<style type="text/css">

.table-striped > tbody > tr:nth-child(odd) > td,
.table-striped > tbody > tr:nth-child(odd) > th {
  background-color: #f9f9f9;
}

.table-hover > tbody > tr:hover > td,
.table-hover > tbody > tr:hover > th {
  background-color: #f5f5f5;
}
	/*
		表格的大小时不好控制的.设置表格的大小,如果td太大,会把表格撑大,td刚好,表格又太大,会将rd又带大
	*/
		.tablewrap{
			width: 600px;
			overflow-y: hidden;
			overflow-x: auto;
		}
		.tbodywrap{
			width: 600px;
			height: 100px;
			overflow-y: scroll;
			overflow-x: hidden;
		}
		table{
			border-collapse: collapse;
			border-spacing: 0;
			border: 1px solid #dddddd;
			width: 600px;
		}
		
		td{
			width: 200px;
			border: 1px solid #dddddd;
			word-break: break-all; 
			word-wrap:break-word;
		}
		th{
			width: 200px;
			border: 1px solid #dddddd;
			word-break: break-all; 
			word-wrap:break-word;
		}
		
		button{
			width: 150px;
			height: 40px;
			background-color: #ccccff;
			margin-left: 80px;
		}
		
		.screen{
			width:100%;
			height:100%;
			overflow: scroll;
			display: none;
			position: absolute;
			left: 0px;
			top: 0px;
			z-index: 811211;
		}
		html.lock{
			overflow: hidden;
		}
		body.lock{
			height: 0px;
			overflow: hidden;
		}
</style>
</head>
<body>
		<div id="user1"
			data-table="T_user" 
			data-id="userid"
			data-model="users" 
			data-dataSelector="._data"
			data-relatedTable="" 
			data-genrow="genRowForUser"
			data-onchange="onUserChange">
		</div>
		
		<hr>
		<div id="user2"
			data-table="T_user" 
			data-id="userid"
			data-model="users" 
			data-dataSelector="._data"
			data-relatedTable="T_food,T_ares" 
			data-genrow="genRowForUser"
			data-onchange="onUserChange">
		</div>
		
		<hr>
		<div
			data-table="T_food" 
			data-id="fid"
			data-model="foods" 
			data-relatedTable="T_ares,T_user,^=T_Userfoods" >
		</div>
<br><br><br>
<br><br>

<div id="iform" class="mform">
<div>
	<h4>Mc checkbox</h4>
	<input type="checkbox" checked="checked" value="1" name="mc">
	<input type="checkbox" checked="checked" value="2" name="mc">
</div>
<div>
	<h4>food checkbox</h4>
	<input type="checkbox" checked="checked" value="F001" name="food">
	<input type="checkbox" checked="checked" value="F002" name="food">
	<input type="checkbox" checked="checked" value="F003" name="food">
	<input type="checkbox" checked="checked" value="F004" name="food">
</div>
<div>
	<h4>food checkbox</h4>
	<input type="radio" value="M001" name="aire">
	<input type="radio" value="M002" name="aire">
	<input type="radio" value="M003" name="aire">
</div>
	<textarea name="lastName" style="margin: 0px; width: 230px; height: 82px;" id="mtextarea">xiang</textarea>
	<input type="text" value="kkkkkkkkkk" name="minput" id="minput">
 </div>
 
<script type="text/javascript">
	var ares=[{'aid':'xian',"name":"西安"},{'aid':'beijing',"name":"北京"}];
	var foods=[{'fid':'F001',"name":"苹果","number":100,"fkaid":"xian"},{'fid':'F002',"name":"栗子","number":100,"fkaid":"beijing"},{'fid':'F003',"name":"","number":'',"fkaid":"beijing"}];
	var users=[];
	users[0]={"userid":"110","firstName":"guxuede","lastName":"xue","age":"13","total":"123342","discount":"100%","date":"2012/2/3","kkkk":'123',"fid":"F001","fcount":10,"birthday":"2012-21-05"};
	//users[1]={"userid":"111","firstName":"wasd","lastName":"xiang","age":"22","total":"42232","discount":"77%","date":"2001/1/3","kkkk":'123',"fid":"F002","fcount":2};
	///users[2]={"userid":"112","firstName":"sff","lastName":"xiang","age":"22","total":"42232","discount":"77%","date":"2001/1/3","kkkk":'123',"fid":"F002","fcount":2};
	/*users[3]={"userid":"113","firstName":"guxgfhiang","lastName":"xiang","age":"22","total":"42232","discount":"77%","date":"2001/1/3","kkkk":'123',"fid":"F002","fcount":2};
	users[4]={"userid":"114","firstName":"df","lastName":"xiang","age":"22","total":"42232","discount":"77%","date":"2001/1/3","kkkk":'123',"fid":"F002","fcount":2};
	users[5]={"userid":"115","firstName":"fgh","lastName":"xiang","age":"22","total":"42232","discount":"77%","date":"2001/1/3","kkkk":'123',"fid":"F002","fcount":2};
	users[6]={"userid":"116","firstName":"hgj","lastName":"xiang","age":"22","total":"42232","discount":"77%","date":"2001/1/3","kkkk":'123',"fid":"F002","fcount":2};
*/
	users[0].foods=foods;
	
	function onUserChange(Tname,modle,$TABLE,input){
		var total=0;
		$TABLE.find("input[name='food.number']").each(function(){
			total+=parseInt($(this).val());
		});
		$('#total').text(total);
		return true;
	}
		
	function addFood(fid,e){
		var a=$(e).prev().val();
		var food=DT.findData('T_food',fid)
		food.number-=a;
		var user={};
		user.userid=new Date().getMilliseconds();//一定要给id啊,不然数据错乱
		user.food=food;
		user.fcount=a;
		user.firstName="kkkk";
		DT.addData('T_user',user);
		
		DT.synchronousTableFromModelByName('T_user');
		DT.synchronousTableFromModelByName('T_food');
		DT.synchronousTableFromModelByNamePrefix('T_Userfoods');
	}
	
	function removeUser(userid){
		var u=DT.deleteData('T_user',userid);
		u.food.number=parseFloat(u.food.number)+parseFloat(u.fcount);
		DT.synchronousTableFromModelByName('T_user');
		DT.synchronousTableFromModelByName('T_food');
	}
	
	
	$(function(){
		DT.utilGenerateRelationship(users,'fid','food',foods,'fid');
		DT.synchronousTableFromModelByName('T_user');
		DT.synchronousTableFromModelByName('T_food');
		DT.synchronousTableFromModelByNamePrefix('T_Userfoods');
	});
	
	function T_food_GenRow(index,o,T){
		var tr="<tr>"+
		"<td><input name='name' value="+o.name+"></td><td><input name='number' value="+o.number+"></td><td><input><button onclick='addFood(\""+o.fid+"\",this);'>add</button></td>"
			+
		"</tr>"
		var ttrr=$(tr);
		return tr;
	}
	
	function genRowForUser(index,o,T){
		var tr="<div>"+
			"<div class='_data'>"+
				"<span><input name='firstName'></span>"+
				"<span><textarea style='margin: 0px;' name='lastName'></textarea></span>"+
				"<span><button onclick='removeUser(\""+o.userid+"\",this);'>Remove</button></span>"+
				"<span name='firstName'></span>"+
				"<input name='ck' type='checkbox' value='001'><input name='ck' type='checkbox' value='002'>"+
			"</div>"+
			"<div>"+
				"<p>以上总结:</p>"+
				"<p name='firstName'></p>"+
			"</div>"+
			"<div class='foods'>"+
				"<p>该用户所关联的水果.</p>"+
				"<div data-table='T_Userfoods"+index+"' data-id='fid' data-model='users["+index+"].foods' data-relatedTable='T_food' data-model-change='usersfoodsChange' data-table-firstload='usersfoodsChange' data-table-loaded='usersfoodsLoaded'></div>"+
				"<div>"+
					"<p>水果总结:</p>"+
					"<p class='total'></p>"+
				"</div>"+
			"</div>"+
		"</div>"
		return tr;
	}
	
	function usersfoodsChange(table,input){
		if(table.model.length > 0){
			var last =table.model[table.model.length-1];
			if(last){
				if(last.name.length > 0 || last.number.length > 0){
					DT.addData(table.tname,{'fid':"F"+Math.random()*1000000000000000000000,"name":"","number":"","fkaid":"xian"});
				}else{
					var last2 =table.model[table.model.length-2];
					if(last2){
						if((last2.name.length > 0 || last2.number.length > 0)==false){
							DT.popData(table.tname);
						}
					}
				}
			}
		}else{
			DT.addData(table.tname,{'fid':"F"+Math.random()*1000000000000000000000,"name":"","number":"","fkaid":"xian"});
		}
	}
	
	
	function usersfoodsLoaded(table){
		var total=0;
		$.each(table.model,function(i,d){
			total+=parseFloat0(d.number);
		});
		table.table.closest('.foods').find('.total').html(total);
	}
	
	function parseFloat0(v){
		return $.isNumeric(v)?parseFloat(v):0;
	}
	
	function saveUser(){
		console.log(users);
       $.ajax({
           type: "post", // 请求方式
           url: "add.json", //url地址
           data:JSON.stringify(users), //数据
           contentType: "application/json",
           dataType: "json",
           success: function (response, ifo) {
               alert("success");
           }, error: function () {
               alert("error");
           }
       });
	}
</script>
</body>
</html>