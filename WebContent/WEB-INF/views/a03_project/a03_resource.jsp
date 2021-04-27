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
.deptPerson-item:hover, .resource-item:hover
{ background: #1E1E28; cursor: pointer; }
</style>
</head>
<body class="sidebar-mini ">
	<div class="wrapper">

		<%@ include file="../a01_main/sidebar.jsp"%>

		<div class="main-panel">
		
			<%@ include file="../a01_main/header.jsp"%>

			<!-- Start Content -->
			<div class="content">

				<%@ include file="project_header.jsp"%>

				<div class="row">
					<div class="col-5">
						<div class="card card-tasks">
							<div class="card-header">
								<h4 class="title">참여인원</h4>
							</div>
							<div class="card-body">
								<div class="table-full-width table-responsive"
									style="overflow: auto; max-height: 380px;">
									
									<form method="post" id="memberForm">
									<input type="hidden" value="" name="u_no" id="select-member"/>
									<input type="hidden" value="" name="btnState"/>
									<table class="table text-center">
										<thead>
											<tr>
												<th>이름</th>
												<th>직책</th>
												<th>직급</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="resource" items="${resourceList}">
												<tr class="resource-item">
													<td>${resource.u_name}</td>
													<td>${resource.pos_name}</td>
													<td>${resource.r_name}</td>
												</tr>
												<input type="hidden" value="${resource.u_no}" >
											</c:forEach>
										</tbody>
									</table>
									</form>
									
								</div>
							</div>
						</div>
					</div>

					<div class="col-2 text-center d-flex align-items-center">
						<div class="">
							<button class="btn btn-info" id="addBtn">
								<i class="tim-icons icon-double-left"></i> 추가
							</button>
							<button class="btn btn-warning" id="delBtn">
								<i class="tim-icons icon-simple-remove"></i> 삭제
							</button>
						</div>
					</div>

					<div class="col-5">
						<div class="card card-tasks">
							<div class="card-header">
								<h4 class="title">부서 전체 인원</h4>
							</div>
							<div class="card-body">
								<div class="table-full-width table-responsive"
									style="overflow: auto; max-height: 380px;">
									
									<form method="post" id="deptPersonForm">
									<input type="hidden" value="" name="u_no" id="select-deptUser"/>
									<input type="hidden" value="" name="btnState"/>
									<table class="table text-center">
										<thead>
											<tr>
												<th>이름</th>
												<th>직책</th>
												<th>직급</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="deptPerson" items="${deptPersonList}">
												<tr class="deptPerson-item">
													<td>${deptPerson.u_name}</td>
													<td>${deptPerson.pos_name}</td>
													<td>${deptPerson.r_name}</td>
												</tr>
												<input type="hidden" value="${deptPerson.u_no}" >
											</c:forEach>
										</tbody>
									</table>
									</form>
									
								</div>
							</div>
						</div>
					</div>
				</div>
					
				
			</div>
			<!-- End Content -->

		</div>
	</div>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
	<script>
		
		// 초대 할 인원 선택
		var selectPerson = "";
		$(".deptPerson-item").on("click", function(){
			$(".deptPerson-item").css("background", "#26293D");
			selectPerson = $(this).children().eq(0).text();
			$("#select-deptUser").val(selectPerson);
			selectU_no = $(this).next().val();
			console.log(selectU_no);
			$(this).css("background", "#1E1E28");
			$("#select-deptUser").val(selectU_no);
		});
		
		// 제거 할 인원 선택
		var selectMember = "";
		var selectMemberPos = "";
		var selectU_no = "";
		$(".resource-item").on("click", function(){
			$(".resource-item").css("background", "#26293D");
			selectMember = $(this).children().eq(0).text();
			selectMemberPos = $(this).children().eq(1).text();
			selectU_no = $(this).next().val();
			console.log(selectU_no);
			$("#select-member").val(selectU_no);
			
			$(this).css("background", "#1E1E28");
		});
		
		// 추가 버튼
		$('#addBtn').on("click", function(){
			if(selectPerson.trim() == ""){
				Swal.fire({
					position: 'center',
					type: 'error',
					title: '초대할 인원을 선택하세요.',
					showConfirmButton: false,
					timer: 1500
				});
			} else {
				$('[name=btnState]').val('add');
				$('#deptPersonForm').submit();
			}
		});
		
		// 삭제 버튼
		$('#delBtn').on("click", function(){
			if(selectMember.trim() == ""){
				Swal.fire({
					position: 'center',
					type: 'error',
					title: '삭제할 인원을 선택하세요.',
					showConfirmButton: false,
					timer: 1500
				});
			} else if(selectMemberPos.trim() == 'PM'){
				Swal.fire({
					position: 'center',
					type: 'error',
					title: '프로젝트 매니저(PM)는 삭제할 수 없습니다.',
					showConfirmButton: false,
					timer: 1500
				});			
			} else {
				$.ajax({
					type:"post",
					url:"${path}/project.do?method=jobCnt&u_no="+selectU_no,
					dataType:"json",
					success:function(data){
						console.log(data);
						var jobCnt = data.jobCnt;
						if(jobCnt != 0){
							const swalWithBootstrapButtons = Swal.mixin({
								customClass: {
									confirmButton: 'btn btn-warning'
								},
								buttonsStyling: false
								})
								swalWithBootstrapButtons.fire({
									title: '담당 중인 '+jobCnt+'건이 작업이 존재합니다.',
									text: '해당 작업은 담당자가 PM으로 변경됩니다.',
									type: 'warning',
									confirmButtonText: '확인'
								}).then((result) => {
								if (result.value) {
									// 담당자가 없어진 작업은 PM으로 변경
									$.ajax({
										type:"post",
										url:"${path}/project.do?method=updateManager&u_no="+selectU_no,
										dataType:"json",
									});
									$('[name=btnState]').val('del');
									$('#memberForm').submit();
								}
							})
						} else {
							$('[name=btnState]').val('del');
							$('#memberForm').submit();
						}
					},
					error:function(err){
						console.log(err);
					}
				});
			
			}
		});
		
	</script>
</body>

</html>