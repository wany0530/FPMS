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
<html lang="kor">

<head>
<%@ include file="../a01_main/bootstrapTop.jsp"%>
</head>


<body class="login-page">

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent fixed-top">

		<!-- nav -->
		<div class="collapse navbar-collapse pt-4" id="navigation">
			<ul class="navbar-nav align-items-center w-100">
				
				<!-- 홈 -->
				<li class="nav-item">
					<h2 class="m-2 title">
						<a href="${path}/zenkit.do?method=login" class="text-primary">
							<strong><spring:message code="home"/></strong>
						</a>
					</h2>
				</li>
				
				<!-- 제목 -->
				<li class="nav-item">
					<h2 class="m-2">
						<spring:message code="pwdFindTitle"/>
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
						<div class="card card-login card-white">
							<div class="card-header pb-5" style="height: 200px;">
								<img src="${path}/assets/img/card-primary.png" alt="">
								<h1 class="card-title m-3" style="font-size: 50px;">
									<spring:message code="pwdFindTitle" />
								</h1>
							</div>
							<div class="card-body pb-0">
							
								<form method="post" class="form" id="findForm"
									action="${path}/findPwd.do">
								<!-- 사번 입력 -->
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="tim-icons icon-badge"></i>
										</div>
									</div>
									<input type="text" name="u_id" class="form-control"
										placeholder="<spring:message code='id'/>">
								</div>
								
								<!-- 이메일 입력 -->
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="tim-icons icon-email-85"></i>
										</div>
									</div>
									<input type="email" name="u_email" class="form-control"
										placeholder="exam@gmail.com">
								</div>
								</form>
								
								<!-- 전송 버튼 -->
								<div class="row pl-3 pr-3">
									<button class="btn btn-primary btn-lg btn-block"
										id="transBtn">
										<spring:message code="pwdFindBtn" />
									</button>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
	<script>
	
		// 다국어 처리
		$("#selectLan").val("${param.lang}");
		$("#selectLan").change(function(){
			if($(this).val()!=""){
				location.href="${path}/choiceLan1.do?lang="+$(this).val();
			}
		});
		
		// 전송버튼 클릭 (validation 체크)
		$('#transBtn').on("click",function(){
			var u_id = $('[name=u_id]');
			var u_email = $('[name=u_email]');
			
			if(u_id.val() == ""){
				Swal.fire({
					position: 'center',
					type: 'warning',
					title: '<spring:message code="idvalidation" />',
					showConfirmButton: false,
					timer: 1500
				});
			} else if(u_email.val() == "") {
				Swal.fire({
					position: 'center',
					type: 'warning',
					title: '<spring:message code="mailvalidation" />',
					showConfirmButton: false,
					timer: 1500
				});
			} else {
				$('#findForm').submit();
			}
		});
		
		// 유저 정보 확인
		var userInfo = "${userInfo}";
		
		if(userInfo == 'N'){
			Swal.fire({
				position: 'center',
				type: 'warning',
				title: '<spring:message code="userInfo" />',
				showConfirmButton: false,
				timer: 1500
			});
		} else if(userInfo == 'Y'){
			Swal.fire({
				position: 'center',
				type: 'success',
				title: '<spring:message code="sendMsg" />',
				showConfirmButton: false,
				timer: 1500
			});
		}
			
	</script>
</body>

</html>