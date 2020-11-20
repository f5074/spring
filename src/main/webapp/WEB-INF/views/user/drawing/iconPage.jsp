<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/user/drawing/template/header.jsp" />
<jsp:include page="/WEB-INF/views/user/drawing/template//footer.jsp" />

<script src="<c:url value="/js/drawing/drawingController.js"/>" ></script>

<body class="hold-transition skin-red layout-top-nav">
	<div class="wrapper">
		<div class="content-wrapper">
			<div class="container">
				<!-- Content Header -->
				<section class="content-header">

				</section>

				<!-- Content -->
				<section class="content">
					<!-- Content Row -->
					<div class="row">
						<form enctype="multipart/form-data" method="post" action="#" name="frm" id="frm">
							<!-- Content -->
							<div class="col-md-12">
								<div class="box box-danger">
									<div class="box-header with-border">
										<h3 class="box-title">Icon 등록</h3>
										<div class="box-tools pull-right">
											<input type="submit" class="btn btn-success" value="추가" />
											<input type="button" class="btn btn-warning" onclick="selectDrawingList(1);" value="수정" />
											<input type="button" class="btn btn-danger" onclick="selectDrawingList(1);" value="삭제" />
										</div>
									</div>
									<div class="box-body" style="height: 500px;">
										<div class="table-responsive" style="width:100%; height:100%; overflow:auto">
											<table class="table no-margin">
												<thead>
													<tr>
														<td>
															<input required type="text" id="fileNm" name="fileNm" style="width: 100%; border: none;" placeholder="Icon명">
														</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<input  required type="text" id="fileContent" name="fileContent" style="width: 100%; border: none;" placeholder="Icon내용">
														</td>
													</tr>
													<tr>
														<td>
															<input type="file" id="uploadFile" name="uploadFile" placeholder="Icon 파일(.png)" onchange="setThumbnail(event);">
															<div id="image_container" style="width: 150px; height: 80px;"></div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- .Content -->
						</form>
					</div>
					<!-- .Content Row -->
					
					<!-- Content Row -->
					<div class="row">
						<!-- Content -->
						<div class="col-md-12">
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">도면 List</h3>
									<div class="box-tools pull-right">
										<input type="button" class="btn btn-primary" onclick="selectDrawingList(1);" value="조회">
									</div>
								</div>
								<div class="box-body" style="height: 500px;">
									<div id="drawingView" class="table-responsive" style="width:100%; height:100%; overflow:auto"></div>
								</div>
							</div>
						</div>
						<!-- .Content -->
					</div>
					<!-- .Content Row -->
				</section>
			</div>
		</div>
	</div>
</body>


<!-- 도면 등록 버튼 -->
<script>
	function setThumbnail(event) {
		var reader = new FileReader();
		var img;
		reader.onload = function(event) {
			img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("height", '300px');
			img.setAttribute("width", '600px');
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
<script>
$(document).ready(function() {
	// 문제 등록하기
	$("#frm").submit(function(e) {
		e.preventDefault();
		$.ajax({
			method : "POST",
			url : "insertDrawing",
			data : {
				grammarQuiz : $("#grammarQuiz").val(),
				grammarEx : $("#grammarEx").val(),
				grammarEx1 : $("#grammarEx1").val(),
				grammarEx2 : $("#grammarEx2").val(),
				grammarEx3 : $("#grammarEx3").val(),
				grammarEx4 : $("#grammarEx4").val(),
				grammarInning : $("#grammarInning option:selected").val(),
				grammarAnswer : $("#grammarAnswer").val()
			},
			success : function(result) {
				if (result) {
					$("#modalAdd").modal({ show : true });
					$("#grammarQuiz").val("");
					$("#grammarEx").val("");
					$("#grammarEx1").val("①");
					$("#grammarEx2").val("②");
					$("#grammarEx3").val("③");
					$("#grammarEx4").val("④");
					$("#grammarQuiz").focus();
				} else {
					$("#modalContent").html("문제를 등록하지 못했습니다.");
					$("#modalDel").modal({ show : true });
				}
			}
		})
	});
});
</script>