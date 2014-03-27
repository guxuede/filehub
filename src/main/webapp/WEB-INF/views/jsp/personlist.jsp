<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>

<style type="text/css">
 .vmsg{
 	border: none;
	display: inline-block;
	width: 16px;
	height: 16px;
	background-repeat: no-repeat;
 }
 .info{
 	background-image: url("/resources/img/info.gif")
 }
 .success{
 	background-image: url("/resources/img/success.gif")
 }
 .error{
 	background-image: url("/resources/img/error.gif")
 }
 .warning{
 	background-image: url("/resources/img/warning.gif")
 }
</style>
</head>
<body>


<h1>Listing People</h1>
<table id="content">
	<tbody id="personTable">
			<c:forEach items="${people}" var="v_person">
			<tr data-identifier="${v_person.id}" data-haschanges="false" data-issaving="false">
				<td><a href="edit?id=${v_person.id}">${v_person.id}</a></td>
				<td><input type="text" name="firstName" value="${v_person.firstName}" data-haschanges="false"></td>
				<td><input type="text" name="lastName" value="${v_person.lastName}" data-haschanges="false"></td>
			</tr>
			</c:forEach>
	</tbody>
</table>
<a href="edit"> Add Person</a>
<textarea class="wysiwyg" cols="100"></textarea>
</body>
<script type="text/javascript">
	$('#personTable input').change(function(){
		$(this).attr('data-haschanges',true);
		$(this).parents('tr:first').attr('data-haschanges',true);
	});
	$('#personTable tr').mouseleave(function(){
		var $THIS=$(this);
		if($THIS.attr('data-haschanges')=="true" && $THIS.attr('data-issaving')=="false"){
			var formInput=$THIS.find('input[data-haschanges=true]');
			formInput.attr("readonly","readonly");
			$THIS.attr('data-issaving',true);
			var formData=formInput.serialize();
			formInput.each(function(){
				formData=formData+"&_filed="+$(this).attr('name');
			});
			var id=$THIS.attr('data-identifier');
			$.ajax({url:"/person/update/"+id,data:formData,type:"POST",success:function(r){
				console.log(r);
				$THIS.attr('data-issaving',false).attr('data-haschanges',false);
				formInput.attr('data-haschanges',false).removeAttr("readonly");
				$(r.fieldErrors).each(function(i,v){
					console.log(v.field,v.errormsg);
					var input=$THIS.find('input[name='+v.field+']');
					addVmessage(input,'error',v.errormsg);
				});
			}
			});
		}
	});
	
	//给指定的字段添加错误 
	function addVmessage(input,type,msg){
		var inputParent=input.parent();
		var vmsg=inputParent.children('input.vmsg.'+type);
		if(vmsg.length){
			vmsg.attr('title',msg);
		}else{
			$('<input class="vmsg" readonly="readonly">').addClass(type).attr('title',msg).appendTo(inputParent);
		}
	}
	//给form添加错误
	function addVmessageFrom(from,type,msg){
		var inputParent=input.parent();
		var vmsg=inputParent.children('input.vmsg.'+type);
		if(vmsg.length){
			vmsg.attr('title',msg);
		}else{
			$('<input class="vmsg" readonly="readonly">').addClass(type).attr('title',msg).appendTo(inputParent);
		}
	}
	//移除input 中指定的错误类型 
	function removeVmessage(input,type){
		var exp='input.vmsg';
		if(typeof(type) != 'undefined'){
			exp=exp+'.'+type
		}
		input.parent().children(exp).remove();
	}
	//移除form 中指定的错误类型 
	function removeVmessageForm(form,type){
		var exp='input.vmsg';
		if(typeof(type) != 'undefined'){
			exp=exp+'.'+type
		}
		form.find(exp).remove();
	}
	/*
		将data(json) 按照key(name) value 填充到表单中 
	*/
	function inputForm(form,data){
		$.each(data,function(name,value) {
			if(!(form.find('input[name='+name+']').val(value)).length){
				form.find('*[name='+name+']').text(value);
			}
		});
	}
</script>
</html>
