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
		#projectRow:hover {
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
						<div class="card" style="height:700px;">
							<div class="card-header mb-1">
								<h4 class="title">프로젝트 등록 정보</h4>
							</div>
							<div class="card-body mb-0">
								<form method="post" class="form-horizontal" id="regForm">

									<!-- 프로젝트 명 -->
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">프로젝트 명 *</label>
										<div class="col-sm-10">
											<div class="form-group">
												<input type="text" class="form-control" name="p_name">
											</div>
										</div>
									</div>
									
									<!-- 부서 -->
									<div class="row mb-1">
										<label class="col-sm-2 col-form-label">부서명 *</label>
										<div class="col-sm-3">
											<div class="form-group">
												<select class="selectpicker" data-size="7" name="d_no"
													data-style="btn btn-primary" title="Single Select">
													<option disabled selected>담당 부서를 선택하세요.</option>
												</select>
											</div>
										</div>
									</div>

									<!-- 프로젝트 관리자 -->
									<div class="row mb-1">
										<label class="col-sm-2 col-form-label">프로젝트 관리자 *</label>
										<div class="col-sm-3">
											<div class="form-group">
												<input type="text" class="form-control" name="p_pm"
													value="${sesMem.u_id}" readonly="readonly"
													style="color: gray;">
											</div>
										</div>
									</div>

									<!-- 시작날짜 -->
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">시작 날짜 *</label>
										<div class="col-sm-3">
											<div class="form-group">
												<input type="text" class="form-control datepicker"
													value="${startDay}" name="p_startD">
											</div>
										</div>

									</div>
									<!-- 종료날짜 -->
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">종료 날짜 *</label>
										<div class="col-sm-3">
											<div class="form-group">
												<input type="text" class="form-control datepicker"
													value="${endDay}" name="p_endD">
											</div>
										</div>
									</div>

									<!-- 프로젝트 설명 -->
									<div class="row">
										<label class="col-sm-2 col-form-label">설명</label>
										<div class="col-sm-10">
											<div class="form-group">
												<textarea class="form-control" rows="10" cols=""
													name="p_content" id="p_content"
													style="max-height: 200px;
													border-top: 1px solid #2b3553;"></textarea>
											</div>
										</div>
									</div>
									
								</form>
							</div>
							<div class="card-footer text-right">
								<button type="submit" class="btn btn-primary" id="regBtn">
									<i class="tim-icons icon-check-2"></i> 저장
								</button>
								<button type="button" class="btn ml-2"
									onclick="location.href='${path}/project.do?method=form'">
									<i class="tim-icons icon-simple-remove"></i> 취소
								</button>
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
	var d_no = "${sesMem.d_no}";
	// 프로젝트 리스트 읽어오기
	$.ajax({
		type:"post",
		url:"${path}/user.do?method=model",
		dataType:"json",
		success:function(data){
			console.log(data);
			var deptList = data.deptList;
			
			/* deptList */
			var show = "";
			$.each(deptList, function(idx, dept){
				show += "<option value='"+dept.d_no+"'>"+dept.d_name+"</option>";
			});
			$('[name="d_no"]').append(show).val(d_no);
			console.log(d_no);
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
			// 등록버튼
			$("#regBtn").on("click",function(){
				var p_name = $('[name=p_name]').val();
				var d_no = $('[name=d_no]').val();
				var p_pm = $('[name=p_pm]').val();
				var p_startD = $('[name=p_startD]').val();
				var p_content = $('[name=p_content]').val();
				
				if(p_name == "" || p_name == null){
					Swal.fire({
						title: '프로젝트명을 입력하세요.',
						customClass: {
							confirmButton: 'btn btn-danger'
						},
						buttonsStyling: false
					})
				} else if (d_no == "" || d_no == null) {
					Swal.fire({
						title: '부서를 선택하세요.',
						customClass: {
							confirmButton: 'btn btn-danger'
						},
						buttonsStyling: false
					})	
				} else if (p_startD == "" || p_startD == null) {
					Swal.fire({
						title: '날짜를 선택하세요.',
						customClass: {
							confirmButton: 'btn btn-danger'
						},
						buttonsStyling: false
					})
				} else {
					$('#regForm').submit();
				}
			});
			
			// 등록확인
			var regSucc = "${regSucc}";
			if(regSucc == "등록완료") {
				const swalWithBootstrapButtons = Swal.mixin({
					customClass: {
						confirmButton: 'btn btn-success',
						cancelButton: 'btn btn-danger'
					},
					buttonsStyling: false
				})
				swalWithBootstrapButtons.fire({
					title: '프로젝트 등록완료',
					text: "조회화면으로 이동하시겠습니까?",
					type: 'warning',
					showCancelButton: true,
					confirmButtonText: '예',
					cancelButtonText: '아니오',
					reverseButtons: true
				}).then((result) => {
					if (result.value) {
						location.href="${path}/project.do?method=form";
					} else {
						location.href="${path}/project.do?method=regForm";
					}
				})
			}
		});
	</script>
</body>

</html>