$(document).ready(function() {
	var userList = "";
	var deptList = "";
	var posList = "";
	var rankList = "";
	
	// 검색
	$('.selectpicker').change(function(){
		console.log($(this).val());
		console.log($('#searchForm').serialize());
		$.ajax({
			type:"post",
			url:"${path}/user.do?method=data",
			data:$('#searchForm').serialize(),
			dataType:"json",
			success:function(data){
				console.log(data);
				userList = data.userList;
				deptList = data.deptList;
				posList = data.posList;
				rankList = data.rankList;
				
				var show = "";
				$.each(userList, function(idx, user){
					show += "<tr class='user-item'><td>"+user.u_id+"</td>";
					show += "<td>"+user.u_name+"</td>";
					if(user.d_name == null)
						show += "<td>"+"소속 부서 없음"+"</td>";
					else
						show += "<td>"+user.d_name+"</td>";
					if(user.pos_name == null)
						show += "<td>"+"직책 없음"+"</td>";
					else
						show += "<td>"+user.pos_name+"</td>";
					if(user.r_name == null)
						show += "<td>"+"직급 없음"+"</td>";
					else
						show += "<td>"+user.r_name+"</td>";
				})
				$('#userList').html(show);
				
			},
			error:function(err){
				console.log(err);
			}
		});
	})
	
	// 상세보기
	$('.user-item').on('click',function(){
		// id
		var id = $(this).children().eq(0).text();
		// name
		var name = $(this).children().eq(1).text();
		// dept
		var dept = $(this).children().eq(2).text();
		// position
		var pos = $(this).children().eq(3).text();
		// rank
		var rank = $(this).children().eq(4).text();
		if(dept == "소속 부서 없음")
			dept = "부서";
		if(pos == "직책 없음")
			pos = "직책";
		if(rank == "직급 없음")
			rank = "직급";
		
		$('#modalId').val(id);
		$('#modalName').val(name);
		$('#modalDept').val(dept);
		$('#modalPos').val(pos);
		$('#modalRank').val(rank);
		
		$("#modalBtn").trigger("click");
	});
	
	// 수정
	$('#upBtn').on("click",function(){
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: 'btn btn-success',
				cancelButton: 'btn btn-danger'
			},
			buttonsStyling: false
	      })

      swalWithBootstrapButtons.fire({
			title: '수정하시겠습니까?',
			type: 'info',
			showCancelButton: true,
			confirmButtonText: '예',
			cancelButtonText: '아니오',
			reverseButtons: true
      }).then((result) => {
			if (result.value) {
				/* modalDeptmodalPosmodalRank */
				var dept = $("#modalDept").val();
				var pos = $("#modalPos").val();
				var rank = $("#modalRank").val();
				
				if(dept==null || dept=="" || dept=="부서"){
					Swal.fire({
						title: '부서를 선택하세요.',
						type: 'error',
						customClass: {
							confirmButton: 'btn'
						},
						buttonsStyling: false,
			      })
				} else if(pos==null || pos=="" || pos=="직책"){
					Swal.fire({
						title: '직책를 선택하세요.',
						type: 'error',
						customClass: {
							confirmButton: 'btn'
						},
						buttonsStyling: false,
			      })	
				} else if(rank==null || rank=="" || rank=="직급"){
					Swal.fire({
						title: '직급를 선택하세요.',
						type: 'error',
						customClass: {
							confirmButton: 'btn'
						},
						buttonsStyling: false,
			      })	
				} else {
					$("#detailForm").attr("action","${path}/user.do?method=update");
					$("#detailForm").submit();							
				}
      	} 
      });
	});
	
	// 삭제
	$('#delBtn').on("click",function(){
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: 'btn btn-success',
				cancelButton: 'btn btn-danger'
			},
			buttonsStyling: false
	      })

      swalWithBootstrapButtons.fire({
			title: '삭제하시겠습니까?',
			type: 'warning',
			showCancelButton: true,
			confirmButtonText: '예',
			cancelButtonText: '아니오',
			reverseButtons: true
      }).then((result) => {
			if (result.value) {
				$("#detailForm").attr("action","${path}/user.do?method=delete");
				$("#detailForm").submit();
      	} 
      });
	});
	
	//초대
	$('#inviteBtn').on("click",function(){
		var email = $('#inviteForm [name=u_email]').val();
		var name = $('#inviteForm [name=u_name]').val();
		console.log(email);
		console.log(name);
		if(email==""){
			Swal.fire({
				title: '이메일을 입력하세요.',
				type: 'error',
				customClass: {
					confirmButton: 'btn'
				},
				buttonsStyling: false,
	      })
		} else if(name=="") {
			Swal.fire({
				title: '이름을 입력하세요.',
				type: 'error',
				customClass: {
					confirmButton: 'btn'
				},
				buttonsStyling: false,
	      })
		} else {
			$('#inviteForm').submit();
			let timerInterval
		      Swal.fire({
		        title: '초대 중입니다. 잠시만 기다려주세요.',
		        html: '<strong></strong>',
		        timer: 10000,
		        onBeforeOpen: () => {
		          Swal.showLoading()
		          timerInterval = setInterval(() => {
		            Swal.getContent().querySelector('strong')
		              .textContent = Swal.getTimerLeft()
		          }, 100)
		        },
		        onClose: () => {
		          clearInterval(timerInterval)
		        }
		      }).then((result) => {
		        if (
		          /* Read more about handling dismissals below */
		          result.dismiss === Swal.DismissReason.timer
		        ) {
		          console.log('I was closed by the timer')
		        }
		      })
		}
		return false;
	});
});
