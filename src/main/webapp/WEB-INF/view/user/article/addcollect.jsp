<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<from:form action="addcoll" method="post" modelAttribute="collect">
		收藏夹文本<from:input path="name"/>
		收藏夹地址<from:input path="url"/>${msg}
		<from:button>添加</from:button>
		</from:form>
</body>
</html>