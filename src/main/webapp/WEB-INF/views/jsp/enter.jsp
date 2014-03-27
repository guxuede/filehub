<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Enter</title>
	<script src="../resources/script/jquery-1.8.3.js"></script>
	
	<link rel="stylesheet" href="../resources/bootstrap/3.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/bootstrap/3.0.0/css/bootstrap-theme.min.css">
	<script src="../resources/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="../resources/validator-0.4.0/jquery.validator.css">
	<script src="../resources/validator-0.4.0/jquery.validator.js"></script>
	<script src="../resources/validator-0.4.0/local/zh_CN.js"></script>
	
	<script src="../resources/script/StackBlur.js"></script>
	<script src="../resources/script/system.js"></script>
	
	<style type="text/css">
		body {
		  padding-top: 40px;
		  padding-bottom: 40px;
		  background-color: #eee;
		}
		
		.form-signin {
		  max-width: 330px;
		  padding: 15px;
		  margin: 0 auto;
		}
		.form-signin .form-signin-heading,
		.form-signin .checkbox {
		  margin-bottom: 10px;
		}
		.form-signin .checkbox {
		  font-weight: normal;
		}
		.form-signin .form-control {
		  position: relative;
		  font-size: 16px;
		  height: auto;
		  padding: 10px;
		  -webkit-box-sizing: border-box;
		     -moz-box-sizing: border-box;
		          box-sizing: border-box;
		}
		.form-signin .form-control:focus {
		  z-index: 2;
		}
		.form-signin input[type="text"] {
		  margin-bottom: -1px;
		  border-bottom-left-radius: 0;
		  border-bottom-right-radius: 0;
		}
		.form-signin input[type="password"] {
		  margin-bottom: 10px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
	</style>
</head>
<body>
	<img id="bgimg" src="../resources/img/shanshuifengshu.jpg" style="width: 100%; height: 100%;display: none;" onLoad="stackBlurImage('bgimg', 'bgcanvas', 20, 0.1);"></img>
	<canvas id="bgcanvas" style="position: absolute;z-index: -1;top: 0px;width: 800px;height: 400px;"></canvas>
	<div class="container">
	   <form class="form-signin">
		<div style="position: relative;top: 130px;left: -100px;">
			<img id="avaterimg" alt="" src="../resources/img/avatar.jpg" style="width: 40px; height: 40px;width: 50px;height: 50px;border: 2px dashed beige;">
		</div>
	     <h2 class="form-signin-heading">你的个人信息</h2>
	     <input name="name" type="text" class="form-control" placeholder="名字" autofocus data-rule="required;" data-msg-required="请填上你霸气的名字" data-tip="最好填写真实姓名" data-ok="先深,名字不错">
	     <input name="avater" type="text" class="form-control" placeholder="头像地址:http://....jpg" data-rule="img;" data-rule-img="[/\.(jpe?g|gif|bmp|png)$/i, '请检查头像地址的链接格式']">
	     <label class="checkbox">
	       <input type="checkbox" value="remember-me"> Remember me
	     </label>
	     <button class="btn btn-lg btn-primary btn-block" type="submit">加入</button>
	   </form>
	 </div>
</body>
<script type="text/javascript">
	$(function(){
		$('input[name="avater"]').on('valid.field', function(e, field, msgOpt){
		    $('#avaterimg').attr('src',$(this).val());
		}).on('invalid.field', function(e, field, msgOpt){
			 $('#avaterimg').attr('src','../resources/img/avatar.jpg');
		});
		
		$('button[type="submit"]').click(function(){
			if($('.form-signin').isValid()){
				setCoolie("name",$('input[name="name"]').val());
				setCoolie("avatar",$('input[name="avater"]').val());
				window.location.href=window.location.href;
			}
		});
	});
</script>
</html>
