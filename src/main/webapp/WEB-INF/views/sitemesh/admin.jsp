<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<title>Home</title>
<!--  
<link rel="stylesheet" type="text/css" media="screen" href="/resources/jquery-ui-1.9.1.custom/css/ui-lightness/jquery-ui-1.9.1.custom.css" />
-->
<link rel="stylesheet" type="text/css" media="screen" href="/resources/jquery-ui-themes-1.9.2/themes/excite-bike/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/resources/jquery-ui-themes-1.9.2/themes/excite-bike/jquery.ui.theme.css" />

<script charset="utf-8" src="/resources/script/jquery-1.8.3.js"></script>
<script charset="utf-8" src="/resources/jquery-ui-1.9.1.custom/js/jquery-ui-1.9.1.custom.js"></script>

<link rel="stylesheet" href="/resources/jquery.minicolors/jquery.minicolors.css" />
<script charset="utf-8" src="/resources/jquery.minicolors/jquery.minicolors.min.js"></script>

<link rel="stylesheet" href="/resources/jquery.jwysiwyg/jquery.wysiwyg.css">
<script charset="utf-8" src="/resources/jquery.jwysiwyg/jquery.wysiwyg.js"></script>

<link rel="stylesheet" href="/resources/jquery.date_input/jquery.date_input.css">
<script charset="utf-8" src="/resources/jquery.date_input/jquery.date_input.min.js"></script>

<link rel="stylesheet" href="/resources/css/style.css">


<sitemesh:write property='head'/>

</head>
<body>

	<header>
	
		<h1><a href="javascript:;">ADMINIUM</a></h1>
		
		<form action="" method="post" class="searchform">
			<input type="text" class="text" value="Search..." />
			<input type="submit" class="submit" value="" />
		</form>
		
		
		<section class="userprofile">
			<ul>
				<li><a href="javascript:;"><img src="/resources/images/avatar.gif" alt="" /><sec:authentication property="name"/></a>
					<ul>
						<li><a href="javascript:;"><sec:authentication property="authorities"/></a></li>
						<li><a href="javascript:;">Messages</a></li>
						<li><a href="javascript:;">Logout</a></li>
					</ul>
				</li>
			</ul>
		</section>		<!-- .userprofile ends -->
			
	</header>		<!-- #header ends -->




	
	<aside>
		
		<ul id="nav">
			<li><a href="/admin/"><strong><img src="/resources/images/dashboard.png" alt="" /> Dashboard</strong></a></li>
			<li><a href="admin/security/" class="collapse open"><img src="/resources/images/pages.png" alt="" /> Security</a>
				<ul>
					<li><a href="/admin/security/role/">Role</a></li>
					<li><a href="/admin/security/authority/">Authority</a></li>
					<sec:authorize url="/admin/security/resource/"><li><a href="/admin/security/resource/">Resource</a></li></sec:authorize>
				</ul>
			</li>
			<li><a href="javascript:;" class="collapse"><img src="/resources/images/media.png" alt="" /> Database</a>
				<ul>
					<li><a href="/admin/security/role/">Data Drit</a></li>
				</ul>
			</li>
			<li><a href="javascript:;"><img src="/resources/images/calendar.png" alt="" /> Calendar</a></li>
			<li><a href="javascript:;" class="collapse"><img src="/resources/images/users.png" alt="" /> Users</a>
				<ul>
					<li><a href="/admin/user/">List</a></li>
					<li><a href="javascript:;">Add new user</a></li>
					<li><a href="javascript:;">User groups</a></li>
				</ul>
			</li>
			<li><a href="javascript:;"><img src="/resources/images/settings.png" alt="" /> Settings</a></li>
			<li><a href="javascript:;"><span>12</span> <img src="/resources/images/support.png" alt="" /> Support</a></li>
		</ul>
		
		
		<section class="status_box">
			<ul>
				<li><a href="javascript:;" class="online" title="Online">Web server 1</a></li>
				<li><a href="javascript:;" class="online" title="Online">Web server 2</a></li>
				<li><a href="javascript:;" class="warning" title="Warning">DB server</a></li>
				<li><a href="javascript:;" class="offline" title="Offline">Mail server</a></li>
			</ul>
		</section>
		
	</aside>		<!-- aside ends -->
	

	<section id="content">
		 <sitemesh:write property='body'/>
	</section>		<!-- #content ends -->

</body>
<script type="text/javascript">
	$(function(){
		// Collapsable navigation	
		$('#nav .collapse:not(.open)').parents('li').find('ul').hide();
		
		$('#nav .collapse').on('click', function() {
			$(this).toggleClass('open');
			$(this).siblings('ul').slideToggle('fast');
			return false;
		});
	});
</script>
</html>
