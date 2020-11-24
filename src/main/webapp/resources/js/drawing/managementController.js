function showTooltip() {
	$('[data-toggle="tooltip"]').tooltip("show");
}

function hideTooltip() {
	$('[data-toggle="tooltip"]').tooltip("hide");
}

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

