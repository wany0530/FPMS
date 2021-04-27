// 체크박스 전체선택 
$('#checkAll').click(function(){
	var chk = $(this).is(":checked");
	if(chk) {
		$('.form-check-input').prop('checked', true);
	} else {
		$('.form-check-input').prop('checked', false);
	}	
});

// 승인요청 버튼 클릭
$('.btn-app').click(function(){
	if(!$('.form-check-input').is(":checked")) {
		alert("선택된 작업이 없습니다.");
		return;
	}
	$('input:checkbox[name=checkjno]:checked').each(function(){
		var j_no = $(this).val();
		var a_requestP = $('[name=completeRate'+j_no+']').val();
		console.log(a_requestP);
		if(a_requestP=="") {
			alert(a_requestP+'완료율 확인 해주세요.');
			return;
		}
	});
	$('#authModal').modal();
});

// 완료율창 입력 못하게 하기
$('.compleInput').keydown(function(){
	return false;
});
$('.compleInput').keyup(function(){
    $(this).val($(this).val().replace(/[^0-9]/gi,''));
});

// 작업승인 모달창 - 저장 버튼 클릭
$('#authreqBtn').click(function(){
	$('input:checkbox[name=checkjno]:checked').each(function(){
		var j_no = $(this).val();
		var a_requestP = $('[name=completeRate'+j_no+']').val();
		var a_requestN = $('#auth_content').val();
		console.log('작업번호:'+j_no+', 요청완료율:'+a_requestP+', 요청내용:'+a_requestN);
		$.ajax({
			type:"post",
			url:path+"/mytask.do?method=authins",
			data:"a_requestN="+a_requestN+"&a_requestP="+a_requestP+"&j_no="+j_no,
			success:function(){
				location.href=path+'/mytask.do?method=task';
			},
			error:function(err){
				console.log(err);
			}
		});
	});
});

// 작업 상태 셀렉트 값 변경
$('#statesel').on('change', function(){
	$('#ingstate').val($(this).val());
	$('#sch').submit();
});

// 프로젝트 셀렉트 값 변경
$('#prosel').on('change', function(){
	$('#p_name').val($(this).val());
	$('#sch').submit();
});

// 작업명 검색
$('#jobNameSch').on('keyup', function(e){
	if(e.keyCode==13) {
		$('#j_name').val($(this).val());
		$('#sch').submit();
	}
});

// 프로젝트 디테일 화면 이동하기
function goProject(pno) {
	var formCode = '<form id="proform" method="post" action="'+path+'/project.do?method=form">';
	formCode += '<input type="hidden" name="p_no" value="'+pno+'"></form>';
	$('#taskTable').append(formCode);
	$('#proform').submit();
}