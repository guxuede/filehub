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
<script src="/resources/script/jquery.form.js" type="text/javascript"></script>

<script src="/resources/jquery-datatable.js" type="text/javascript"></script>

<style type="text/css">

.table-striped > tbody > tr:nth-child(odd) > td,
.table-striped > tbody > tr:nth-child(odd) > th {
  background-color: #f9f9f9;
}

.table-hover > tbody > tr:hover > td,
.table-hover > tbody > tr:hover > th {
  background-color: #f5f5f5;
}
.kktable th{
	width:200px;
}
.kktable td{
	width:300px;
}
</style>
</head>
<body>
<fieldset>
	<legend>Test1</legend>
	<form:form commandName="user" action="test1_save" method="POST" cssClass="mform">
		<form:input path="mfloat"/>
		<form:input path="money"/>
		<input type="button" id="upload" value="tijiao">
	</form:form>
	
	<script type="text/javascript">
	$('#upload').click(function(){
		var data = JSON.stringify($("#user").inputs('get')); 
		console.log(data);
		// $.post("/admin/user/test1_save", data, function(r){
		//	 console.log(r);
		 //}, "json");
/* 		$('#user').ajaxSubmit({success:function(r){
			console.log(r);
		}}); */
		$.ajax({
             type: "Post",   //访问WebService使用Post方式请求
             contentType: "application/json", //WebService 会返回Json类型
             url: "/admin/user/test1_save", //调用WebService的地址和方法名称组合 ---- WsURL/方法名
             data: "{\"PersonDTO\":"+data+"}",         //这里是要传递的参数，格式为 data: "{paraName:paraValue}",下面将会看到      
             dataType: 'json',
             success: function (result) {     //回调函数，result，返回值
                 console.log(result);
             }
         });
		
	});
	</script>
</fieldset>
<fieldset>
	<legend>Test2</legend>
	<form:form commandName="user" action="test2_save" method="POST" cssClass="mform">
		<form:input path="birthday"/>
		<input type="submit">
		<textarea name="lastName" style="margin: 0px; width: 230px; height: 82px;">xiang</textarea>
	</form:form>
	<p>KKKK: ${user.birthday}</p>
</fieldset>
<div>
	<table class="kktable">
		<thead>
			<tr><th>dssssssssssssssss</th><th>dssssssssssssssss</th><th>dssssssssssssssss</th><th>dssssssssssssssss</th><th>dssssssssssssssss</th><tr>
		</thead>
		<tbody>
			<tr><td>ddd</td></tr>
		</tbody>
	</table>
</div>

<div>
	<h3>Total</h3>
	<span id='total'></span>
</div>

<div id="tablediv">
	<table id="mytable1" cellspacing="1" class="tablesorter table table-striped table-bordered table-condensed table-hover" >
		<thead>
			<tr>
				<th>first name</th>
				<th>last name</th>
				<th>hasFood</th>
				<th>Food地区/名称/剩余</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody
			data-table="T_user" 
			data-id="userid"
			data-relatedTable="T_food,T_ares" 
			data-model="users" 
			data-genrow="genRowForUser"
			data-onchange="onUserChange">
		</tbody>
	</table>
</div>
<br><br><br>
<div id="tablediv">
	<table cellspacing="1" class="tablesorter pure-table pure-table-bordered">
		<thead>
			<tr>
				<th>first name</th>
				<th>last name</th>
				<th>hasFood</th>
				<th>Food地区/名称/剩余</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody
			data-table="T_user" 
			data-id="userid"
			data-relatedTable="T_food,T_ares" 
			data-model="users" 
			data-genrow="genRowForUser"
			data-onchange="onUserChange">
		</tbody>
	</table>
</div>
<br><br><br>
<br><br>
水果
<div id="tablediv">
	<table cellspacing="1" class="tablesorter pure-table pure-table-bordered" 
		data-table="T_food" 
		data-id="fid"
		data-model="foods" 
		data-relatedTable="T_user,T_ares" 
		data-genrow="T_food_GenRow"
		data-onchange="">
		<thead>
			<tr>
				<th>名称</th>
				<th>个数</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<br><br>
地域
<div>
	<table cellspacing="1" class="tablesorter pure-table pure-table-bordered" 
		data-table="T_ares" 
		data-id="aid"
		data-model="ares" 
		data-relatedTable="T_food,T_user" 
		data-genrow=""
		data-onchange="">
		<thead>
			<tr>
				<th>名称</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
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
	<textarea name="lastName" style="margin: 0px; width: 230px; height: 82px;">xiang</textarea>

 </div>
 
