<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resource/bootstrap-4.3.1/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="/resource/login/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript" src="/resource/login/js/jquery.validate.js" ></script>
<script type="text/javascript" src="/resource/bootstrap-4.3.1/js/bootstrap.js"></script>

 <link rel="stylesheet" href="/resource/kindeditor/themes/default/default.css" />
 <link rel="stylesheet" href="/resource/kindeditor/plugins/code/prettify.css" />
 <script charset="utf-8" src="/resource/kindeditor/plugins/code/prettify.js"></script>
 <script charset="utf-8" src="/resource/kindeditor/kindeditor-all.js"></script>
 <script charset="utf-8" src="/resource/kindeditor/lang/zh-CN.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.menuselected {
		background:grey;
	}
	.mymenuselected li:hover {
		background:grey;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
	
	  <a class="navbar-brand" href="#">Top navbar</a>
	  
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  
	  <div class="collapse navbar-collapse" id="navbarCollapse">
		  <ul class="navbar-nav mr-auto">
			  <li class="nav-item">
			    <a class="nav-link active" href="#">Active</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">Link</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">Link</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
			  </li>
		  </ul>
		  
		  <form class="form-inline mt-2 mt-md-0">
		      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		  </form>
	  </div>
	</nav>
	
	<div class="row">
	  
	    <div class="col-md-1" style="margin-top:20px ; border-right:solid 2px" > 
			<!-- 左侧的菜单 -->
			<ul class="nav flex-column mymenuselected" style="background:#343a40" >
				  <li class="nav-item ">
				    <a class="nav-link active" href="#" onclick="showWork($(this),'/user/articles')" id="postLink" style="color:white;" >我的文章</a>
				  </li>
				  <li class="nav-item">
				    <a  class="nav-link" href="#" onclick="showWork($(this),'/user/postArticle')"  style="color:white;" >发表文章</a>
				  </li>
				  <li class="nav-item">
				    <a  class="nav-link" href="#" onclick="showWork($(this),'/user/collect')"  style="color:white;" >我的收藏</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#" onclick="showWork($(this),'/user/comments')" style="color:white;" >我的评论</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true" style="color:white;" >个人设置</a>
				  </li>
				</ul>	
		</div>
	  
	  <div class="col-11" id="workcontent" >
	  </div>
	</div>
	<nav class="nav fixed-bottom justify-content-center "  style="background:#343a40;height: 40px; color: white;" > 
	      <span style="margin-top: 8px;"> 一片小暖阳 </span>
	</nav>
	<script type="text/javascript">
	KindEditor.ready(function(K) {
			window.editor1 = K.create();
			prettyPrint();
	});
	function showWork(obj,url){
		$(".mymenuselected li").removeClass("menuselected");
		obj.parent().addClass("menuselected")
		$("#workcontent").load(url);
	}
	</script>
</body>
</html>