function isEmpty(value) {
	return value === null || typeof (value) === 'undefined' || value === ''
}

/**
 * onClickUpload
 * 
 * @param event
 * @returns
 */
function onClickUpload(event) {
	// Valildation Check
	var fileDirVal = document.getElementById("fileDir").value;
	var fileVal = document.getElementById("file").value;
	if (isEmpty(fileDirVal)) {
		$('#modalContent').html('업로드 경로가 필요합니다.');
		$('#modal').modal('show');
		return;
	}
	if (isEmpty(fileVal)) {
		$('#modalContent').html('업로드 파일이 필요합니다.');
		$('#modal').modal('show');
		return;
	}

	event.preventDefault();
	$('#btnUpload').prop('disabled', true);

	var form = $('#frm')[0];
	// FormData 객체 생성
	var formData = new FormData(form);
	// 코드로 동적으로 데이터 추가 가능.

	/* progressbar 정보 */
	var bar = $('.bar');
	var percent = $('.percent');
	var status = $('#status');

	$.ajax({
		// https://deonggi.tistory.com/57
		xhr : function() {
			var xhr = new window.XMLHttpRequest();
			xhr.upload.addEventListener("progress", function(evt) {
				if (evt.lengthComputable) {
					var percentComplete = Math.floor((evt.loaded / evt.total) * 100);
					var percentVal = percentComplete + '%';
					bar.width(percentVal);
					percent.html(percentVal);
				}
			}, false);
			return xhr;
		},
		method : 'POST',
		enctype : 'multipart/form-data',
		url : 'uploadFile',
		data : formData,
		processData : false,
		contentType : false,
		cache : false,
		timeout : 600000,
		beforeSend : function() {
			$("#pleaseWaitDialog").modal('show');
			status.empty();
			var percentVal = '0%';
			bar.width(percentVal);
			percent.html(percentVal);
		},
		complete : function() {
			$("#pleaseWaitDialog").modal('hide');
		},
		success : function(result) {
			$('#modalContent').html('저장을 성공했습니다.');
			$('#modal').modal('show');
			$('#file').val('');
			$('#btnUpload').prop('disabled', false);
		},
		error : function(e) {
			$('#modalContent').html(e);
			$('#modal').modal('show');
			$('#btnUpload').prop('disabled', false);
		}
	});
}

function onClickDownload(event) {
	// Valildation Check
	var fileDownloadDirVal = document.getElementById("fileDownloadDir").value;
	var fileNmVal = document.getElementById("fileNm").value;
	if (isEmpty(fileDownloadDirVal)) {
		$('#modalContent').html('다운로드 경로가 필요합니다.');
		$('#modal').modal('show');
		return;
	}
	if (isEmpty(fileNmVal)) {
		$('#modalContent').html('다운로드 파일명이 필요합니다.');
		$('#modal').modal('show');
		return;
	}

	event.preventDefault();
	$('#btnDownload').prop('disabled', true);

	$.ajax({
		url : 'downloadFile',
		method : 'POST',
		data : {
			fileNm : fileNmVal,
			fileDownloadDir : fileDownloadDirVal,
		},
		success : function(result) {
			if (result != null) {
				for (rowIdx = 0; rowIdx < result.length; rowIdx++) {
					var link = document.createElement('a');
					link.download = result[rowIdx]['fileNm'];
					link.href = result[rowIdx]['fullDir'];
					link.click();
				}
			}
			$('#fileNm').val('');
			$('#btnDownload').prop('disabled', false);
		},
		error : function(e) {
			$('#modalContent').html(e);
			$('#modal').modal('show');
			$('#btnDownload').prop('disabled', false);
		}
	});
}

function onClickLocalDownload(event) {
	// Valildation Check
	var fileDownloadDirVal = document.getElementById("fileDownloadDir").value;
	var fileNmVal = document.getElementById("fileNm").value;
	if (isEmpty(fileDownloadDirVal)) {
		$('#modalContent').html('다운로드 경로가 필요합니다.');
		$('#modal').modal('show');
		return;
	}
	if (isEmpty(fileNmVal)) {
		$('#modalContent').html('다운로드 파일명이 필요합니다.');
		$('#modal').modal('show');
		return;
	}

	event.preventDefault();
	$('#btnLocalDownload').prop('disabled', true);
	$.ajax({
		url : 'beforeDownloadFiles',
		method : 'POST',
		data : {
			fileNm : fileNmVal,
			fileDownloadDir : fileDownloadDirVal
		},
		success : function(result) {
			var encFileName = encodeURI(document
					.getElementById('fileNm').value);
			window.location = 'downloadFiles?fileNm=' + encFileName;

			$('#fileNm').val('');
			$('#btnLocalDownload').prop('disabled', false);
		},
		error : function(e) {
			$('#modalContent').html(e);
			$('#modal').modal('show');
			$('#btnLocalDownload').prop('disabled', false);
		}
	});
}

function onClickSelectFileList(event) {
	var fileDownloadDirVal = document.getElementById("fileDownloadDir").value;
	var fileNmVal = document.getElementById("fileNm").value;
	if (isEmpty(fileDownloadDirVal)) {
		$('#modalContent').html('다운로드 경로가 필요합니다.');
		$('#modal').modal('show');
		return;
	}

	event.preventDefault();
	$('#btnSelectFileList').prop('disabled', true);
	$.ajax({
		url : 'selectFileList',
		method : 'POST',
		data : {
			fileDownloadDir : fileDownloadDirVal
		},
		success : function(result) {
			$('#btnSelectFileList').prop('disabled', false);
		},
		error : function(e) {
			$('#btnSelectFileList').prop('disabled', false);
			alert('error');
		}
	});
}
