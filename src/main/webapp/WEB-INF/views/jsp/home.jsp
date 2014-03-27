<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="../resources/kindeditor-4.1.7/themes/default/default.css" />
	<link rel="stylesheet" href="../resources/kindeditor-4.1.7/plugins/code/prettify.css" />
	<script charset="utf-8" src="../resources/kindeditor-4.1.7/kindeditor.js"></script>
	<script charset="utf-8" src="../resources/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../resources/kindeditor-4.1.7/plugins/code/prettify.js"></script>
	<script charset="utf-8" src="../resources/script/system.js"></script>
	
</head>
<body>
<h1>
	Hello world! - 
</h1>
${controllerMessage}<br/>
<br/>
<br/>
<a href="person/list">Go to the person list</a>
<br/>
<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
</body>

<!-- Duoshuo Comment BEGIN -->
	<div class="ds-thread"></div>
	<div style="height: 2000px">1</div>
<script type="text/javascript">
var duoshuoQuery = {short_name:"guxuede"};
	(function() {
		var ds = document.createElement('script');
		ds.type = 'text/javascript';ds.async = true;
		ds.src = 'http://static.duoshuo.com/embed.js';
		ds.charset = 'UTF-8';
		(document.getElementsByTagName('head')[0] 
		|| document.getElementsByTagName('body')[0]).appendChild(ds);
	})();
	</script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '../resources/kindeditor-4.1.7/plugins/code/prettify.css',
				uploadJson : '../jsp/upload_json.jsp',
				fileManagerJson : '../jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
<!-- Duoshuo Comment END -->
</html>
