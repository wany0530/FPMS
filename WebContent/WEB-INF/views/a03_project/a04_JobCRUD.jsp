<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="fileName" value="${pageContext.request.servletPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<%@ include file="../a01_main/bootstrapTop.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {

		$("#jobBack").on("click", function() {
			location.href = "${path}/job.do?method=job";
		});
		$("#regBtn").on("click", function() {
			location.href = "${path}/job.do?method=insertForm";
		});
		$("[name=j_name]").keyup(function(e) {
			if (e.keyCode == 13) {
				$("#getlist").submit();
			}
		})
		$(".data").on("dblclick", function() {
			var no = $(this).attr("id");
			location.href = "${path}/job.do?method=detail&no=" + no;
		});
		$("[name=u_no]").change(function() {
			$("#getlist").submit();
		});
		$("#jobBtn").attr("class", "btn btn-primary");

		$("[name=pageSize]").change(function() {
			$("[name=curPage]").val(1);
			$("#getlist").submit();
		})

		$("option").attr("style", "color:navy;");
	});

	function goPage(page) {
		$("[name=curPage]").val(page);
		$("form").submit();
	};
</script>
<style>
#tableData th {
	text-align: center;
}

#tableData td {
	text-align: center;
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

				<!--  -->
				<div class="row">
					<div class="col" style="height: 600px;">
						<div class="col-md-8 ml-auto mr-auto">
							<h2 class="text-center">작업 관리</h2>
						</div>
						<form:form modelAttribute="sch" method="post" id="getlist">
							<form:hidden path="curPage" />
							<div class="card" style="padding: 10px; display: flex;">
								<div id="jobH" class="row">
									<div class="col">
										<button class="btn btn-primary btn-round" disabled>총
											${sch.count}건</button>
									</div>
									<div class="form-group">
										<form:select class="selectpicker" path="u_no">
											<form:option value="">전체</form:option>
											<c:forEach var="pp" items="${people}">
												<form:option value="${pp.u_no}">${pp.u_name}</form:option>>
										</c:forEach>
										</form:select>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<form:input type="text" class="form-control" path="j_name"
												placeholder="작업명을 입력해주세요." />
										</div>
									</div>
									<div class="col" align="right">
										<span style="font-size: 10pt; color: white; margin: 0px 10px;">페이지
											크기</span> <label> <form:select path="pageSize"
												items="${pageO }" class="form-control" /> <%-- <select class="custom-select" name="pageSize">
												<c:forEach var="page" items="${pageO }">
													<option value="${page}" style="color:navy"
													<c:if test="${pageSize.val eq page}">selected</c:if>
													>${page}</option>
												</c:forEach>
											</select> --%>
										</label>
									</div>
								</div>

								<table class="table table-striped" id="tableData">
									<thead>
										<tr>
											<th width="10%">작업번호</th>
											<th width="30%" style="text-align: left">작업명</th>
											<th width="10%">프로젝트명</th>
											<th width="15%">시작날짜</th>
											<th width="15%">종료날짜</th>
											<th width="10%">담당자</th>
											<th width="10%">완료율</th>
										</tr>
									</thead>
									<tbody id="list">
										<jsp:useBean id="today" class="java.util.Date" />
										<fmt:parseNumber value="${today.time/(1000*60*60*24)}"
											integerOnly="true" var="toFmt" />
										<c:forEach var="job" items="${joblist }">
											<fmt:parseNumber value="${job.j_regD.time/(1000*60*60*24)}"
												integerOnly="true" var="crFmt" />
											<tr class="data" id="${job.j_no}">
												<td>${job.cnt }</td>
												<td style="text-align: left"><c:forEach varStatus="sts"
														begin="1" end="${job.level }">
														<c:if test="${job.j_refno>1}">&nbsp;</c:if>
														<c:if test="${job.j_refno>1 and sts.last }">
														┗
													</c:if>
													</c:forEach>${job.j_name } <c:if test="${toFmt == crFmt }">
														<span class="badge badge-danger">New</span>
													</c:if></td>
												<td>${job.j_pname }</td>
												<td>${job.j_startD_s }</td>
												<td>${job.j_endD_s }</td>
												<td>${job.j_charger }</td>
												<td>
													<div class="progress-container" style="padding-top: 4px;">
														<div class="progress">
															<div class="progress-bar" role="progressbar"
																aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
																style="width: ${job.j_completeR *100}%;">
																<span class="progress-value">${job.j_completeR *100}%</span>
															</div>
														</div>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<ul class="pagination justify-content-center" style="bottom: 0;">
									<li class="page-item"><input type="hidden"
										value="${sch.startBlock}" id="hehe" /> <a class="page-link"
										href="javascript:goPage(${sch.curPage-1})">&lt;&lt;</a></li>
									<c:forEach var="cnt" begin="${sch.startBlock }"
										end="${sch.endBlock}">
										<li class="page-item ${sch.curPage == cnt?'active':''}"><a
											class="page-link" href="javascript:goPage(${cnt })">${cnt }</a></li>
									</c:forEach>
									<li class="page-item"><a class="page-link"
										href="javascript:goPage(${sch.curPage+1})">&gt;&gt;</a></li>
								</ul>
							</div>
						</form:form>
						<div align="right" style="margin-right: 10px;">
							<button class="btn" id="regBtn">등록</button>
							<button class="btn" id="jobBack">이전 페이지</button>
						</div>
					</div>
				</div>
				<!-- End Content -->
			</div>
		</div>
	</div>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
</body>

</html>