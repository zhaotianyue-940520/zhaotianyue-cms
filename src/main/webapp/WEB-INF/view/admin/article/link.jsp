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
		      <th scope="col">路径</th>
		      <th scope="col">网站名</th>
		      <th scope="col">发布时间</th>
		      <th scope="col">操作
		      	<input type="button" value="添加"  class="btn btn-light" onclick="toAdd()" >
		      </th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${pg.list}" var="link">
        		<tr>
        			<td>${link.id}</td>
        			<td>${link.url}</td>
        			<td>${link.name}</td>
        			<td><fmt:formatDate value="${link.created}" pattern="yyyy年MM月dd日"/></td>
        			
        			<td width="200px">
        				<input type="button" value="删除"  class="btn btn-dark" onclick="del(${link.id})">
        				<input type="button" value="修改"  class="btn btn-dark" onclick="toUpd(${link.id})" >
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
		
		<div class="modal fade"   id="addLink" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		  <div class="modal-dialog" role="document" style="margin-left:100px;">
		    <div class="modal-content" style="width:1200px;" >
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">添加友情链接</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body ">
		         	<form id="allLink" method="post">
		         		<table class="table">
						  <tbody>
				        		<tr>
				        			<th scope="col">路径</th>
						      		<td><input name="url"></td>
				        		</tr>
				        		<tr>
				        			<th scope="col">网站名</th>
						     		<td><input name="name"></td>
				        		</tr>
						  </tbody>
						</table>	
		         	</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="colos" class="btn btn-secondary" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" onclick="add()">添加</button>
		      </div>
		    </div>
		  </div>
		  </div>
		  
		  
		  <div class="modal fade"   id="updLink" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		  <div class="modal-dialog" role="document" style="margin-left:100px;">
		    <div class="modal-content" style="width:1200px;" >
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">添加友情链接</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body ">
         		<form method="post" id="upd">
	         		<table class="table">
					  <tbody>
			        		<tr>
			        			<th scope="col">路径</th>
					      		<td><input id="url" name="url"><input type="hidden" id="id" name="id"></td>
			        		</tr>
			        		<tr>
			        			<th scope="col">网站名</th>
					     		<td><input id="name" name="name"></td>
			        		</tr>
					  </tbody>
					</table>	
         		</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="colos" class="btn btn-secondary" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" onclick="upd()">修改</button>
		      </div>
		    </div>
		  </div>
		  </div>
		  <script type="text/javascript">
		  	function gopage(page){
				$("#workcontent").load("/admin/link?page="+page);
			}
			
		  	function refreshPage(){
				$("#workcontent").load("/admin/link?page=" + '${pg.pageNum}');
			}
		  	$('#addLink').on('hidden.bs.modal', function (e) {
				refreshPage();
			})
		  	$('#updLink').on('hidden.bs.modal', function (e) {
				refreshPage();
			})
		  
		  	function toAdd() {
		  		$('#addLink').modal('show');
			}
		  	function add() {
		  		var param = $('#allLink').serialize();
		  		$.post("addLink",param,function(msg){
		  			if(msg.code==1){
						alert('操作成功')
						//隐藏当前的模态框
						$('#addLink').modal('hide')
						//刷新当前的页面
						return;	
					}
					alert(msg.error);
		  		},"json")
			}
		  	function toUpd(id) {
		  		$.post("toUpd",{id:id},function(msg){
		  			if(msg.code==1){
						
		  				$("#url").val(msg.data.url)
			  			$("#name").val(msg.data.name)
			  			$("#id").val(msg.data.id)
						//刷新当前的页面
		  				$('#updLink').modal('show');
						return;	
					}
					alert(msg.error);
		  		},"json")
			}
		  	function upd() {
		  		var param = $('#upd').serialize();
		  		$.post("updLink",param,function(msg){
		  			if(msg.code==1){
						alert('操作成功')
						//隐藏当前的模态框
						$('#updLink').modal('hide')
						//刷新当前的页面
						return;	
					}
					alert(msg.error);
		  		},"json")
			}
		  	
		  	function del(id) {
		  		$.post("delLink",{id:id},function(msg){
		  			if(msg.code==1){
						alert('操作成功');
						refreshPage();
						//隐藏当前的模态框
						//$('#addLink').modal('hide')
						//刷新当前的页面
						return;	
					}
					alert(msg.error);
		  		},"json")
			}
		  </script>
</body>
</html>