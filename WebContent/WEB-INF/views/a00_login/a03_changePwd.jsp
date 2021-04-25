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
							<div class="card-header">
								<img src="${path}/${sesMem.u_img}" alt="Profile Photo"
								onerror="this.src='${path}/z04_img/defailtProfile.png';">
							</div>
							<div class="card-body">
								<h4 class="card-title">${sesMem.u_name}</h4>
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="tim-icons icon-key-25"></i>
										</div>
									</div>
									<input type="password" class="form-control" placeholder="Password"
										id="inPwd">
								</div>
							</div>
							<div class="card-footer">
								<button class="btn btn-primary btn-round btn-lg" id="unlockBtn">
									확인
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
		$('#unlockBtn').on("click", function(){
			var u_pass = "${sesMem.u_pass}";
			if(u_pass == $('#inPwd').val()){
				location.href="${path}/pwdSuccForm.do";
			} else {
				Swal.fire({
					position: 'center',
					type: 'error',
					title: '비밀번호가 일치하지 않습니다.',
					showConfirmButton: false,
					timer: 1500
				})
			}
		});
	</script>
</body>
</html>