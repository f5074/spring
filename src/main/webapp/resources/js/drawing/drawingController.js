function selectDrawingList(page) {
	$.ajax({
		url : "selectDrawingList",
		method : "POST",
		data : {
			type : page
		},
		success : function(result) {
			$("#drawingView").html("<table id='drawingTable' class='table no-margin'></table>");
			if(page == 1){
				$("#drawingTable").append("<thead><tr>"
													+ "<th style='text-align:center'>도면 명</th>"
													+ "<th style='text-align:center'>등록 ID</th>" 
													+ "<th style='text-align:center'>등록 일</th></tr></thead>");
				$("#drawingTable").append("<tbody>");
				for (var rowIdx = 0; rowIdx < result.length; rowIdx++) {
					var fileId = result[rowIdx].fileId;
					var fileNm = result[rowIdx].fileNm;
					var fileFullNm = result[rowIdx].fileFullNm;
					var fileContent = result[rowIdx].fileContent;
					var crtId = result[rowIdx].crtId;
					var crtDt = result[rowIdx].crtDt;
					
					$("#drawingTable").append("<tr>"
											+ "<td style='text-align:center'><a id='fileFullNm' name='"+fileFullNm +"' onclick='clickDrawing("+fileId+");'>"+ fileNm + "</a></td>"
											+ "<td style='text-align:center'><span class='label label-danger'>"+ crtId+ "</span></td>" 
											+ "<td style='text-align:center'>"+ crtDt + "</td>"
											+ "</tr>");
				}
				$("#drawingTable").append("</tbody>");
			}
			else{
				$("#drawingTable").append("<thead><tr>"
													+ "<th style='text-align:center'>도면 ID</th>"
													+ "<th style='text-align:center'>도면 명</th>"
													+ "<th style='text-align:center'>도면 내용</th>"
													+ "<th style='text-align:center'>도면 파일</th>"
													+ "<th style='text-align:center'>등록 ID</th>" 
													+ "<th style='text-align:center'>등록 일</th></tr></thead>");
				$("#drawingTable").append("<tbody>");
				for (var rowIdx = 0; rowIdx < result.length; rowIdx++) {
					var fileId = result[rowIdx].fileId;
					var fileNm = result[rowIdx].fileNm;
					var fileContent = result[rowIdx].fileContent;
					var fileFullNm = result[rowIdx].fileFullNm;
					var crtId = result[rowIdx].crtId;
					var crtDt = result[rowIdx].crtDt;
					
					$("#drawingTable").append("<tr>"
											+ "<td style='text-align:center'>"+ fileId + "</td>"
											+ "<td style='text-align:center'>"+ fileNm + "</td>"
											+ "<td style='text-align:center'>"+ fileContent + "</td>"
											+ "<td style='text-align:center'>"+ fileFullNm + "</td>"
											+ "<td style='text-align:center'><span class='label label-danger'>"+ crtId+ "</span></td>" 
											+ "<td style='text-align:center'>"+ crtDt + "</td>"
											+ "</tr>");
				}
				$("#drawingTable").append("</tbody>");
			}
		}
	});
};

function selectIconList() {
	$.ajax({
		url : "selectIconList",
		method : "POST",
		data : {
			iconId : null
		},
		success : function(result) {
			$("#iconView").html("<table id='iconTable' class='table no-margin'></table>");
				$("#iconTable").append("<thead><tr>"
													+ "<th style='text-align:center'>Icon ID</th>"
													+ "<th style='text-align:center'>Icon 명</th>"
													+ "<th style='text-align:center'>Icon 내용</th>"
													+ "<th style='text-align:center'>Icon 파일</th>"
													+ "<th style='text-align:center'>Icon Image</th>"
													+ "<th style='text-align:center'>등록 ID</th>" 
													+ "<th style='text-align:center'>등록 일</th></tr></thead>");
				$("#iconTable").append("<tbody>");
				for (var rowIdx = 0; rowIdx < result.length; rowIdx++) {
					var iconId = result[rowIdx].iconId;
					var iconNm = result[rowIdx].iconNm;
					var iconFullNm = result[rowIdx].iconFullNm;
					var iconContent = result[rowIdx].iconContent;
					var crtId = result[rowIdx].crtId;
					var crtDt = result[rowIdx].crtDt;
					
					$("#iconTable").append("<tr>"
											+ "<td style='text-align:center'>"+ iconId + "</a></td>"
											+ "<td style='text-align:center'>"+ iconNm + "</a></td>"
											+ "<td style='text-align:center'>"+ iconContent + "</td>"
											+ "<td style='text-align:center'>"+ iconFullNm + "</td>"
											+ "<td style='text-align:center'><img src='/spring/upload/icon/"+iconFullNm +"' style='width: 30px; height: 30px;'/></td>"
											+ "<td style='text-align:center'><span class='label label-danger'>"+ crtId+ "</span></td>"
											+ "<td style='text-align:center'>"+ crtDt + "</td>"
											+ "</tr>");
				}
				$("#iconTable").append("</tbody>");
		}
	});
};


