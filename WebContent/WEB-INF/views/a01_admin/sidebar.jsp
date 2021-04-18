<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="sidebar">
	<div class="sidebar-wrapper" style="overflow: hidden;">
		<div class="logo">
			<a href="${path}/a01_main/a01_dashboard_personal.jsp" class="simple-text logo-mini">
			<img src="${path}/a00_com/logo_symbol.png"/>
			</a> <a href="javascript:void(0)" class="simple-text logo-normal">
				Zenkit </a>
		</div>
		<ul class="nav">
			<li>
				<a href="${path}/department.do?method=form">
					<i class="tim-icons icon-vector"></i>
					<p class="title">부서 관리</p>
				</a>
			</li>
			<li>
				<a href="${path}/user.do?method=form">
					<i class="tim-icons icon-single-02"></i>
					<p class="title">임직원 관리</p>
				</a>
			</li>
		</ul>
	</div>
</div>