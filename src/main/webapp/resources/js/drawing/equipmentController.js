function selectEquipmentList() {
	$.ajax({
				url : "selectEquipmentList",
				method : "POST",
				data : {
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