function selectEquipmentList(fileId) {
	$.ajax({
		url : "selectEquipmentList",
		method : "POST",
		data : {
			fileId : fileId
		},
		success : function(result) {
			$("#equipmentView").html("<table id='equipmentTable' class='table no-margin'></table>");
				$("#equipmentTable").append("<thead><tr>"
													+ "<th style='text-align:center'>도면 ID</th>"
													+ "<th style='text-align:center'>Icon ID</th>"
													+ "<th style='text-align:center'>설비 ID</th>"
													+ "<th style='text-align:center'>설비 명</th>"
													+ "<th style='text-align:center'>설비 내용</th>"
													+ "<th style='text-align:center'>Width</th>"
													+ "<th style='text-align:center'>Height</th>"
													+ "<th style='text-align:center'>X</th>"
													+ "<th style='text-align:center'>Y</th>"
													+ "<th style='text-align:center'>등록 ID</th>" 
													+ "<th style='text-align:center'>등록 일</th></tr></thead>");
				$("#equipmentTable").append("<tbody>");
				for (var rowIdx = 0; rowIdx < result.length; rowIdx++) {
					var fileId = result[rowIdx].fileId;
					var iconId = result[rowIdx].iconId;
					var eqpId = result[rowIdx].eqpId;
					var eqpNm = result[rowIdx].eqpNm;
					var eqpContent = result[rowIdx].eqpContent;
					var eqpWidth = result[rowIdx].eqpWidth;
					var eqpHeight = result[rowIdx].eqpHeight;
					var eqpX = result[rowIdx].eqpX;
					var eqpY = result[rowIdx].eqpY;
					var crtId = result[rowIdx].crtId;
					var crtDt = result[rowIdx].crtDt;
					
					$("#equipmentTable").append("<tr>"
											+ "<td style='text-align:center'>"+ fileId + "</a></td>"
											+ "<td style='text-align:center'>"+ iconId + "</a></td>"
											+ "<td style='text-align:center'>"+ eqpId + "</a></td>"
											+ "<td style='text-align:center'>"+ eqpNm + "</a></td>"
											+ "<td style='text-align:center'>"+ eqpContent + "</td>"
											+ "<td style='text-align:center'>"+ eqpWidth + "</td>"
											+ "<td style='text-align:center'>"+ eqpHeight + "</td>"
											+ "<td style='text-align:center'>"+ eqpX + "</td>"
											+ "<td style='text-align:center'>"+ eqpY + "</td>"
											+ "<td style='text-align:center'><span class='label label-danger'>"+ crtId+ "</span></td>"
											+ "<td style='text-align:center'>"+ crtDt + "</td>"
											+ "</tr>");
				}
				$("#equipmentTable").append("</tbody>");
		}
	});
};

function clearImage(){
	$('img').remove();
}


function loadImage(result){
	
//	var imageContainer = $('#image_container');
//	var equipmentIconView = $('#equipmentIconView');
//	imageContainer.empty();
//	equipmentIconView.empty();
	
	img = document.createElement("img");
	img.setAttribute("src", '/spring/upload/drawing/' + result[0].fileFullNm);
	img.setAttribute("id", 'prieviewImg');
	img.setAttribute("height", '100%');
	img.setAttribute("width", '100%');
	img.setAttribute("class", 'droppable');
	if(document.querySelector("#prieviewImg"))document.querySelector("#prieviewImg").remove();
	document.querySelector("div#image_container").appendChild(img);

}

