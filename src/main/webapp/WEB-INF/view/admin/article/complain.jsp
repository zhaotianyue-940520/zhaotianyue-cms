<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<table class="table">
		  <thead class="thead-dark">
		    <tr style="font-size: 15px;">
		      
		      <th scope="col">文章标题</th>
		      <th scope="col">投诉内容</th>
		      <th scope="col">投诉人的名字</th>
		      <th scope="col">投诉人的邮箱</th>
		      <th scope="col">投诉人的电话</th>
		      <th scope="col">投诉类型</th>
		      <th scope="col">投诉时间</th>
		      <th scope="col">投诉图片</th>
		     
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${pg.list}" var="link">
        		<tr style="font-size: 12px;">
        			
        			<td >${link.title}</td>
        			<td>${link.content}</td>
        			<td>${link.username}</td>
        			<td>${link.email}</td>
        			<td>${link.mobile}</td>
        			<td>
        				<c:if test="${link.compainOption.indexOf('1')!=-1}">标题夸张</c:if>
        				<c:if test="${link.compainOption.indexOf('2')!=-1}">与事实不符</c:if>
        				<c:if test="${link.compainOption.indexOf('3')!=-1}">疑似抄袭</c:if>
        			
        			</td>
        			<td><fmt:formatDate value="${link.created}" pattern="yyyy年MM月dd日"/></td>
        			<td><img alt="" src="/pic/${link.picture}"  height="75px;" width="100px;"></td>
        			
        		</tr>
        	</c:forEach>
		  </tbody>
		</table>
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true" onclick="gopage(${pg.prePage==0?1:pg.prePage})"  >Previous</a>
		    </li>
		   	<c:forEach begin="1" end="${pg.pages}" varStatus="i">
		   		<li class="page-item"><a class="page-link" href="#" onclick="gopage(${i.index})">${i.index}</a></li>
		   	</c:forEach>
		    <li class="page-item">
		      <a class="page-link" href="#" onclick="gopage(${pg.nextPage==0?pg.pages:pg.nextPage})">Next</a>
		    </li>
		  </ul>
		</nav>
		
		  
		  
		  
		 <script type="text/javascript">
		 function gopage(page){
				$("#workcontent").load("/admin/complain?page="+page);
			}
		 </script>
</body>
</html>