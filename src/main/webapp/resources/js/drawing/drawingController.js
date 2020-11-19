$(document).ready(function() {
	selectDrawingList(1);
})

function selectDrawingList(page) {
	$.ajax({
				url : "selectDrawingList",
				method : "POST",
				data : {
					type : page
				},
				success : function(result) {
					$("#drawingView").html("<table id='drawingTable' class='table no-margin'></table>");
					$("#drawingTable").append("<thead><tr><th></th><th style='text-align:center'>도면명칭</th><th style='text-align:center'>아이디</th><th style='text-align:center'>작성일</th></tr></thead>");
					$("#drawingTable").append("<tbody>");
					for (var rowIdx = 0; rowIdx < result.length; rowIdx++) {
						var fileNm = result[rowIdx].fileNm;
						var fileContent = result[rowIdx].fileContent;
						var crtId = result[rowIdx].crtId;
						var crtDt = result[rowIdx].crtDt;
						
						$("#drawingTable").append("<tr>"
												+ "<td></td>"
												+ "<td style='width:30%;'><a onclick='downloadDrawingFile();'>"+ fileNm + "</a></td>"
												+ "<td><span class='label label-info'>"+ crtId+ "</span></td>" 
												+ "<td>"+ crtDt + "</td>"
												+ "</tr>");
					}
					$("#drawingTable").append("</tbody>");
				}
			});
};

function downloadDrawingFile(title) {
	$.ajax({

		url : "downloadDrawingFile",
		method : "POST",
		data : {
			type : '1_1.jpg'
		},
		error : function(error) {
			$("#image_container").html("<input type='button' value='e'>");
		},
		success : function(data) {
			alert(data.getType);
			$("#image_container").html("<input type='button' value='s'>");
		}

	});
};
