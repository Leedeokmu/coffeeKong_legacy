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
<title>COFFEE KONG.</title>
</head>
<body>
	<div class="container">
		<hr>
		<div class="row ver_center" style="margin-bottom:10px">
			<div class="col-md-8  f_corp">
				<ul class="list-inline">
					<li>
						<img src="${basePath }/coffeeKong/img/b-corp-seal.png" alt="b-corp-seal"/>
					</li>
					<li>
						<img src="${basePath }/coffeeKong/img/certified-kosher.png" alt="" />
					</li>
					<li>
						<img src="${basePath }/coffeeKong/img/cooperative-coffees.png" alt="" />
					</li>
					<li>
						<img src="${basePath }/coffeeKong/img/crs-fair-trade.png" alt="" />
					</li>
					<li>
						<img src="${basePath }/coffeeKong/img/shade-grown-friendly-to-birds.png" alt="" />
					</li>
				</ul>
			</div>
			<div class="col-md-4 f_sns">
				<ul class="list-inline " >
					<li>
						<a id="twitter" class="" href="http://www.twitter.com" target="_blank">
							<img src="${basePath }/coffeeKong/img/twitter_new.png" alt="" />
						</a>
					</li>
					<li>
						<a id="facebook" class="" href="http://www.facebook.com" target="_blank">
							<img src="${basePath }/coffeeKong/img/facebook_new.png" alt="" />
						</a>
					</li>
					<li>
						<a id="youtube" class="" href="http://www.youtube.com" target="_blank">
							<img src="${basePath }/coffeeKong/img/youtube_new.png" alt="" />
						</a>
					</li>
					<li>
						<a id="instagram" class="" href="http://www.instagram.com" target="_blank">
							<img src="${basePath }/coffeeKong/img/instagram_new.png" alt="" />
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="row"><span class="f_rights">© 2016 CoffeeKong. All Rights Reseved.</span></div>
	</div>
</body>
</html>