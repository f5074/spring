<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/drawing/template/header.jsp" />
<jsp:include page="/WEB-INF/views/drawing/template/footer.jsp" />
<jsp:include page="/WEB-INF/views/drawing/template/modal.jsp" />

<script src="<c:url value="/js/drawing/drawing_common.js?v=12030900"/>" ></script>
<script src="<c:url value="/js/drawing/drawing_tootip.js?v=12030900"/>" ></script>

<script>
	$(document).ready(function() {
		selectEquipmentList();
		$("#fileId").val("1");
		$("#iconId").val("1");
		$("#eqpWidth").val("40");
		$("#eqpHeight").val("40");
		$("#eqpX").val("0");
		$("#eqpY").val("0");
		$("#eqpEnable").val("Y");
		$("#eqpVisible").val("Y");
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
				url : "insertEquipment",
				data : formData,
				processData: false,
				contentType: false,
				cache: false,
				timeout: 600000,
				error : function(error) {
					alert('error');
				},
				success : function(result) {
					$("#modalContent").html("저장을 성공했습니다.");
					$("#modal").modal("show");
					selectEquipmentList();
				}
			})
	});
});
	
</script>

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
										<h3 class="box-title">장비 등록</h3>
										<div class="box-tools pull-right">
											<input type="submit" class="btn btn-success" value="등록" />
										</div>
									</div>
									<div class="box-body" style="height: 400px;">
										<div class="table-responsive" style="width:100%; height:100%; overflow:auto">
											<div>
												<div class="f5074-layout-left">
													<table class="table no-margin">
														<tbody>
															<tr>
																<td><p>도면 ID</p></td>
																<td><input type="text" id="fileId" name="fileId" style="width: 200px; height:30px;" placeholder="도면 ID" required></td>
															</tr>
															<tr>
																<td><p>아이콘 ID</p></td>
																<td>
																	<div class="form-group">
																		<select class="form-control" id="iconId" name="iconId" style="width: 200px;">
																			<option value='1'>1</option>
																			<option value='2'>2</option>
																			<option value='3'>3</option>
																			<option value='4'>4</option>
																			<option value='5'>5</option>
																		</select>
																	</div>
																</td>
															</tr>
															<tr>
																<td><p>설비 명</p></td>
																<td><input type="text" id="eqpNm" name="eqpNm" style="width: 200px; height:30px;" placeholder="설비 명" required></td>
															</tr>
															<tr>
																<td><p>설비 내용</p></td>
																<td><input type="text" id="eqpContent" name="eqpContent" style="width: 200px; height:30px;" placeholder="설비 내용" required></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="f5074-layout-right">
													<table class="table no-margin">
														<tbody>
															<tr>
																<td><p>설비 Width</p></td>
																<td><input type="number" id="eqpWidth" name="eqpWidth" style="width: 200px;" placeholder="설비 Width" min='20' max='50' required></td>
															</tr>
															<tr>
																<td><p>설비 Height</p></td>
																<td><input type="number" id="eqpHeight" name="eqpHeight" style="width: 200px;" placeholder="설비 Height" min='20' max='50' required></td>
															</tr>
															<tr>
																<td><p>설비 X</p></td>
																<td><input type="number" id="eqpX" name="eqpX" style="width: 200px;" placeholder="설비 X" required></td>
															</tr>
															<tr>
																<td><p>설비 Y</p></td>
																<td><input type="number" id="eqpY" name="eqpY" style="width: 200px;" placeholder="설비 Y" required></td>
															</tr>
															<tr>
																<td><p>설비 Visible</p></td>
																<td>
																	<div class="form-group">
																		<select class="form-control" id="eqpVisible" name="eqpVisible" style="width: 200px;" >
																			<option value='Y'>Y</option>
																			<option value='N'>N</option>
																		</select>
																	</div>
																</td>
															</tr>
															<tr>
																<td><p>설비 Enable</p></td>
																<td>
																	<div class="form-group">
																		<select class="form-control" id="eqpEnable" name="eqpEnable" style="width: 200px;">
																			<option value='Y'>Y</option>
																			<option value='N'>N</option>
																		</select>
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
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
									<h3 class="box-title">장비 List</h3>
									<div class="box-tools pull-right">
										<input type="button" class="btn btn-danger" onclick="selectEquipmentList();" value="조회">
									</div>
								</div>
								<div class="box-body" style="height: 200px;">
									<div id="equipmentView" class="table-responsive" style="width:100%; height:100%; overflow:auto"></div>
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