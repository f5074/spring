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
							var fileNm = result[rowIdx].fileNm;
							var fileContent = result[rowIdx].fileContent;
							var crtId = result[rowIdx].crtId;
							var crtDt = result[rowIdx].crtDt;
							
							$("#drawingTable").append("<tr>"
													+ "<td style='text-align:center'><a onclick='downloadDrawingFile();'>"+ fileNm + "</a></td>"
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

function downloadDrawingFile(title) {
	$.ajax({

		url : "downloadDrawingFile",
		method : "POST",
		data : {
			type : '1_1.jpg'
		},
		error : function(error) {
//			$("#image_container").html("<input type='button' value='e'>");
		},
		success : function(data) {
//			alert(data.getType);
//			$("#image_container").html("<input type='button' value='s'>");
		}

	});
};
