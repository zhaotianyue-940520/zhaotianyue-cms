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
		    <tr>
		      <th scope="col">标题</th>
		      <th scope="col">发布时间</th>
		      <th scope="col">操作
		      <a href="/user/addcollect">添加</a>
		      </th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${pg.list}" var="article">
        		<tr>
        			<td>${article.name}</td>
        			<td><fmt:formatDate value="${article.created}" pattern="yyyy年MM月dd日"/></td>
        			<td width="200px">
        				<input type="button" value="删除"  class="btn btn-dark" onclick="del(${article.id})">
        			</td>
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
			$("#workcontent").load("/user/collect?pageNum="+page);
		}
		function del(id){
			if(confirm("你确定删除ID为"+id+"吗?")){
				$.post('/user/deletecollect',{id:id},
						function(data){
							if(data==true){
								alert("刪除成功!")
								$("#workcontent").load("/user/collect");
							}else{
								alert("刪除失败!")
							}
							
				},"json")
			}
		}
		</script>
</body>
</html>