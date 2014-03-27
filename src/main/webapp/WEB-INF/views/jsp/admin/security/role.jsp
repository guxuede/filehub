<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
	<title>Role</title>
	
	<script charset="utf-8" src="/resources/script/jquery-1.8.3.js"></script>
	
	<script type="text/javascript">
	$(function(){
		$('#roles').change(function(v){
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

	<h1>Role</h1>
	
		<form action="add" method="post">
			<table border="1">
				<thead><tr><th>角色名</th><th>描述</th><th>状态(启用/关闭)</th><th>所拥有权限</th><th></th></tr></thead>
				<tbody>
					<tr>
						<td><input type="text" name="name" value="ROLE_"></td>
						<td><input type="text" name="description"></td>
						<td><input type="checkbox" name="enables"></td>
						<td>
								<ul>
									<c:forEach var="authoritie" items="${authorities}">
										<li><label class="checkbox"><input type="checkbox" value="${authoritie.id}" name="authorities">${authoritie.name}-${authoritie.description}</label></li>
									</c:forEach>
								</ul>
						</td>
						<td><input type="submit" value="新增"></td>
					</tr>
				</tbody>
			</table>
		</form>
	
	
	<form method="post" action="${selectRole.id}">
		<table style="width: 100%;" border="1">
			<thead>
				<tr><th style="width: 30%">Role</th><th style="width: 10%">详细信息 </th><th style="width: 30%">所拥有的权限</th><th style="width: 30%">所可以访问的资源</th></tr>
			</thead>
			<tbody>
			<tr>
				<td>
					<select multiple="multiple" style="width: 100%;height: 100%" id="roles">
						<c:forEach var="role" items="${roles}">
							<option value="${role.id}" <c:if test="${role.id == selectRole.id}">selected="selected"</c:if>>${role.name}-${role.description}</option>
						</c:forEach>
					</select>
				</td>
				<td>
					<table border="1">
						<tbody>
							<tr>
								<th>角色名</th><td><input type="text" name="name" value="${selectRole.name}"></td>
							</tr>
							<tr>
								<th>描述</th><td><input type="text" name="description" value="${selectRole.description}"></td>
							</tr>
							<tr>
								<th>状态</th><td><input type="checkbox" name="enables" value="${selectRole.enables}"></td>
							</tr>
							<tr>
								<th></th><td><input type="submit" value="修改"></td>
							</tr>
						</tbody>
					</table>
				</td>
				<td>
						<ul>
							<c:forEach var="authoritie" items="${authorities}">
								<li><label class="checkbox"><input type="checkbox" value="${authoritie.id}" name="authorities" <c:forEach var="a" items="${selectRole.authorities}"><c:if test="${a.id == authoritie.id}">checked="checked"</c:if></c:forEach>>${authoritie.name}-${authoritie.description}</label></li>
							</c:forEach>
						</ul>
				</td>

				<td>
					<ul style="width: 100%">
						<c:forEach var="resource" items="${resources}">
							<li><label class="checkbox"><input type="checkbox" disabled="disabled" value="${resource.id}">${resource.name}-${resource.description}-${resource.url}</label></li>
						</c:forEach>
					</ul>
				</td>
			</tr>
			</tbody>
		</table>

	</form>
</body>

</html>
