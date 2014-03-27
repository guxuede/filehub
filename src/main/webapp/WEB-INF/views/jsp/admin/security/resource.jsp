<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
	<title>Resource</title>
	
	<script charset="utf-8" src="/resources/script/jquery-1.8.3.js"></script>
	
	<script type="text/javascript">
	$(function(){
		$('#authorities').change(function(v){
			window.location=$(this).val()[0];
		});
		$('form input[type=submit]').attr("disabled","disabled"); 
		$('form input').change(function(){
			console.log($(this).parents('form'));
			$(this).parents('form').find('input[type=submit]').removeAttr("disabled"); 
		});
	});
</script>
</head>
<body>

	<h1>Resource</h1>
	
		<form action="add" method="post">
			<table border="1">
				<thead><tr><th>资源名</th><th>描述</th><th>类型</th><th>URL</th><th>状态(启用/关闭)</th><th></th></tr></thead>
				<tbody>
					<tr>
						<td><input type="text" name="name" value=""></td>
						<td><input type="text" name="description"></td>
						<td><input type="text" name="type"></td>
						<td><input type="text" name="url"></td>
						<td><input type="checkbox" name="enables"></td>
						<td><input type="submit" value="新增"></td>
					</tr>
				</tbody>
			</table>
		</form>
	
	
	<form method="post" action="${selectResource.id}">
		<table style="width: 100%;" border="1">
			<thead>
				<tr><th style="width: 10%">权限</th><th style="width: 20%">详细信息</th></tr>
			</thead>
			<tbody>
			<tr>
				<td>
					<select multiple="multiple" style="width: 100%;height: 100%" id="authorities">
						<c:forEach var="resource" items="${resources}">
							<option value="${resource.id}" <c:if test="${resource.id == selectResource.id}">selected="selected"</c:if>>${resource.name}-${resource.description}-${resource.url}</option>
						</c:forEach>
					</select>
				</td>
				<td>
					<table border="1">
						<tbody>
							<tr>
								<th>名字</th><td><input type="text" name="name" value="${selectResource.name}"></td>
							</tr>
							<tr>
								<th>描述</th><td><input type="text" name="description" value="${selectResource.description}"></td>
							</tr>
							<tr>
								<th>类型</th><td><input type="text" name="type" value="${selectResource.type}"></td>
							</tr>
							<tr>
								<th>URL</th><td><input type="text" name="url" value="${selectResource.url}"></td>
							</tr>
							<tr>
								<th>状态</th><td><input type="checkbox" name="enables" <c:if test="${selectResource.enables}">checked="checked"</c:if>></td>
							</tr>
							<tr>
								<th></th><td><input type="submit" value="修改"></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			</tbody>
		</table>

	</form>
</body>


</html>
