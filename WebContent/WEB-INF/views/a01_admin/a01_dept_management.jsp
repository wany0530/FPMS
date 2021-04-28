<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../a01_main/bootstrapTop.jsp"%>
	<style>
		.dept-item {
			padding: 10px;
		}
		.dept-item:hover {
			background: #1E1E28;
			cursor: pointer;
		}
	</style>
</head>
</head>
<body class="sidebar-mini ">
	<div class="wrapper">

		<%@ include file="../a01_main/sidebar.jsp"%>

		<div class="main-panel">
			
			<%@ include file="../a01_main/header.jsp"%>

			<!-- Start Content -->
			<div class="content">

				<div class="row">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-4">
									<div class="card mb-2">
										<div class="card-header">
											<div class="row">
												<div class="col-6">
													<h5 class="title">부서 리스트</h5>	
												</div>
												<div class="col-6 text-right">
													<button class="btn btn-link btn-danger" id="delBtn">
														삭제
													</button>
												</div>
											</div>
										</div>
										<div class="card-body ml-2 mb-0" style="height: 600px;
											border: 1px solid #40556f; overflow: auto;">
											<ul class="list-unstyled p-2 dept-list">
												<c:forEach var="dept" items="${deptList}">
													<li class="dept-item">${dept.d_name}</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="card">
										<div class="card-header">
											<h5 class="title">부서 정보</h5>
										</div>
										<form:form modelAttribute="dept" class="form-horizontal" 
												method="post" action="${path}/department.do?method=insert" >
										<div class="card-body">
											<!-- 부서 명 -->
											<div class="row mb-3">
												<label class="col-sm-2 col-form-label">부서 명 *</label>
												<div class="col-sm-10">
													<div class="form-group">
														<form:input path="d_name" class="form-control" id="d_name"
															placeholder="부서명을 입력하세요.." type="text"/>
													</div>
												</div>
											</div>
											
										</div>
										</form:form>
											
										<div class="card-footer text-right">
											<button class="btn btn-primary" onclick="insert()">
												<i class="tim-icons icon-simple-add"></i> 추가
											</button>
										</div>
									</div>
									
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
		function insert(){
			console.log($('#d_name').val().trim().length);
			if($('#d_name').val().trim() == ""){
				Swal.fire({
					title: '부서명을 입력하세요.',
					customClass: {
						confirmButton: 'btn btn-info'
					},
					buttonsStyling: false
				})
			} else if($('#d_name').val().trim().length >= 10){
				Swal.fire({
					title: '부서명을 10자 이하으로 입력해 주세요.',
					customClass: {
						confirmButton: 'btn btn-info'
					},
					buttonsStyling: false
				})
			} else {
				const swalWithBootstrapButtons = Swal.mixin({
					customClass: {
						confirmButton: 'btn btn-success',
						cancelButton: 'btn btn-danger'
					},
					buttonsStyling: false
			      })
			      swalWithBootstrapButtons.fire({
						title: '부서를 추가하시겠습니까?',
						text: "",
						type: 'info',
						showCancelButton: true,
						confirmButtonText: '추가',
						cancelButtonText: '취소',
						reverseButtons: true
					}).then((result) => {
						if (result.value) {
							var isDept = false;
							$('.dept-item').each(function(idx, dept){
								console.log($(this).text());
								if($(this).text() == $('#d_name').val()){
									isDept = true;
									return false;
								}
							});
							if(isDept == true){
								swalWithBootstrapButtons.fire(
				            	'실패',
					            '존재하는 부서입니다.',
					            'error'
					          )
					          $('#d_name').val("");
							} else {
								$('form').submit();
							}
						} else {
							$('#d_name').val("");
						}
					})
			}
		}
	</script>
	<script>
		$(document).ready(function() {
			$("#d_name").keydown(function(evt){ 
				if (evt.keyCode == 13){
					insert();
					return false;
				}
			});

			var selectDept = "";
			$('.dept-item').on('click', function(){
				$('.dept-item').css("background", "#26293D");
				selectDept = $(this).text();
				$(this).css("background", "#1E1E28");
			})
			console.log("${isDel}");
			$('#delBtn').on('click', function(){
				if(selectDept.trim() != "" && selectDept.trim() != "부서없음"){
					const swalWithBootstrapButtons = Swal.mixin({
						customClass: {
							confirmButton: 'btn btn-danger',
							cancelButton: 'btn'
						},
						buttonsStyling: false
				      })
				      swalWithBootstrapButtons.fire({
							title: selectDept+'부서를 삭제하시겠습니까?',
							text: "",
							type: 'warning',
							showCancelButton: true,
							confirmButtonText: '삭제',
							cancelButtonText: '취소',
							reverseButtons: true
						}).then((result) => {
							if (result.value) {
								console.log(selectDept);
								location.href="${path}/department.do?method=delete&d_name="+selectDept;								
							} else {
								$('#d_name').val("");
							}
						})
					
				}	
			})
			
		});
	</script>
</body>
</html>