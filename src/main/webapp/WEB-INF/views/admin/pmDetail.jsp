<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COFFEE KONG</title>
</head>

<body>
	<div class="container">
		<div style="clear: both; text-align: center;">
			<hr>
			<h2>Detail Info</h2>
			<hr>
		</div>
		<div style="margin: 2px; float: left;">
			<div style="margin: 10px; float: left;">
				<img src="${pvo.p_img }" width="400" height="400" alt="productIcon" />
			</div>
		</div>
		<div
			style="margin: 10px; float: left; margin-left: 150px; margin-top: 55px">
			<div>
				<h3>ID: ${pvo.p_id }</h3>
			</div>
			<div>
				<h3>Category: ${pvo.p_category }</h3>
			</div>
			<div>
				<h3>Name: ${pvo.p_name}</h3>
			</div>
			<div>
				<h3>Price: $${pvo.p_price }</h3>
			</div>
			<div>
				<h3>Manufactured: ${pvo.p_mdate }</h3>
			</div>
			<div>
				<h3>Registerd: ${pvo.p_rdate }</h3>
			</div>
		</div>
		<div style="clear: both; text-align: center;">
			<hr>
			<h3>Content</h3>
			<hr>
			<p>${pvo.p_content}</p>
		</div>
		<div>
			<div class="hor_center">
				<div class="btn-group">
					<a href="/manage/product/update" class="btn btn-default pmuBtn">EDIT</a>
					<a href="#umdModal" data-toggle="modal" class="btn btn-default">DELETE</a>
				</div>
				<div id="pmdModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title text-center">COMFIRM DELETING</h3>
							</div>
							<div class="modal-body text-center">
								<h3>DELETE THIS USER? CHECK ONCE MORE.</h3>
								<br />
							</div>
							<div class="modal-footer">
								<div>
									<a href="/manage/product/delete" class="btn btn-default pmdBtn">DELETE</a>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form role="form">
		<input type='hidden' name='pid' value="${pvo.p_id}"> <input
			type='hidden' name='page' value="${cri.page}"> <input
			type='hidden' name='perPageNum' value="${cri.perPageNum}"> <input
			type='hidden' name='searchType' value="${cri.searchType}"> <input
			type='hidden' name='keyword' value="${cri.keyword}">
	</form>
	<script>
		$(".pmuBtn, .pmdBtn").on("click", function(e) {
			e.preventDefault();
			var form = $('form[role="form"]');
			form.attr("action", $(this).attr("href"));
			if ($(this).attr("class") == "pmuBtn") {
				form.attr("method", "post");
			} else if ($(this).attr("class") == "pmdBtn") {
				form.attr("method", "get");
			}

			form.submit();
		})
	</script>
</body>
</html>