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
						<!-- Content -->
						<div class="col-md-8">
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">도면 디자인</h3>
									<div class="box-tools pull-right">
										<input type="checkbox" checked data-toggle="toggle" data-size="sm" />
									</div>
								</div>
								<div class="box-body" style="height: 500px;">
									<div id="image_container">
										<img src="<c:url value="/upload/1_1.jpg"/>" style="width:100%; height:100%;">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
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
					</div>
					<div class="row">
						<!-- Content -->
						<div class="col-md-4">
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">Icon List</h3>
									<div class="box-tools pull-right">
										<input type="button" class="btn btn-primary" onclick="showTooltip();" value="On" />
										<input type="button" class="btn btn-secondary" onclick="hideTooltip();" value="Off" />
									</div>
								</div>
								<div class="box-body" style="height: 200px;">
									<img src="<c:url value="/upload/3153922-200.png"/>" title='설비입니다1' class="droppable" style="width: 40px; height: 40px;" data-toggle="tooltip" id="ball">
								 	<img src="<c:url value="/upload/2222900-200.png"/>" title='설비입니다2' class="droppable" style="width: 40px; height: 40px;" data-toggle="tooltip"> 
								 	<img src="<c:url value="/upload/1761945-200.png"/>" title='설비입니다3' class="droppable" style="width: 40px; height: 40px;" data-toggle="tooltip"> 
									<img src="<c:url value="/upload/2222918-200.png"/>" title='설비입니다4' class="droppable" style="width: 40px; height: 40px;" data-toggle="tooltip">
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
								<div class="box-body" style="height: 200px;">
								</div>
							</div>
						</div>
					</div>
				</section>
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
<script>
	// 툴팁을 실행하기 위해서 script에 tooltip함수를 실행해야 한다.
	$(function() {
		$('[data-toggle="tooltip"]').tooltip({
			// fade 효과 사용 여부
			animation : true,
			// 툴팁을 나타낼 특정 요소
			container : false,
			// 지연 설정
			delay : {
				show : 500,
				hide : 100
			},
			// 템필릿
			html : false,
			// html false 경우 지정할 요소 selector
			selector : false,
			// html true일 경우 사용되는 tooltip 템플릿
			template : '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
			// 툴팁 트리거(반응) 이벤트
			trigger : 'hover focus',
			viewport : {
				selector : 'body',
				padding : 0
			},
		// 방향 (설정하면 요소의 data-placement 설정의 무효된다.)
		placement: 'bottom',
		// 방향 (설정하면 요소의 title 설정의 무효된다.)
		//title: '',
		//sanitize: true,
		//sanitizeFn: null,
		//whiteList: ''
		});
	});
</script>
<script>
function showTooltip() {
	$('[data-toggle="tooltip"]').tooltip("show");
}

function hideTooltip() {
	$('[data-toggle="tooltip"]').tooltip("hide");
}
$(function(){
    $("input:checkbox").click(function(){
    	alert('');
        var chk = $(this).is(":checked");//.attr('checked');
        if(chk) $(".select_subject input").prop('checked', true);
        else  $(".select_subject input").prop('checked', false);
    });
});

</script>
