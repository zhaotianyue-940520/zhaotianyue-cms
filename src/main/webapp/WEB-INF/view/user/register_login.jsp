<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width-device-width,initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="sie-edge" />
<link rel="stylesheet" type="text/css" href="/resource/login/css/style.css">
<title>登录注册页面</title>

<!--图标库-->
<script src="https://unpkg.com/ionicons@4.2.2/dist/ionicons.js"></script>

</head>

<body>

<div class="container ${cls}" id="container">
  <div class="form-container sign-up-container">
  	
    <form:form action="register" id="reg" method="post" modelAttribute="u">
    	<menu style="color:red">${error}</menu>
	    <h1>注册</h1>
	      <div class="social-container"> <a href="#" class="social">
	        <ion-icon name="logo-facebook"></ion-icon>
	        </a> <a href="#" class="social"> 
	        <ion-icon name="logo-googleplus"></ion-icon>
	        </a> <a href="#" class="social">
	        <ion-icon name="logo-linkedin"></ion-icon>
	        </a> </div>
			<form:input path="username" placeholder="账号" remote="/user/checkname" /><form:errors path="username" cssStyle="color:red"></form:errors>
      		<form:input type="password" path="password" placeholder="密码"/><form:errors path="password" cssStyle="color:red"></form:errors>
	      <form:button>注册</form:button>
    </form:form>
  </div>
  <div class="form-container sign-in-container">
    <form action="login" method="post">
   	  <menu style="color:red">${error}</menu>
      <h1>登录</h1>
      <div class="social-container"> 
		<a href="#" class="social">
			<ion-icon name="logo-facebook"></ion-icon>
        </a> 
        <a href="#" class="social">
        	<ion-icon name="logo-googleplus"></ion-icon>
        </a> 
        <a href="#" class="social">
        	<ion-icon name="logo-linkedin"></ion-icon>
        </a> 
      </div>
      <input type="text" name="username" placeholder="账号"/><form:errors path="username" cssStyle="color:red"></form:errors>
      <input type="password" name="password" placeholder="密码"/><form:errors path="password" cssStyle="color:red"></form:errors>
      <button>登录</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>欢迎回来</h1>
        <p>与我们保持联系请登录您的个人信息</p>
        <button class="ghost" id="signIn">登录</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>欢迎光临</h1>
        <p>输入您的个人资料，并与我们一起开始旅程</p>
        <button class="ghost" id="signUp">注册</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="/resource/login/js/jquery-3.4.1.min.js"></script>
<script  src="/resource/login/js/script.js"></script>
<script type="text/javascript" src="/resource/login/js/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/login/js/messages_zh.js"></script>
<script type="text/javascript">
	$("#reg").validate();
</script>
</body>
</html>
