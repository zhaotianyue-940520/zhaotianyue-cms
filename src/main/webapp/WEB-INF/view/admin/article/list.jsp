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
		审核状态:
		<select id="state">
			<option value="-1" ${status==-1?"selected":""} >全部</option>
			<option value="0" ${status==0?"selected":""} >待审核</option>
			<option value="1" ${status==1?"selected":""}>审核通过</option>
			<option value="2" ${status==2?"selected":""}>审核被拒</option>
		</select>
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
        				<input type="button" value="审核"  class="btn btn-dark" onclick="check(${article.id})" >
        				<input type="button" value="管理投诉"  class="btn btn-warning" onclick="complainList(${article.id})" >
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
		
		<div class="modal fade"   id="complainModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		  <div class="modal-dialog" role="document" style="margin-left:100px;">
		    <div class="modal-content" style="width:1200px;" >
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">文章审核</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" id="complainListDiv">
		         
		         		
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" onclick="setStatus(1)">审核通过</button>
		        <button type="button" class="btn btn-primary" onclick="setStatus(2)">审核拒绝</button>
		       
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="modal fade"   id="articleContent" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		  <div class="modal-dialog" role="document" style="margin-left:100px;">
		    <div class="modal-content" style="width:1200px;" >
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">文章审核</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body ">
		         	<div class="row" id="divTitle"></div>
		         	<div class="row" id="divOptions" ></div>
		         	<div class="row" id="divContent"></div>		
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" onclick="setStatus(1)">审核通过</button>
		        <button type="button" class="btn btn-primary" onclick="setStatus(2)">审核拒绝</button>
		        <button type="button" class="btn btn-primary" onclick="setHot(1)">设置热门</button>
		        <button type="button" class="btn btn-primary" onclick="setHot(0)">取消热门</button>
		      </div>
		    </div>
		  </div>
	</div>
	
	
		<script type="text/javascript">
		
		$('#articleContent').on('hidden.bs.modal', function (e) {
			refreshPage();
			})
		$('#complainModal').on('hidden.bs.modal', function (e) {
			refreshPage();
			})
		
		
		
		$(function(){
				
			$("#state").change(function(){
				alert($('#state').val())
				$("#workcontent").load("/admin/article?page=" + '${pg.pageNum}' + "&status="+$('#state').val());
			})
		})
		/* function gopage(page){
			$("#workcontent").load("/user/articles?pageNum="+page);
		} */
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
		function check(id){
			
			$.post("/article/getDetail",{id:id},function(msg){
	     		if(msg.code==1){
	     			//
	     			$("#divTitle").html(msg.data.title);
	     			//
	     			$("#divOptions").html("栏目：" +msg.data.channel.name + 
	     					" 分类："+msg.data.category.name + " 作者：" + msg.data.user.username );
	     			//
	     			$("#divContent").html(msg.data.content);
	     			$('#articleContent').modal('show');
	     			//文章id保存到全局变量当中
	     			global_article_id=msg.data.id;
	     			return;
	     		}
	     		alert(msg.error)
	     		
	     		
	     	},"json");
		}
		/**
		*  status 0  待审核  1 通过    2 拒绝 
		*/
		function setStatus(status){
			
			var id = global_article_id;
			alert(id)
			$.post("/admin/setArticeStatus",{id:id,status:status},function(msg){
				if(msg.code==1){
					alert('操作成功')
					//隐藏当前的模态框
					$('#articleContent').modal('hide')
					$('#complainModal').modal('hide')
					//刷新当前的页面
					return;	
				}
				alert(msg.error);
			},
			"json")
		}
		
		/**
		 0 非热门
		 1 热门
		*/
		function setHot(status){
			
			var id = global_article_id;// 文章id
			$.post("/admin/setArticeHot",{id:id,status:status},function(msg){
				if(msg.code==1){
					alert('操作成功')
					//隐藏当前的模态框
					$('#articleContent').modal('hide')
					//刷新当前的页面
					return;
				}
				alert(msg.error);
			},
			"json")
		}
		
		/**
		* 查看文章的投诉
		*/
		function complainList(id){
			$("#complainModal").modal('show')
			$("#complainListDiv").load("/article/complains?articleId="+id);
			global_article_id=id;
		}
		
		
		/**
		* 翻页
		*/
		function gopage(page){
			$("#workcontent").load("/admin/article?page="+page + "&status="+'${status}');
		}
		
		function refreshPage(){
			$("#workcontent").load("/admin/article?page=" + '${pg.pageNum}' + "&status="+'${status}');
		}
		
		</script>
</body>
</html>