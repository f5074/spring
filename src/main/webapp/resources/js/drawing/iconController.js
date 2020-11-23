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


/**
 * 리스트 클릭시 파일 이미지
 * @param fileId
 * @returns
 */
function showIcon(iconId) {
	var fileFullNm = $('#iconFullNm').attr('name');
	$.ajax({
		url : "showIcon",
		method : "POST",
		data : {
			iconId : iconId
		},
		error : function(error) {
			alert('error');
		},
		success : function(result) {
			img = document.createElement("img");
			img.setAttribute("src", '/spring/upload/icon/' + result[0].iconFullNm);
			img.setAttribute("id", 'prieviewImg');
			img.setAttribute("height", '100%');
			img.setAttribute("width", '100%');
			if(document.querySelector("#prieviewImg"))document.querySelector("#prieviewImg").remove();
			document.querySelector("div#image_container").appendChild(img);
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
