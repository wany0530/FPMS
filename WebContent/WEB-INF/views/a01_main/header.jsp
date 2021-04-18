<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="fileName" value="${pageContext.request.servletPath}"/>
<nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
	<div class="container-fluid">
		<div class="navbar-wrapper">
			<div class="navbar-minimize d-inline">
				<button class="minimize-sidebar btn btn-link btn-just-icon"
					rel="tooltip" data-original-title="Sidebar toggle"
					data-placement="right">
					<i class="tim-icons icon-align-center visible-on-sidebar-regular"></i>
					<i class="tim-icons icon-bullet-list-67 visible-on-sidebar-mini"></i>
				</button>
			</div>
			<div class="navbar-toggle d-inline">
				<button type="button" class="navbar-toggler">
					<span class="navbar-toggler-bar bar1"></span>
					<span class="navbar-toggler-bar bar2"></span>
					<span class="navbar-toggler-bar bar3"></span>
				</button>
			</div>
			
			<a class="navbar-brand title" href="javascript:void(0)">
				<c:choose>
					<c:when test="${fileName == '/WEB-INF/views/a01_admin/a01_dept_management.jsp'}">
						부서 관리
					</c:when>
					<c:when test="${fileName == '/WEB-INF/views/a01_admin/a02_user_management.jsp'}">
						임직원 관리
					</c:when>
				</c:choose>
			</a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navigation" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-bar navbar-kebab"></span>
			<span class="navbar-toggler-bar navbar-kebab"></span>
			<span class="navbar-toggler-bar navbar-kebab"></span>
		</button>
		<div class="collapse navbar-collapse" id="navigation">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item d-flex align-items-center">
					<div>
					 	<strong>${sesMem.u_name}</strong>
						<span id="pos">(${sesMem.pos_name})</span>
					</div>
				</li>
				<li class="dropdown nav-item">
					<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
						<div class="photo">
							<img src="${path}/${sesMem.u_img}" alt="Profile Photo"
								onerror="this.src='${path}/z04_img/defailtProfile.png';">
						</div>
						<b class="caret d-none d-lg-block d-xl-block"></b>
						<p class="d-lg-none">Log out</p>
					</a>
					<ul class="dropdown-menu dropdown-navbar">
						<li class="nav-link"><a href="${path}/profile.do"
							class="nav-item dropdown-item">프로필</a></li>
						<li class="dropdown-divider"></li>
						<li class="nav-link"><a href="${path}/zenkit.do?method=login"
							class="nav-item dropdown-item">로그아웃</a></li>
					</ul>
				</li>
				<li class="separator d-lg-none"></li>
			</ul>
		</div>
	</div>
</nav>

<script>
	var session = "${sesMem.u_name}";
	if(session == "" || session == null){
		alert("로그인 시간이 만료되었습니다. 로그인 페이지로 이동합니다.");
		location.href="${path}/zenkit.do?method=login";
	}
</script>