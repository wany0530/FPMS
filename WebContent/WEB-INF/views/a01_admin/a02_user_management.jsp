<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../a01_main/bootstrapTop.jsp"%>
	<style>
		.user-list {
			padding: 10px;
		}
		.user-item:hover {
			background: #1E1E28;
			cursor: pointer;
		}
	</style>
</head>

<body class="sidebar-mini ">
	<div class="wrapper">

		<%@ include file="../a01_main/sidebar.jsp"%>

		<div class="main-panel">
			
			<%@ include file="../a01_main/header.jsp"%>

			<!-- Start Content -->
			<div class="content">
			
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<form id="searchForm">
								<div class="row">
									<div class="col-2">
										<h4 class="title">임직원 조회</h4>
									</div>
									<div class="col-3">
										<select class="selectpicker" data-size="7" name="d_name" id="dept"
											data-style="btn btn-primary" title="">
											<option selected>부서</option>
										</select>
									</div>
									<div class="col-3">
										<select class="selectpicker" data-size="7" name="pos_name" id="position"
											data-style="btn btn-primary" title="Single Select">
											<option selected>직책</option>
										</select>
									</div>	
									<div class="col-3">
										<select class="selectpicker" data-size="7" name="r_name" id="rank"
											data-style="btn btn-primary" title="Single Select">
											<option selected>직급</option>
										</select>
									</div>
								</div>
								</form>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow:auto; height: 500px">
									<table class="table">
										<colgroup>
											<col width="17%"><col width="17%"><col width="17%">
											<col width="17%"><col width="17%"><col width="*">
										</colgroup>
										<thead class="text-primary">
											<tr class="text-center">
												<th>아이디</th><th>이름</th><th>부서</th>
												<th>직책</th><th>직급</th>
											</tr>
										</thead>
										<tbody class="text-center" id="userList">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<!-- 직원정보 -->
								<form method="post" action="${path}/user.do?method=insert" id="inviteForm">
								<div class="row">
									<div class="col-3">
										<select class="selectpicker" data-size="7" name="d_no" 
											data-style="btn btn-primary" title="">
											<option selected>부서</option>
										</select>
									</div>
									<div class="col-3">
										<select class="selectpicker" data-size="7" name="pos_no"
											data-style="btn btn-primary" title="Single Select">
											<option selected>직책</option>
										</select>
									</div>	
									<div class="col-3">
										<select class="selectpicker" data-size="7" name="r_no"
											data-style="btn btn-primary" title="Single Select">
											<option selected>직급</option>
										</select>
									</div>
								</div>
									
								<div class="row text-left">
									<div class="col-1 p-0 align-items-center d-flex justify-content-end">
										<label class="col-form-label m-0 p-0">
											이메일 *
										</label>
									</div>
									<div class="col-4">
										<div class="form-group mt-2">
											<input type="email" class="form-control" name="u_email"
												placeholder="exam@email.com">
										</div>
									</div>
									<div class="col-1 p-0 align-items-center d-flex justify-content-end">
										<label class="col-form-label m-0 p-0">
											이름 *
										</label>
									</div>
									<div class="col-3">
										<div class="form-group mt-2">
											<input type="text" class="form-control" name="u_name"
												placeholder="이름을 입력하세요.">
										</div>
									</div>
									<div class="col-3 align-items-center pt-1">
										<button class="btn btn-primary" id="inviteBtn">
											<i class="tim-icons icon-simple-add"></i> 초대
										</button>
									</div>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
				<button class="btn" data-toggle="modal" data-target="#myModal"
					id="modalBtn" style="display: none;">
					Small alert modal
				</button>
				<!-- Classic Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header justify-content-center">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">
									<i class="tim-icons icon-simple-remove"></i>
								</button>
								<h6 class="title title-up">임직원 상세정보</h6>
							</div>
							
							<form id="detailForm" method="post">
							<div class="modal-body">
								
								<div class="row">
									<label class="col-sm-2 col-form-label text-right">
										아이디
									</label>
									<div class="col-sm-9">
										<div class="form-group">
											<input class="form-control" type="text" readonly="readonly"
												style="color: black; background: #F4F5F8; "id="modalId" name="u_id"/>
										</div>
									</div>
								</div>
								<div class="row">
									<label class="col-sm-2 col-form-label text-right">
										이름
									</label>
									<div class="col-sm-9">
										<div class="form-group">
											<input class="form-control" type="text" readonly="readonly"
												style="color: black; background: #F4F5F8;" id="modalName" name="u_name"/>
										</div>
									</div>
								</div>
								
								<!-- 부서 -->
								<div class="row">
									<label class="col-sm-2 col-form-label text-right">
										부서
									</label>
									<div class="col-sm-5">
										<div class="form-group">
											<select class="form-control" style="color: black;"
												id="modalDept" name="d_name">
												<option selected>부서</option>
											</select>
										</div>
									</div>
								</div>
								
								<!-- 직책 -->
								<div class="row">
									<label class="col-sm-2 col-form-label text-right">
										직책
									</label>
									<div class="col-sm-5">
										<div class="form-group">
											<select class="form-control" style="color: black;"
												id="modalPos" name="pos_name">
												<option selected>직책</option>
											</select>
										</div>
									</div>
								</div>
								
								<!-- 직급 -->
								<div class="row">
									<label class="col-sm-2 col-form-label text-right">
										직급
									</label>
									<div class="col-sm-5">
										<div class="form-group">
											<select class="form-control" style="color: black;"
												id="modalRank" name="r_name">
												<option selected>직급</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							</form>
							
							<div class="modal-footer" style="justify-content: flex-start;">
								<button type="button" class="btn btn-info" id="upBtn">수 정</button>
								<button type="button" class="btn btn-danger ml-2" id="delBtn">삭 제</button>
								<button type="button" class="btn ml-auto" data-dismiss="modal">닫 기</button>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
			<!-- End Content -->
		</div>
	</div>
	<script src="${path}/assets/js/core/jquery.min.js"></script>
	<script>
		$.ajax({
			type:"post",
			url:"${path}/user.do?method=data",
			data:$('#searchForm').serialize(),
				dataType:"json",
			success:function(data){
				console.log(data);
				var userList = data.userList;
				var deptList = data.deptList;
				var posList = data.posList;
				var rankList = data.rankList;
				
				/* deptList */
				var show = "";
				$.each(deptList, function(idx, dept){
					show += "<option value='"+dept.d_no+"' >"+dept.d_name+"</option>";
				})
				$('[name=d_name]').append(show);
				$('[name=d_no]').append(show);
				
				/* positionList */
				show = "";
				$.each(posList, function(idx, position){
					show += "<option value='"+position.pos_no+"'>"+position.pos_name+"</option>";
				})
				$('[name=pos_name]').append(show);
				$('[name=pos_no]').append(show);
				
				/* rankList */
				show = "";
				$.each(rankList, function(idx, rank){
					show += "<option value='"+rank.r_no+"'>"+rank.r_name+"</option>";
				})
				$('[name=r_name]').append(show);
				$('[name=r_no]').append(show);
				
				/* userList */
				show = "";
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
				$('#userList').append(show);
			},
			error:function(err){
				console.log(err);
			}
		});
	</script>
	
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
	<script>
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
						var dept = $("#modalDept option:checked").text();
						var pos = $("#modalPos option:checked").text();
						var rank = $("#modalRank option:checked").text();
						
						console.log(dept);
						console.log(pos);
						console.log(rank);
						
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
				var name = $('#inviteForm [name=u_name]').val().trim();
				
				var d_no = $('#inviteForm [name=d_no]').val();
				var pos_no = $('#inviteForm [name=pos_no]').val();
				var r_no = $('#inviteForm [name=r_no]').val();
				
				if(email==""){
					Swal.fire({
						title: '이메일을 입력하세요.',
						type: 'error',
						customClass: {
							confirmButton: 'btn'
						},
						buttonsStyling: false,
			      })
				} else if(!emailIsValid(email)){
					Swal.fire({
						title: '이메일을 형식을 확인해주세요.',
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
				} else if(name.length >= 10){
					Swal.fire({
						title: '이름을 10자이하로 입력하세요.',
						type: 'error',
						customClass: {
							confirmButton: 'btn'
						},
						buttonsStyling: false,
			      	})
				} else if(d_no=="부서") {
					Swal.fire({
						title: '부서를 입력하세요.',
						type: 'error',
						customClass: {
							confirmButton: 'btn'
						},
						buttonsStyling: false,
			      	})
				} else if(pos_no=="직책") {
					Swal.fire({
						title: '직책를 입력하세요.',
						type: 'error',
						customClass: {
							confirmButton: 'btn'
						},
						buttonsStyling: false,
			      })
				} else if(r_no=="직급") {
					Swal.fire({
						title: '직급를 입력하세요.',
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
		
		function emailIsValid (email) {
		  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
		}
	</script>
</body>

</html>