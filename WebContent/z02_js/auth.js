// 전체선택 
$('#checkAll').click(function(){
	var chk = $(this).is(":checked");
	if(chk) {
		$(".form-check-input").prop('checked', true);
	} else {
		$(".form-check-input").prop('checked', false);
	}
});

// 작업승인 or 작업반려 클릭 시
$('.btn-app').click(function(){
	if(!$('.form-check-input').is(":checked")) {
		alert("선택된 작업이 없습니다.");
		return;
	}
	$('#authModal').modal();
	$('#authModalLabel').text($(this).text());
	$('#authContentLabel').text($(this).text()+' 내용');
});

// 작업승인/반려 모달 창에서 저장 클릭 시 체크된 작업마다 ajax로 결재 상태 승인완료/반려 업데이트하기
$('#authBtn').on('click', function(){
	var a_resultN = $('#auth_content').val();
	var a_name = '';
	if($('#authModalLabel').text()=='작업승인') {
		a_name='승인완료';
	} else if($('#authModalLabel').text()=='작업반려') {
		a_name='반려';
	}
	$('input:checkbox[name=checkano]:checked').each(function(){
		var a_requestP = $(this).data('compler');
		var j_no = $(this).data('jno');
		//console.log(j_completer);
		$.ajax({
			type:"post",
			url:path+"/apprej.do",
			data:"a_no="+$(this).val()+"&a_resultN="+a_resultN+"&a_name="+a_name+"&a_requestP="+a_requestP+"&j_no="+j_no,
			success:function(){
				location.href=path+'/authIng.do';
			},
			error:function(request, status, err){
				console.log(request);
				console.log(status);
				console.log(err);
			}
		});
	});
});

// 모달창 내비게이션 바, 클릭 된 메뉴만 active 클래스 더하기
$('.task_info_nav').on('click', function(){
	$('.task_info_nav').removeClass('active');
	$(this).addClass('active');
	$('.tab-pane').removeClass('active');
	$($(this).attr('href')).addClass('active');
	return false; // a태그 #ooo 주소창에 안나오게 하기
});

// 작업명 클릭 했을 때 모달창에 해당 작업정보 ajax로 불러와서 넣기
$('[class^=jno]').on('click', function(){
	var j_no=$(this).attr('class').split("_")[1];
	var a_no=$(this).parent().parent().data('ano');
	$.ajax({
		type:"post",
		url:path+"/jsonModal.do",
		data:"j_no="+j_no+"&a_no="+a_no,
		dataType:"json",
		success:function(data){
			modalJobInfo(data.jobInfo);
			modalAuthInfo(data.authInfo);
			modalOutputInfo(data.outputs);
		},
		error:function(request, status, err){
			console.log(request);
			console.log(status);
			console.log(err);
		}
	});
});

// 작업상세정보 - 산출물탭
function modalOutputInfo(data) {
	$('#tab_1_2 .grid-template-row').empty();
	$.each(data, function(idx, output){
		var outputCode = '';
		outputCode += '<div class="row grid-row"><div class="col-md-7">';
		outputCode += '<div class="forum-list-title" id="task_outputname'+idx+'">'+output.o_name+'</div></div>';
		outputCode += '<div class="col-md-4" style="max-width: 32%;">';
		outputCode += '<a href="#" class="btn-label-brand btn btn-sm" title="파일 다운로드">';
		outputCode += '<i class="fa fa-download"></i></a></div></div>';
		$('#tab_1_2 .grid-template-row').append(outputCode);
	});
}

// 작업상세정보 - 결재정보탭
function modalAuthInfo(data) {
	$('#modal_reqName').text(data.req_name);
	$('#modal_reqN').html(data.a_requestN);
	$('#task_resName').text(data.res_name);
	// 결재 상태가 반려/승인완료가 아니면 결재자가 뜨면 안됨
	if(data.a_name=='반려' || data.a_name=='승인완료') {
		$('#modal_resName').text(data.res_name);
		$('#modal_resN').html(data.a_resultN);
	} else {
		$('.task_resInfo').empty();	
	}
}

// 작업상세정보 - 작업정보탭
function modalJobInfo(data) {
	$('#task_name').text(data.j_name);
	$('#task_start').text(new Date(data.j_startD).toLocaleDateString());
	$('#task_finish').text(new Date(data.j_endD).toLocaleDateString());
	$('#task_completeP').text(data.j_completeR*100+'%');
}

// 결재요청함에서 [결재회수] 버튼 클릭 했을 때 결재회수하기
$('.auth-cancle').on('click', function(){
	console.log($(this).parent().parent().data('ano'));
	var ano=$(this).parent().parent().data('ano');
	if(confirm('결재 회수 하시겠습니까?')) {
		location.href=path+'/retire.do?a_no='+ano;
	}
});

// 결재상태 셀렉트 바 변경시 바로 검색폼 submit하기
$('#a_name').on('change', function(){
	$('.auth-search-btn').click();
});

// 프로젝트명 셀렉트 바 변경시 바로 검색폼 submit하기
$('#pro_name').on('change', function(){
	$('.auth-search-btn').click();
});

// 프로젝트 디테일 화면 이동하기
function goProject(pno) {
	var formCode = '<form id="proform" method="post" action="'+path+'/project.do?method=form">';
	formCode += '<input type="hidden" name="p_no" value="'+pno+'">';
	$('#authTableBody').append(formCode);
	$('#proform').submit();
}