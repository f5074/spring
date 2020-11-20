<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 작은 모달 -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header" id="modalHeader">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="modalTitle">알림메시지</h4>
			</div>
			<div class="modal-body" id="modalContent">...</div>
			<div class="modal-footer" id="modalBtns">
				<button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- .작은 모달 -->

<!-- 로그아웃용 작은 모달 -->
<div class="modal fade" id="modal1" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header" id="modalHeader1">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="modalTitle1">알림메시지</h4>
			</div>
			<div class="modal-body" id="modalContent1">로그아웃 되었습니다.</div>
			<div class="modal-footer" id="modalBtns1">
				<button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- .로그아웃용 작은 모달 -->

<!-- confirm용 작은 모달 -->
<div class="modal fade" id="modal2" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header" id="modalHeader2">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="modalTitle2">알림메시지</h4>
			</div>
			<div class="modal-body" id="modalContent2">...</div>
			<div class="modal-footer" id="modalBtns2">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-danger">Save changes</button>
			</div>
		</div>
	</div>
</div>
<!-- .confirm용 작은 모달 -->

<!-- 캡쳐용 모달 팝업 -->
<div class="modal fade" id="canvasModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">화면 캡쳐(사진)</h4>
			</div>
			<div class="modal-body" style="text-align: center">
				<canvas id="captures"></canvas>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- .캡쳐용 모달 팝업 -->