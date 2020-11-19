<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp" />
<jsp:include page="/WEB-INF/views/template/footer.jsp" />

<script src="<c:url value="/js/drawing/drawingController.js"/>" ></script>


<body class="hold-transition skin-red layout-top-nav">
	<div class="wrapper">
		<div class="content-wrapper">
			<div class="container">
				<!-- Content -->
				<section class="content">
					<div class="row">
						<!-- Content Left -->
						<div class="col-md-5">
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">도면 List</h3>
									<div class="box-tools pull-right"></div>
								</div>
								<div class="box-body" style="height: 400px;">
									<div id="drawingView" class="table-responsive" style="width:100%; height:100%; overflow:auto"></div>
								</div>
							</div>
						</div>
						

						<!-- Content Right -->
						<div class="col-md-7">
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">도면 정보</h3>
									<div class="box-tools pull-right"></div>
								</div>
								<div class="box-body" style="height: 600px;">
									<div id="image_container">
										<img src="<c:url value="/upload/1_1.jpg"/>" style="width:100%; height:100%;">
									</div>
								</div>
							</div>
						</div>
						<!-- Content Right -->
						</div>
				</section>
			</div>
		</div>
	</div>
</body>
