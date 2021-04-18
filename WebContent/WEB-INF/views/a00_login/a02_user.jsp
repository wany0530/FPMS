<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html lang="kor">
<head>
<%@ include file="../a01_main/bootstrapTop.jsp"%>
</head>

<body class="sidebar-mini ">
	<div class="wrapper">
		<%@ include file="../a01_main/sidebar.jsp"%>
		<div class="main-panel">
			
			<%@ include file="../a01_main/header.jsp"%>
			
			<div class="content">
				<div class="row">
					<div class="col-md-5">
						<div class="card card-user">
						
							<form method="post" enctype="multipart/form-data" id="profileForm">
							<input type="hidden" value="${sesMem.u_id}" name="u_id"/>
							<input type="hidden" value="${sesMem.u_img}" name="currImg"/>
							<div class="card-body">
							
								<!-- 유저이름 -->
								<p class="card-text">
									<div class="author">
										<div class="block block-one"></div>
										<div class="block block-two"></div>
										<div class="block block-three"></div>
										<div class="block block-four"></div>
										<img class="avatar" src="${path}/${sesMem.u_img}" alt="..."
											onerror="this.src='${path}/z04_img/defailtProfile.png'">
										<h3 class="title mb-2">
											${sesMem.u_name} ${sesMem.r_name}
										</h3>
										<h4 class="title">${sesMem.d_name}</h4>
									</div>
								</p>
								
								<!-- 사원번호 -->
								<div class="row justify-content-center">
									<label class="col-sm-2 col-form-label text-right title">
										사원번호
									</label>
									<div class="col-sm-8">
										<div class="form-group">
											<input type="text" class="form-control" disabled 
		                        		value="${sesMem.u_id}" style="color: gray;">
										</div>
									</div>
								</div>
								
								<!-- 직책 -->
								<div class="row justify-content-center">
									<label class="col-sm-2 col-form-label text-right title">
										직책
									</label>
									<div class="col-sm-8">
										<div class="form-group">
											<input type="text" class="form-control" disabled
		                        		value="${sesMem.pos_name}" style="color: gray;">
										</div>
									</div>
								</div>
								
								<!-- 이메일 -->
								<div class="row justify-content-center">
									<label class="col-sm-2 col-form-label text-right title">
										이메일
									</label>
									<div class="col-sm-8">
										<div class="form-group">
											<input type="email" class="form-control" name="u_email"
		                        		value="${sesMem.u_email}" placeholder="exam@gmail.com">
										</div>
									</div>
								</div>
								
								<!-- 핸드폰 -->
								<div class="row justify-content-center">
									<label class="col-sm-2 col-form-label text-right title">
										핸드폰
									</label>
									<div class="col-sm-8">
										<div class="form-group">
											<input type="text" class="form-control" name="u_phone"
		                        		value="${sesMem.u_phone}">
										</div>
									</div>
								</div>
								
								<!-- 프로필 이미지 -->
								<div class="row justify-content-center">
									<label class="col-sm-2 col-form-label text-right title">
										프로필 변경
									</label>
									<div class="col-sm-8">
										<div class="form-control" style="overflow: hidden;">
											<input type="file" id="profileFile" accept="image/png, image/jpeg"
												name="u_img" placeholder="jpg, png">
										</div>
									</div>
								</div>
								
							</div>
							<!-- end of card-body -->
							</form>
							
							<div class="card-footer">
								<div class="row justify-content-end mr-5 mb-2">
									<button class="btn btn-fill btn-primary" id="modifyBtn">
										수 정
									</button>
								</div>
							</div>
							
						</div>
						<!-- end of card-user -->
					</div>
					<!-- end of col -->
				</div>
				<!-- end of row -->
			</div>
			<!-- end of content -->
		</div>
		<!-- end of main panel -->
	</div>
	<!-- end of wrapper -->
	
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
	<script>
		$('#modifyBtn').on("click",function(){
			const swalWithBootstrapButtons = Swal.mixin({
				customClass: {
					confirmButton: 'btn btn-success',
					cancelButton: 'btn btn-danger'
				},
				buttonsStyling: false
				})
		      swalWithBootstrapButtons.fire({
					title: '정말 수정하시겠습니까?',
		       	text: "프로필 이미지 변경은 약간의 시간을 소요합니다.",
		       	type: 'warning',
		       	showCancelButton: true,
		       	confirmButtonText: '수정',
					cancelButtonText: '취소',
					reverseButtons: true
		      }).then((result) => {
				if (result.value) {
					$('#profileForm').submit();       
				} 
	      })
		});
	</script>
</body>
</html>