function loadEquipmentList(fileId) {
	$.ajax({
		url : "selectEquipmentList",
		method : "POST",
		data : {
			fileId : fileId
		},
		success : function(result) {
			$("#equipmentView").html("<table id='equipmentTable' class='table no-margin'></table>");
				$("#equipmentTable").append("<thead><tr>"
													+ "<th style='text-align:center'>도면 ID</th>"
													+ "<th style='text-align:center'>Icon ID</th>"
													+ "<th style='text-align:center'>설비 ID</th>"
													+ "<th style='text-align:center'>설비 명</th>"
													+ "<th style='text-align:center'>설비 내용</th>"
													+ "<th style='text-align:center'>Width</th>"
													+ "<th style='text-align:center'>Height</th>"
													+ "<th style='text-align:center'>Left</th>"
													+ "<th style='text-align:center'>Top</th></tr></thead>");
				$("#equipmentTable").append("<tbody>");
				for (var rowIdx = 0; rowIdx < result.length; rowIdx++) {
					var fileId = result[rowIdx].fileId;
					var iconId = result[rowIdx].iconId;
					var eqpId = result[rowIdx].eqpId;
					var eqpNm = result[rowIdx].eqpNm;
					var eqpContent = result[rowIdx].eqpContent;
					var eqpWidth = result[rowIdx].eqpWidth;
					var eqpHeight = result[rowIdx].eqpHeight;
					var eqpX = result[rowIdx].eqpX;
					var eqpY = result[rowIdx].eqpY;
					var crtId = result[rowIdx].crtId;
					var crtDt = result[rowIdx].crtDt;
					
					$("#equipmentTable").append("<tr>"
											+ "<td style='text-align:center'>"+ fileId + "</a></td>"
											+ "<td style='text-align:center'>"+ iconId + "</a></td>"
											+ "<td style='text-align:center'>"+ eqpId + "</a></td>"
											+ "<td style='text-align:center'>"+ eqpNm + "</a></td>"
											+ "<td style='text-align:center'>"+ eqpContent + "</td>"
											+ "<td style='text-align:center'>"+ eqpWidth + "</td>"
											+ "<td style='text-align:center'>"+ eqpHeight + "</td>"
											+ "<td style='text-align:center' id='X"+eqpId+"'>"+ eqpX + "</td>"
											+ "<td style='text-align:center' id='Y"+eqpId+"'>"+ eqpY + "</td>"
											+ "</tr>");
				}
				$("#equipmentTable").append("</tbody>");
		}
	});
};

function loadEquipmentIconList(fileId){
	$.ajax({
		url : "selectEquipmentList",
		method : "POST",
		data : {
			fileId : fileId
		},
		success : function(result) {
			for (var rowIdx = 0; rowIdx < result.length; rowIdx++) {
				var divEl = $('#image_container');
//				var divX = divEl.offset().left;
//				var divY = divEl.offset().top;
				var divX = Number(divEl.position().left);
				var divY = Number(divEl.position().top);
				
//				alert(divX +"," + divY);
				
				var fileId = result[rowIdx].fileId;
				var iconId = result[rowIdx].iconId;
				var iconFullNm = result[rowIdx].iconFullNm;
				var eqpId = result[rowIdx].eqpId;
				var eqpNm = result[rowIdx].eqpNm;
				var eqpContent = result[rowIdx].eqpContent;
				var eqpWidth = result[rowIdx].eqpWidth;
				var eqpHeight = result[rowIdx].eqpHeight;
				var eqpX = Number(result[rowIdx].eqpX);
				var eqpY = Number(result[rowIdx].eqpY);
				var crtId = result[rowIdx].crtId;
				var crtDt = result[rowIdx].crtDt;
				
				img = document.createElement("img");
				img.setAttribute("src", '/spring/upload/icon/' + iconFullNm);
				img.setAttribute("width", eqpWidth+'px');
				img.setAttribute("height", eqpHeight+'px');
				img.setAttribute("id", eqpId);
				img.setAttribute("title", eqpContent);
				img.setAttribute("class", 'droppable');
				img.setAttribute("data-toggle", 'tooltip');
//				img.setAttribute("top", '160px');
//				img.setAttribute("left", '90px');
//				img.setAttribute("position", 'absolute');

				if(eqpX === 0 && eqpY === 0){
					if(document.querySelector('#equipmentIconView') != null){
						document.querySelector('#equipmentIconView').appendChild(img);
						img.addEventListener('mousemove', onMouseMove);		
					}	
				}
				else{
					document.querySelector('#image_container').appendChild(img);
					img.addEventListener('mousemove', onMouseMove);			
					img.setAttribute("style", "position: absolute; top:"+ (divY + eqpY)+"px; left:"+ (divX +eqpX) +"px;");
				}
				
			}
			
			
		}
	});	
};

