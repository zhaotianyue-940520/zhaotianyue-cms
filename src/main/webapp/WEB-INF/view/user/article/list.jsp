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
		      <th scope="col">id</th>
		      <th scope="col">标题</th>
		      <th scope="col">栏目</th>
		      <th scope="col">分类</th>
		      <th scope="col">发布时间</th>
		      <th scope="col">状态</th>
		      <th scope="col">操作</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${pg.list}" var="article">
        		<tr>
        			<td>${article.id}</td>
        			<td>${article.title}</td>
        			<td>${article.channel.name}</td>
        			<td>${article.category.name}</td>
        			<td><fmt:formatDate value="${article.created}" pattern="yyyy年MM月dd日"/></td>
        			<td>
        				<c:choose>
        					<c:when test="${article.status==0}"> 待审核</c:when>
        					<c:when test="${article.status==1}"> 审核通过</c:when>
        					<c:when test="${article.status==2}"> 审核被拒</c:when>
        					<c:otherwise>
        						未知
        					</c:otherwise>
        				</c:choose>
        			</td>
        			<td width="200px">
        				<input type="button" value="删除"  class="btn btn-dark" onclick="del(${article.id})">
        				<input type="button" value="修改"  class="btn btn-dark" onclick="upd(${article.id})" >
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
			$("#workcontent").load("/user/articles?pageNum="+page);
		}
		function del(id){
			if(confirm("你确定删除ID为"+id+"吗?")){
				$.post('/user/deletearticle',{id:id},
						function(data){
							if(data==true){
								alert("刪除成功!")
								$("#workcontent").load("/user/articles");
							}else{
								alert("刪除失败!")
							}
							
				},"json")
			}
		}
		function upd(id){
			$("#workcontent").load("/user/updArticle?id="+id);
		}
		</script>
</body>
</html>