$('#checkAll').click(function(){
	var chk = $(this).is(":checked");
	if(chk) {
		$('.form-check-input').prop('checked', true);
	} else {
		$('.form-check-input').prop('checked', false);
	}	
});

$('.btn-app').click(function(){
	if(!$('.form-check-input').is(":checked")) {
		alert("선택된 작업이 없습니다.");
		return;
	}
	$('#authModal').modal();
});

$('#authreqBtn').click(function(){
	console.log('저장클릭');
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

$('#statesel').on('change', function(){
/*	var state = $(this).val();
	if(state == 'nstart') {
		$('.rate').hide();
		$('.ing').hide();
		$('.nstart').show();
		return;
	}
	if(state == 'rate') {
		$('.nstart').hide();
		$('.ing').hide();
		$('.rate').show();
		return;
	}
	if(state == 'ing') {
		$('.rate').hide();
		$('.nstart').hide();
		$('.ing').show();
		return;
	}
	if(state == 'all') {
		$('.ing').show();
		$('.nstart').show();
		$('.rate').show();
	}*/
	$('#ingstate').val($(this).val());
	$('#sch').submit();
});

$('#prosel').on('change', function(){
	$('#p_name').val($(this).val());
	$('#sch').submit();
});


$('#jobNameSch').on('keyup', function(e){
	if(e.keyCode==13) {
		$('#j_name').val($(this).val());
		$('#sch').submit();
	}
});