<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-center fixed-bottom" style="height: 50px;" >
	<div>
	
			<div>
			<c:forEach items="${link}" var="l">
				<a href="${l.url}">${l.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
			</div>
				
			<div style="color: white; text-align: center;">版权所有  违者必究</div>
	</div>
			
		
</nav>