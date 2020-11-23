<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/drawing/template/header.jsp" />
<jsp:include page="/WEB-INF/views/drawing/template/footer.jsp" />
<jsp:include page="/WEB-INF/views/drawing/template/modal.jsp" />

<script src="<c:url value="/js/drawing/drawingController.js?v=1400"/>" ></script>
<script src="<c:url value="/js/drawing/equipmentController.js"/>" ></script>

<script>
	$(document).ready(function() {
		selectDrawingList(1);
	})
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
					<div class="row">
						<!-- Content -->
						<div class="col-md-8">
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">도면 디자인</h3>
									<div class="box-tools pull-right">
										<input type="button" class="btn btn-danger" onclick="showTooltip();" value="On" />
										<input type="button" class="btn btn-secondary" onclick="hideTooltip();" value="Off" />
									</div>
								</div>
								<div class="box-body" style="height: 400px;">
									<div id="image_container">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">Icon List</h3>
									<div class="box-tools pull-right">

									</div>
								</div>
								<div class="box-body" style="height: 200px;">
									<img src="<c:url value="/upload/3153922-200.png"/>" title='설비입니다1' class="droppable" style="width: 40px; height: 40px;" data-toggle="tooltip" id="ball">
								 	<img src="<c:url value="/upload/2222900-200.png"/>" title='설비입니다2' class="droppable" style="width: 40px; height: 40px;" data-toggle="tooltip" id="eqp2"> 
								 	<img src="<c:url value="/upload/1761945-200.png"/>" title='설비입니다3' class="droppable" style="width: 40px; height: 40px;" data-toggle="tooltip" id="eqp3"> 
									<img src="<c:url value="/upload/2222918-200.png"/>" title='설비입니다4' class="droppable" style="width: 40px; height: 40px;" data-toggle="tooltip" id="eqp4">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">도면 List</h3>
									<div class="box-tools pull-right">
										<input type="button" class="btn btn-danger" onclick="selectDrawingList(1);" value="조회">
									</div>
								</div>
								<div class="box-body" style="height: 300px;">
									<div id="drawingView" class="table-responsive" style="width:100%; height:100%; overflow:auto"></div>
								</div>
							</div>
						</div>
						<!-- Content -->
						<div class="col-md-8">
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">장비 List</h3>
									<div class="box-tools pull-right"></div>
								</div>
								<div class="box-body" style="height: 300px;">
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Content Body-->
			</div>
		</div>
	</div>
</body>
<script>
	let currentDroppable = null;

	ball.onmousedown = function(event) {
		let shiftX = event.clientX - ball.getBoundingClientRect().left;
		let shiftY = event.clientY - ball.getBoundingClientRect().top;

		ball.style.position = 'absolute';
		ball.style.zIndex = 1000;
		document.body.append(ball);
		moveAt(event.pageX, event.pageY);
		function moveAt(pageX, pageY) {
			ball.style.left = pageX - shiftX + 'px';
			ball.style.top = pageY - shiftY + 'px';
		}

		function onMouseMove(event) {
			moveAt(event.pageX, event.pageY);

			ball.hidden = true;
			let elemBelow = document.elementFromPoint(event.clientX,
					event.clientY);
			ball.hidden = false;

			if (!elemBelow)
				return;

			let droppableBelow = elemBelow.closest('.droppable');
			if (currentDroppable != droppableBelow) {
				if (currentDroppable) { // null when we were not over a droppable before this event
					leaveDroppable(currentDroppable);
				}
				currentDroppable = droppableBelow;
				if (currentDroppable) { // null if we're not coming over a droppable now
					// (maybe just left the droppable)
					enterDroppable(currentDroppable);
				}
			}
		}

		document.addEventListener('mousemove', onMouseMove);

		ball.onmouseup = function() {
			document.removeEventListener('mousemove', onMouseMove);
			ball.onmouseup = null;
		};

	};

	function enterDroppable(elem) {
		elem.style.background = 'pink';
	}

	function leaveDroppable(elem) {
		elem.style.background = '';
	}

	ball.ondragstart = function() {
		return false;
	};
</script>