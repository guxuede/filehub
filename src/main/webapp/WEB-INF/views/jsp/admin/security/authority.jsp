<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
	<title>Authority</title>
	
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

	<h1>Authority</h1>
	
		<form action="add" method="post">
			<table border="1">
				<thead><tr><th>权限名</th><th>描述</th><th>状态(启用/关闭)</th><th>可访问资源</th><th></th></tr></thead>
				<tbody>
					<tr>
						<td><input type="text" name="name" value=""></td>
						<td><input type="text" name="description"></td>
						<td><input type="checkbox" name="enables"></td>
						<td>
							<ul>
								<c:forEach var="resource" items="${resources}">
									<li><label class="checkbox"><input type="checkbox" name="resources" value="${resource.id}">${resource.name}-${resource.description}-${resource.url}</label></li>
								</c:forEach>
							</ul>
						</td>
						<td><input type="submit" value="新增"></td>
					</tr>
				</tbody>
			</table>
		</form>
	
	
	<form:form method="post" action="${selectRole.id}" commandName="selectAuthority" >
		<table style="width: 100%;" border="1">
			<thead>
				<tr><th style="width: 30%">权限</th><th style="width: 10%">详细信息</th><th style="width: 30%">所可以访问的资源</th></tr>
			</thead>
			<tbody>
			<tr>
				<td>
					<form:select path="id" items="${authorities}" itemLabel="name" itemValue="id" multiple="multiple" id="authorities" cssStyle="idth: 100%;height: 100%"></form:select>
				</td>
				<td>
					<table border="1">
						<tbody>
							<tr>
								<th>名字</th><td><form:input path="name"/></td>
							</tr>
							<tr>
								<th>描述</th><td><form:input path="description"/></td>
							</tr>
							<tr>
								<th>状态</th><td><form:checkbox path="enables"/></td>
							</tr>
							<tr>
								<th></th><td><input type="submit" value="修改"></td>
							</tr>
						</tbody>
					</table>
				</td>

				<td>
					<ul style="width: 100%">
						<form:checkboxes items="${resources}" path="resources" itemValue="id" itemLabel="name" element="li"/>
					</ul>
				</td>
			</tr>
			</tbody>
		</table>

	</form:form>
</body>

</html>
