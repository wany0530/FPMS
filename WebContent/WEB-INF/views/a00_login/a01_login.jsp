<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="../a01_main/bootstrapTop.jsp"%>
</head>


<body class="login-page">

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent fixed-top">

		<!-- nav -->
		<div class="collapse navbar-collapse pt-4" id="navigation">
			<ul class="navbar-nav align-items-center w-100">

				<!-- 제목 -->
				<li class="nav-item">
					<h2 class="m-2">
						<spring:message code="title" />
					</h2>
				</li>

				<!-- 다국어 -->
				<li class="nav-item ml-auto" style="width: 200px;">
					<select class="selectpicker m-0 w-100" id="selectLan">
						<option value=""><spring:message code="chlang" /></option>
						<option value="ko"><spring:message code="ko" /></option>
						<option value="en"><spring:message code="en" /></option>
					</select>
				</li>

			</ul>
		</div>
		<!-- End of nav -->
	</nav>
	<!-- End Navbar -->

	<div class="wrapper wrapper-full-page ">
		<div class="full-page login-page ">
			<!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->
			<div class="content">
				<div class="container">
					<div class="col-lg-4 col-md-6 ml-auto mr-auto">
						<form method="post" class="form"
							action="${path}/zenkit.do?method=login">
							<div class="card card-login card-white">
								<div class="card-header">
									<img src="${path}/assets/img/card-primary.png" alt="">
									<h1 class="card-title m-3">
										<spring:message code="cardtitle" />
									</h1>
								</div>
								<div class="card-body pb-0">
								
									<!-- 아이디 입력 -->
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="tim-icons icon-single-02"></i>
											</div>
										</div>
										<input type="text" name="u_id" class="form-control"
											placeholder="<spring:message code='id'/>">
									</div>
									
									<!-- 비밀번호 입력 -->
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="tim-icons icon-lock-circle"></i>
											</div>
										</div>
										<input type="password" name="u_pass" class="form-control"
											placeholder="<spring:message code='pwd'/>">
									</div>
									
									<!-- 비밀번호 찾기 버튼 -->
									<div class="row pl-3 pr-4 mb-2 justify-content-end">
										<a href="${path}/findPwd.do" class="text-primary form-input">
											<spring:message code="pwdFind"/>
										</a>
									</div>
									
									<!-- 로그인 버튼 -->
									<div class="row pl-3 pr-3">
										<button type="submit"
											class="btn btn-primary btn-lg btn-block">
											<spring:message code="cardtitle" />
										</button>
									</div>
									
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
	<script>
 $(document).ready(function(){
		var loginSucc="${loginSucc}";
		if(loginSucc=="Y"){
			const swalWithBootstrapButtons = Swal.mixin({
				customClass: {
					confirmButton: 'btn btn-success'
				},
				buttonsStyling: false
				})
				swalWithBootstrapButtons.fire({
					title: '<spring:message code="pass" />',
					text: '<spring:message code="passmsg" />',
					type: 'success',
					confirmButtonText: '<spring:message code="confirm" />'
				}).then((result) => {
				if (result.value) {
					$(location).attr("href","${path}/dashboard.do?method=personalList");
				}
			})
		}
		if(loginSucc=="N"){
			const swalWithBootstrapButtons = Swal.mixin({
				customClass: {
					confirmButton: 'btn btn-warning'
				},
				buttonsStyling: false
				})
				swalWithBootstrapButtons.fire({
					title: '<spring:message code="fail" />',
					text: '<spring:message code="failmsg" />',
					type: 'warning',
					confirmButtonText: '<spring:message code="confirm" />'
				}).then((result) => {
				if (result.value) {
					$("[name=id]").focus();
				}
			})
		}
		
		$("#selectLan").val("${param.lang}");
		$("#selectLan").change(function(){
			if($(this).val()!=""){
				location.href="${path}/choiceLan.do?lang="+$(this).val();
			}
		});
  });
 
 </script>
</body>

</html>