<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WELCOME, COFFEE KONG</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/image.css" />


</head>
<c:set var="email" value="${loginId}" />
<body>
	<div class="container">
		<div class="row ver_center">
			<div class="col-md-7 h_title">
				<span class="h3"><strong><a href="/index">COFFEE KONG</a></strong></span>
			</div>
			<div class="col-md-5 h_nav">
				<ul class="list-inline">
					<li>
						<div class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								ABOUT<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/info/intro">Introduction</a></li>
								<li><a href="/info/location">Location</a></li>
								<li><a href="/info/contact">Contact us</a></li>
							</ul>
						</div>
					</li>
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">SHOP<span
							class="caret"> </span></a>

						<ul class="dropdown-menu" role="menu">
							<li class="dropdown-header"><h4>Coffee</h4></li>
							<li><a href="/product/list/Blends">Blends</a></li>
							<li><a href="/product/list/Decafs">Decafs</a></li>
							<li><a href="/product/list/Light">Light</a></li>
							<li><a href="/product/list/Medium">Medium</a></li>
							<li><a href="/product/list/Dark">Dark</a></li>
							<li class="dropdown-header"><h4>Tools</h4></li>
							<li><a href="/product/list/grinder">Grinder</a></li>
							<li><a href="/product/list/HomeBrewing">Home Brewing</a></li>
							<li><a href="/product/list/Cups">Cups</a></li>
						</ul></li>
					<li><a href="/learn">LEARN</a></li>

					<c:catch>
						<c:choose>
							<c:when test="${login != null}">
								<li>
									<div class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">
											${login.u_email }<span class="caret"></span>
										</a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="/user/update">EDIT MY
													PROFILE</a></li>
											<li><a href="/user/order">MY ORDER</a></li>
											<li><a href="/user/resign">RESIGN FROM
													WEBSITE</a></li>
											<li><a href="/logout">LOGOUT</a></li>
										</ul>
									</div>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="#loginModal" data-toggle="modal">LOGIN</a></li>
								<li><a href="#joinModal" data-toggle="modal">JOIN</a></li>
								<div id="loginModal" class="modal fade" role="dialog">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h3 class="modal-title">LOGIN</h3>
											</div>
											<div class="modal-body">
												<form action="/login" name="login" method="POST" >
													<input type="hidden" name="useCookie" value="false" />
													<div class="form-group">
														<label for="email">EMAIL</label><input type="email"
															class="form-control" name="email" id="email" />
													</div>
													<div class="form-group">
														<label for="pw">PASSWORD</label> <input type="password"
															class="form-control" name="pw"
															id="pw"/>
													</div>
													<div class="form-group">
														<label for="useCookie">Remember</label>
														<input type="checkbox" id="useCookie" name="useCookie" value="true"/>
													</div>
													<br />
													<div class="errmsg"></div>
													<div>
														<input type="submit" value="LOGIN" class="btn btn-default">&nbsp;
														<input type="reset"	class="btn btn-default" value="RESET">
													</div>
												</form>
												<br />
											</div>
										</div>
									</div>
								</div>
								<div id="joinModal" class="modal fade" role="dialog">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h3 class="modal-title">REGISTER</h3>
											</div>
											<div class="modal-body">
												<form action="/register" name="register" method="POST">
													<div class="form-group">
														<label for="email">EMAIL</label> <input type="email"
															name="u_email" id="u_email" class="form-control"
															placeholder="Enter Your EMAIL" />
															
													</div>
													<div class="form-group">
														<label for="fname">FIRSTNAME</label> <input type="text"
															name="u_fname" id="u_fname" class="form-control"
															placeholder="Enter Your FIRSTNAME" />
													</div>
													<div class="form-group">
														<label for="lname">LASTNAME</label> <input type="text"
															name="u_lname" id="u_lname" class="form-control"
															placeholder="Enter Your LASTNAME" />
													</div>
													<div class="form-group">
														<label for="pwd">PASSWORD</label> <input type="password"
															name="u_pwd" id="u_pwd" class="form-control"
															placeholder="Enter Your PASSWORD" />
													</div>
													<div class="form-group">
														<label for="pwdconfirm">CONFIRM</label> <input
															type="password" id="pwdconfirm" name="pwdconfirm"
															class="form-control" />
													</div>
													<div class="errmsg"></div>
													<br />
													<div class="ver_center">
														<input type="submit" class="btn btn-default"
															value="REGISTER" />&nbsp;&nbsp;
														<a href="/index">Back to Main</a>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:catch>
					<li><a href="/user/cart">CART : <span class="badge cart">${fn:length(cart)}</span></a></li>
				</ul>
			</div>
		</div>
		<c:if test="${category != null }">
			<hr>
			<div class="row h_nav h_shop" style="margin-right: 5em">
				<ul class="list-inline">
					<li><a href="/product/list/SingleOrigins">Single Origins</a></li>
					<li><a href="/product/list/Blends">Blends</a></li>
					<li><a href="/product/list/Decafs">Decafs</a></li>
					<li><a href="/product/list/Light">Light</a></li>
					<li><a href="/product/list/Medium">Medium</a></li>
					<li><a href="/product/list/Dark">Dark</a></li>
					<li><a href="/product/list/grinder">Grinder</a></li>
					<li><a href="/product/list/HomeBrewing">Home Brewing</a></li>
					<li><a href="/product/list/Cups">Cups</a></li>
				</ul>
			</div>
		</c:if>
	</div>
	
	<script src="http://code.jquery.com/jquery-3.1.1.js"
		integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
		crossorigin="anonymous"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
	<script src="http://malsup.github.io/min/jquery.form.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
	<script src="/resources/js/script.js"></script>
</body>
</html>