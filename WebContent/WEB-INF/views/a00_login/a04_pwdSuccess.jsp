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
				<div class="container">
					<div class="col-lg-4 col-md-6 ml-auto mr-auto">
						<div class="card card-lock card-white text-center">
						
							<form method="post" id="upForm">
							<div class="card-body pb-0">
							
								<!-- new password -->
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="tim-icons icon-key-25"></i>
										</div>
									</div>
										<input type="password" class="form-control" placeholder="New Password"
											id="newPwd" name="newPwd">
								</div>
								
								<!-- confirm password -->
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="tim-icons icon-key-25"></i>
										</div>
									</div>
									<input type="password" class="form-control" placeholder="Confirm Password"
										id="confirmPwd" name="confirmPwd">
								</div>
								
							</div>
							</form>
							
							<div class="card-footer pt-0">
								<button class="btn btn-primary btn-round btn-lg" id="changeBtn">
									비밀번호 변경
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
		<!-- end of main panel -->
	</div>
	<!-- end of wrapper -->

	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
	<script>
		
		$('#changeBtn').on("click", function(){
			var newPwd =  $('#newPwd').val();
			var confirmPwd =  $('#confirmPwd').val();
			
			if(newPwd < 8){
				Swal.fire({
					position: 'center',
					type: 'error',
					title: '패스워드를 8자 이상 설정해 주세요.',
					showConfirmButton: false,
					timer: 1500
				})
			} else if(newPwd != confirmPwd){
				Swal.fire({
					position: 'center',
					type: 'error',
					title: '비밀번호와 비밀번호 확인이 일치하여야 합니다.',
					showConfirmButton: false,
					timer: 1500
				})
			} else {
				$("#upForm").submit();
			}
		});
		
		var change = "${change}";
		if(change == 'Y'){
			const swalWithBootstrapButtons = Swal.mixin({
				customClass: {
					confirmButton: 'btn btn-success'
				},
				buttonsStyling: false
				})
				swalWithBootstrapButtons.fire({
					title: '비밀번호 변경이 완료되었습니다.',
					text: '로그인 페이지로 이동합니다.',
					type: 'success',
					confirmButtonText: '확'
				}).then((result) => {
				if (result.value) {
					location.href="${path}/zenkit.do?method=login";
				}
			})
		}
		
	</script>
</body>
</html>