<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>COFFEE KONG</title>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="container">
		<div class="row text-center">
			<hr>
				<h3>Add New Product</h3>
			<hr>
		</div>
		<form method="post" name="pminsert" action="/manage/product/insert" enctype="multipart/form-data">
		<input type='hidden' name='page' value="${cri.page}"> 
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">
		<div class="row">
			<div class="col-md-6 all_center" id="imageDiv">
				<img src="/resources/dist/product/sample.jpg" style="width:20em"/>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label for="pmiCategory">Category</label> 
					<select name="p_category" class="form-control" id="pmiCategory">
						<optgroup label="COFFEE">
					    	<option value="SingleOrigins">Single Origins</option>
					    	<option value="Blends">Blends</option>
					    	<option value="Decafs">Decafs</option>
						    <option value="Light">Light</option>
						    <option value="Medium">Medium</option>
						    <option value="Dark">Dark</option>
						    <option value="ColdBrew">Cold Brew</option>
					  	</optgroup>
					  	<optgroup label="TOOLS">
						    <option value="Grinder">Grinder</option>
						    <option value="HomeBrewing">Home brewing</option>
						    <option value="Cups">Cups</option>
						</optgroup>
					</select>
				</div>
				<div class="form-group">
					<label for="pmiName">Name</label>
					<input type="text" name="p_name" id="pmiName" class="form-control" 
					placeholder="Enter Product Name" /> 
				</div>
				
				<div class="form-group">
					<label for="pmiPrice">Price</label>
					<input type="text" name="p_price" id="pmiPrice" class="form-control" 
					placeholder="Enter Price" /> 
				</div>
				<div class="form-group">
					<label for="pmiMdate">Manufactured</label>
					<input type="date" name="p_mdate" id="pmiMdate" class="form-control"/> 
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="pmiContent">Content</label>
			<textarea name="p_content" id="pmiContent" class="form-control"  
			cols="30" rows="3"></textarea> 
		</div>
		<hr />
		<div class="row">
			<input type="submit" class="btn btn-success" value="ACCEPT">
			<input type="reset" class="btn btn-default" value="RESET">
			<a href="javascript:history.go(-1);">BACK</a>
		</div>
		</form>
	</div>
	<script>
	
	</script>
</body>
</html>