<script type="text/javascript">
	var ares=[{'aid':'xian',"name":"西安"},{'aid':'beijing',"name":"北京"}];
	var foods=[{'fid':'F001',"name":"苹果","number":100,"fkaid":"xian"},{'fid':'F002',"name":"栗子","number":100,"fkaid":"beijing"}];
	
	var users=[];
	users[0]={"userid":"110","firstName":"guxuede","lastName":"xue","age":"13","total":"123342","discount":"100%","date":"2012/2/3","kkkk":'123',"fid":"F001","fcount":10,"birthday":"2012-21-05"};
	users[1]={"userid":"111","firstName":"guxiang","lastName":"xiang","age":"22","total":"42232","discount":"77%","date":"2001/1/3","kkkk":'123',"fid":"F002","fcount":2};
	
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
	}
	
	function removeUser(userid){
		var u=DT.deleteData('T_user',userid);
		u.food.number=parseFloat(u.food.number)+parseFloat(u.fcount);
		DT.synchronousTableFromModelByName('T_user');
		DT.synchronousTableFromModelByName('T_food');
	}
	
	
	$(function(){
		DT.utilGenerateRelationship(users,'fid','food',foods,'fid');
		DT.utilGenerateRelationship(foods,'fkaid','are',ares,'aid');
		DT.synchronousTableFromModelByName('T_user');
		DT.synchronousTableFromModelByName('T_food');
		/*$('#mytable1').tablesorter({
			sortList: [[0,0]],//sort on the first column order asc
			textExtraction: function(node) {
				if(node.childNodes.length > 0){
					var c=node.childNodes[0];
					return node.childNodes[0].value;
				}else{
					//return node.innerHTML;
				}
			}
		}).bind("sortStart",function() {
			console.log('sortStart');
		}).bind("sortEnd",function() {
			console.log('sortEnd');
			$('td.index').each(function(i,e){
				$(e).text(i);
			});
		});*/
	});
	
	function genRowForUser(index,o,T){
		var tr="<tr>"+
		"<td><input name='firstName'></td>"+
		"<td name='lastName'></td>"+
		"<td><textarea style='margin: 0px; width: 230px; height: 82px;' name='lastName'></textarea></td>"+
		/*
		"<td><input name='age' value="+o.age+"></td>"+
		"<td><input name='total' value="+o.total+"></td>"+
		"<td><input name='discount' value="+o.discount+"></td>"+
		"<td><input name='date' value="+o.date+"></td>"+
		*/
		"<td><input name='fcount'></td>"+
		"<td style='width:100px'><input name='food.are.name'><input name='food.name'><input name='food.number'></td>"+
		"<td><input name='ck' type='checkbox' value='001'><input name='ck' type='checkbox' value='002'></td>"+
		"<td><button onclick='removeUser(\""+o.userid+"\",this);'>Remove</button></td>"+
		"<td class='index'>1</td>"+
		"<td><select name='select'><option value='1'>one</option><option value='2'>two</option></select></td>"+
		"</tr>"
		return tr;
	}
	function T_food_GenRow(index,o,T){
		var tr="<tr>"+
		"<td><input name='name' value="+o.name+"></td><td><input name='number' value="+o.number+"></td><td><input><button onclick='addFood(\""+o.fid+"\",this);'>add</button></td>"
			+
		"</tr>"
		var ttrr=$(tr);
		return tr;
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

<script>
function clone(para){
    var rePara = null;
    var type = Object.prototype.toString.call(para);
    if(type.indexOf("Object") > -1){
        rePara = {};
        for(var key in para){
            if(para.hasOwnProperty(key)){
                rePara[key] = clone(para[key]);
            }
        }
    }else if(type.indexOf("Array") > 0){
        rePara = [];
        for(var i=0;i<para.length;i++){
           rePara[rePara.length] =  clone(para[i]);
        }
    }else{
        rePara = para;
    }
    return rePara;
}

function extend(from, to)
{
    if (from == null || typeof from != "object") return from;
    if (from.constructor != Object && from.constructor != Array) return from;
    if (from.constructor == Date || from.constructor == RegExp || from.constructor == Function ||
        from.constructor == String || from.constructor == Number || from.constructor == Boolean)
        return new from.constructor(from);

    to = to || new from.constructor();

    for (var name in from)
    {
        to[name] = typeof to[name] == "undefined" ? extend(from[name], null) : to[name];
    }

    return to;
}
</script>
</body>
</html>