function onMouseMove(event) {
	var tdElements = document.getElementById("equipmentTable").getElementsByTagName('td');
    var len = tdElements.length;
    var price = 0;
    for(var i=0; i<len;i++) {
        var temp = tdElements.item(i).innerText.valueOf();
        if(temp.indexOf('결제금액') != -1) {
            price = tdElements.item(i+1).innerText;
            alert(price);
        }        
    }
	
	
	var divEl = $('#image_container');
	var divX = divEl.offset().left;
	var divY = divEl.offset().top;
//	alert(divX + "," + divY);
	var selectedIcon = document.getElementById($(this).attr("id"));
	var id = $(this).attr("id");
//	$('#equipmentTable tr').each(function(){
//		var day = $(this).find('td').eq(2).html();
////		alert(day);
//		$(this).find('td').eq(1).html('aaaa');
//	});
	
	let currentDroppable = null;
	selectedIcon.onmousedown = function(event) {
		let shiftX = event.clientX - selectedIcon.getBoundingClientRect().left;
		let shiftY = event.clientY - selectedIcon.getBoundingClientRect().top;
		selectedIcon.style.position = 'absolute';
//		selectedIcon.style.zIndex = 1000;
		document.body.append(selectedIcon);
		moveAt(event.pageX, event.pageY);
		function moveAt(pageX, pageY) {
			selectedIcon.style.left = pageX - shiftX + 'px';
			selectedIcon.style.top = pageY - shiftY + 'px';
			
			var idX = "X" +id;
			var idY = "Y"+ id;
			document.getElementById(idX).innerText = pageX - shiftX - divX;
			document.getElementById(idY).innerText = pageY - shiftY - divY;
		}

		function onMouseMove(event) {
			moveAt(event.pageX, event.pageY);

			selectedIcon.hidden = true;
			let elemBelow = document.elementFromPoint(event.clientX, event.clientY);
			selectedIcon.hidden = false;

			if (!elemBelow)
				return;

//			let droppableBelow = elemBelow.closest('.droppable');
//			if (currentDroppable != droppableBelow) {
//				if (currentDroppable) { // null when we were not over a droppable before this event
//					leaveDroppable(currentDroppable);
//				}
//				currentDroppable = droppableBelow;
//				if (currentDroppable) { // null if we're not coming over a droppable now
//					// (maybe just left the droppable)
//					enterDroppable(currentDroppable);
//				}
//			}
		}

		document.addEventListener('mousemove', onMouseMove);

		selectedIcon.onmouseup = function() {
			document.removeEventListener('mousemove', onMouseMove);
			selectedIcon.onmouseup = null;
		};

	};

	selectedIcon.ondragstart = function() {
		return false;
	};
}





/**
 * 리스트 클릭시 파일 이미지
 * @param fileId
 * @returns
 */
function clickDrawing(fileId) {
	var fileFullNm = $('#fileFullNm').attr('name');
	$.ajax({
		url : "selectDrawingList",
		method : "POST",
		data : {
			fileId : fileId
		},
		error : function(error) {
			alert('error');
		},
		success : function(result) {
			clearImage();
			loadImage(result);
			loadEquipmentList(result[0].fileId);
			loadEquipmentIconList(result[0].fileId);
		}
	});
};

/**
 * 파일 선택 시 파일 이미지
 * @param event
 * @returns
 */
function previewImage(event) {
	var reader = new FileReader();
	var img;
	reader.onload = function(event) {
		img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("id", 'prieviewImg');
		img.setAttribute("height", '100%');
		img.setAttribute("width", '100%');
		if(document.querySelector("#prieviewImg"))document.querySelector("#prieviewImg").remove();
		document.querySelector("div#image_container").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
}