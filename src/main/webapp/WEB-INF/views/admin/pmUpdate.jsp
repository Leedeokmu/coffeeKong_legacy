<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<c:set var="vo" value="${aProduct}" />
<body>
	<form method="POST" action="pmuSaveCtrl" name="eForm" enctype="multipart/form-data">
	<input type="hidden" name="pId" value="${vo.p_id}"/>
	<div class="container">
	<div style="text-align:center;">
		<hr>
			<h3>Edit A Product</h3>
		<hr>
	</div>
	<div style="margin-left:300px;">
		<table>
			<tr>
				<td>Category</td>
				<td>
					<select name="iCate">
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
				</td>
			</tr>
			<tr>
				<td>name</td>
				<td><input type="text" name="iName" maxlength="10" size="10"
					value="${vo.p_name }" /></td>
			</tr>
			<tr>
				<td>Content</td>
				<td><textarea name="iContent" cols="50" rows="25">${vo.p_content }</textarea></td>
			</tr>
			<tr>
				<td>price</td>
				<td><input type="number" name="iPrice" /></td>
			</tr>
			<tr>
				<td>mdate</td>
				<td><input type="date" name="iMdate" value="${vo.p_mdate}"></td>
			</tr>
			<tr>
				<td>rdate</td>
				<td><input type="date" name="iMdate" value="${vo.p_rdate}"></td>
			</tr>
			<tr>
				<td>img</td>
				<td><input type="file" name="iFile" id="iFile" /></td>
			</tr>
<!-- 			<tr>
				<td>
					<input type="submit" value="Submit">&nbsp;&nbsp; 
					<input type="reset" value="Reset">&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[back]</a>
				</td>
			</tr> -->
		</table>
		<br>
			<div style="margin-left:250px;">
				<input type="submit" value="Submit">&nbsp;&nbsp; 
				<input type="reset" value="Reset">&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">[back]</a>
			</div>
		<br>
		</div>
		</div>
	</form>
</body>
</html>