<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/drawing/template/header.jsp" />
<jsp:include page="/WEB-INF/views/drawing/template/footer.jsp" />
<jsp:include page="/WEB-INF/views/drawing/template/modal.jsp" />

<script src="<c:url value="/js/drawing/drawingController.js?v=3"/>" ></script>

<script>
	$(document).ready(function() {
		selectDrawingList(2);
	});
	
	$(document).ready(function() {
	$("#frm").submit(function(e) {
	    var form = $('#frm')[0];
	    // FormData 객체 생성
	    var formData = new FormData(form);
	    // 코드로 동적으로 데이터 추가 가능.
		e.preventDefault();
		$.ajax({
			method : "POST",
			enctype: 'multipart/form-data',
			url : "insertDrawing",
			data : formData,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
			success : function(result) {
				$("#modalContent").html("저장을 성공했습니다.");
				$("#modal").modal("show");
				
				$("#fileNm").val("");
				$("#fileContent").val("");
				$("#uploadFile").val("");
				$("#prieviewImg").remove();
				selectDrawingList(2);
			}
		})
	});
});
	
</script>

<style>
    div.f5074-layout-left {
        width: 40%;
        float: left;
        box-sizing: border-box;
    }
    div.f5074-layout-right {
        width: 60%;
        float: right;
        box-sizing: border-box;
    }
</style>
<body class="hold-transition skin-red layout-top-nav">
	<div class="wrapper">
		<div class="content-wrapper">
			<div class="container">
				<!-- Content Header -->
				<!-- <section class="content-header"></section> -->
				<!-- .Content Header -->
				<!-- Content Body-->
				<section class="content">
					<!-- Content Row -->
					<div class="row">
						<form enctype="multipart/form-data" method="post" action="#" name="frm" id="frm">
							<!-- Content -->
							<div class="col-md-12">
								<div class="box box-danger">
									<div class="box-header with-border">
										<h3 class="box-title">도면 등록</h3>
										<div class="box-tools pull-right">
											<input type="submit" class="btn btn-success" value="추가" />
										</div>
									</div>
									<div class="box-body" style="height: 400px;">
										<div class="table-responsive" style="width:100%; height:100%; overflow:auto">
										    <div>
										        <div class="f5074-layout-left">
										        	<table class="table no-margin">
														<thead>
															<tr>
																<td><p>도면 명</p></td>
																<td><input type="text" id="fileNm" name="fileNm" style="width: 100%; border: none;" placeholder="도면 명" required></td>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><p>도면 내용</p></td>
																<td><input type="text" id="fileContent" name="fileContent" style="width: 100%; border: none;" placeholder="도면 내용" required></td>
															</tr>
															<tr>
																<td><p>도면 파일</p></td>
																<td><input type="file" id="uploadFile" name="uploadFile" placeholder="도면 파일(.png)" onchange="previewImage(event);" required></td>
															</tr>
														</tbody>
													</table>
										        </div>
										        <div class="f5074-layout-right">
										        	<h5>&#60;도면파일 미리보기&#62;</h5>
													<div id="image_container" style="width: 600px; height: 300px;"></div>
										        </div>
										    </div>
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
										<input type="button" class="btn btn-danger" onclick="selectDrawingList(2);" value="조회">
									</div>
								</div>
								<div class="box-body" style="height: 200px;">
									<div id="drawingView" class="table-responsive" style="width:100%; height:100%; overflow:auto"></div>
								</div>
							</div>
						</div>
						<!-- .Content -->
					</div>
					<!-- .Content Row -->
				</section>
				<!-- Content Body-->
			</div>
		</div>
	</div>
</body>