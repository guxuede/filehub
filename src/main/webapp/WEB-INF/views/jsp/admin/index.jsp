<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
	<title>Admin</title>
	<link rel="stylesheet" href="../resources/kindeditor-4.1.7/themes/default/default.css" />
	<link rel="stylesheet" href="../resources/kindeditor-4.1.7/plugins/code/prettify.css" />
	<script charset="utf-8" src="../resources/kindeditor-4.1.7/kindeditor.js"></script>
	<script charset="utf-8" src="../resources/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../resources/kindeditor-4.1.7/plugins/code/prettify.js"></script>
	<script charset="utf-8" src="../resources/script/jquery-1.8.3.js"></script>
	
</head>
<body>
	<h1>Admin | <sec:authentication property="name"/> | <sec:authentication property="authorities"/></h1>
	
	<sec:authorize url="/security/" method="post"><a href="security/">Security Managerment</a></sec:authorize>
	<br>
	<sec:authorize url="dataDictionary/"><a href="dataDictionary/">Database Managerment</a></sec:authorize>
	<br>
	<sec:authorize access="hasRole('ROLE')" ><a href="security/resource/">security/resource/	</a></sec:authorize>
	<br>
	<sec:authorize url="/admin/security/resource/"><li><a href="/admin/security/resource/">Resource</a></li></sec:authorize>
	
</body>

<script type="text/javascript">

</script>
</html>
