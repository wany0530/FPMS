<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<%@ include file="../a01_main/bootstrapTop.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#jobCRUD").on("click",function(){
			location.href="${path}/job.do?method=list";
		});
	});
</script>
<style>
html, body {
	/* height: 100%;
	padding: 0px;
	margin: 0px;
	overflow: hidden; */
	
}
</style>
</head>
<body class="sidebar-mini ">
	<div class="wrapper">

		<%@ include file="../a01_main/sidebar.jsp"%>

		<div class="main-panel">

			<%@ include file="../a01_main/header.jsp"%>

			<!-- Start Content -->
			<div class="content" style="width: 100%; height: 100%;">

				<%@ include file="project_header.jsp"%>

				<div class="row">
					<div class="col" style="height: 700px;">
						<div class="card" style="width: 100%; height: 100%;">
							<%@ include file="a04_gantt.jsp"%>
							<div align="right" style="margin-top: 10px; margin-right: 10px;">
								<button class="btn" id="jobCRUD">작업관리</button>
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
</body>
</html>