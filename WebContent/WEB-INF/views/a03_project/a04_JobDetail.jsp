<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		var pm = "${project.p_pm}";
		var user = "${sesMem.u_id}";
		if (pm != user) {
			$("#uptBtn").css("display", "none");
			$("#delBtn").css("display", "none");
		}

		$("#backBtn").on("click", function() {
			location.href = "${path}/job.do?method=list";
			return false;
		});
		
		$("[name=j_endD]").on("focusout",function(){
			if($("[name=j_endD]").val() < $("[name=j_startD]").val()){
				$("[name=j_endD]").attr("style", "border-color:red;");
				$("[name=j_endD]").val("");
			}
		})
		
		
		$("#uptBtn").on("click",function(){
			if($("[name=j_name]").val() == "") {
				$("[name=j_name]").attr("style", "border-color:red;")
				return false;
			}else if($("[name=j_content]").val() == ""){
				$("[name=j_content]").attr("style", "border-color:red; width: 99%; height: 200px;")
				return false;
			}else if($("[name=j_startD]").val() == ""){
				$("[name=j_startD]").attr("style", "border-color:red;")
				return false;
			}else if($("[name=j_endD]").val() == ""){
				$("[name=j_endD]").attr("style", "border-color:red;")
				return false;
			}else{
				if (confirm("수정하시겠습니까??")) {
					$("[name=j_refno]").removeAttr("disabled");
					$("form").attr("action", "${path}/job.do?method=update");
					$("[name=proc]").val("update");
					$("form").submit();
				};
			}
		})
		

		$("#delBtn").on("click", function() {
			if (confirm("삭제하시겠습니까??")) {
				$("form").attr("action", "${path}/job.do?method=delete");
				$("[name=proc]").val("delete");
				$("form").submit();
			}
			;
		});

		var proc = "${proc}";

		if (proc == "insert") {
			if (!confirm("등록 완료!! \n 계속 등록하시겠습니까??")) {
				location.href = "${path}/job.do?method=list";
			}
		};
		if (proc == "delete") {
			alert("삭제 완료하였습니다. 조회페이지로 이동합니다.");
			location.href = "${path}/job.do?method=list";
		};

		if (proc == "update") {
			alert("수정완료");
			location.href = "${path}/job.do?method=list";
		};
		
		$("#jobBtn").attr("class", "btn btn-primary");

	});
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
			<div class="content">

				<%@ include file="project_header.jsp"%>

				<div class="row">
					<div class="col" style="height: 600px;">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">작업 상세정보</h4>
							</div>
							<div class="card-body">
								<form method="post" class="form-horizontal">
									<input type="hidden" name="proc" />
									<div class="row">
										<label class="col-sm-2 col-form-label"> <i
											class="tim-icons icon-button-power"></i> 작업번호
										</label>
										<div class="col-sm-1">
											<div class="form-group">
												<input type="text" class="form-control" name="j_no"
													value="${jobdetail.j_no }" readonly>
											</div>
										</div>
										<label class="col-sm-1 col-form-label"> <i
											class="tim-icons icon-pin"></i> 상위작업
										</label>
										<div class="col-sm-2">
											<div class="form-group">
												<select class="selectpicker" name="j_refno"
													disabled="disabled">
													<c:if test="${jobdetail.j_refno == 0}">
														<option value="0">최상위 작업</option>
													</c:if>
													<option value="${jobdetail.j_refno}">${parentJob.j_name}</option>
												</select>
											</div>
										</div>
										<label class="col-sm-1 col-form-label"> <i
											class="tim-icons icon-paper"></i> 프로젝트명
										</label>
										<div class="col-sm-2">
											<div class="form-group">
												<select class="selectpicker" name="p_no" disabled="disabled">
													<option value="${jobdetail.p_no}">${jobdetail.j_pname}</option>
												</select>
											</div>
										</div>
										<label class="col-sm-1 col-form-label"> <i
											class="tim-icons icon-pencil"></i> 등록날짜
										</label>
										<div class="col-sm-2">
											<div class="form-group">
												<input type="text" class="form-control" readonly="readonly"
													value="${jobdetail.j_regD_s }">
											</div>
										</div>
									</div>
									<div class="row">
										<label class="col-sm-2 col-form-label"> <i
											class="tim-icons icon-pencil"></i> 작업명
										</label>
										<div class="col-sm-4">
											<div class="form-group">
												<input type="text" class="form-control" name="j_name"
													placeholder="작업명을 입력해주세요." value="${jobdetail.j_name }">
											</div>
										</div>
										<label class="col-sm-3 col-form-label"> <i
											class="tim-icons icon-pencil"></i> 수정날짜
										</label>
										<div class="col-sm-2">
											<div class="form-group">
												<input type="text" class="form-control" readonly="readonly"
													value="${jobdetail.j_uptD_s}">
											</div>
										</div>
										<label class="col-sm-2 col-form-label"> <i
											class="tim-icons icon-pencil"></i> 담당자
										</label>
										<div class="col-sm-1">
											<div class="form-group">
												<select class="selectpicker" name="u_no">
													<c:forEach var="pp" items="${people}">
														<option value="${pp.u_no}"
															<c:if test="${jobdetail.u_no eq pp.u_no}">selected</c:if>>
															${pp.u_name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<label class="col-sm-2 col-form-label">작업설명</label>
										<div class="col-sm-10">
											<div class="form-group">
												<input type="text" class="form-control"
													style="width: 99%; height: 200px;" name="j_content"
													placeholder="작업설명을 입력해주세요." value="${jobdetail.j_content }" />
											</div>
										</div>
									</div>
									<div class="row">
										<label class="col-sm-3 col-form-label">시작날짜</label>
										<div class="col-sm-2">
											<div class="form-group">
												<div class="form-group">
													<input type="text" class="form-control datepicker"
														name="j_startD" value="${jobdetail.j_startD_s }">
												</div>
											</div>
										</div>
										<label class="col-sm-5 col-form-label">종료날짜</label>
										<div class="col-sm-2">
											<div class="form-group">
												<input type="text" class="form-control datepicker"
													name="j_endD" value="${jobdetail.j_endD_s }">
											</div>
										</div>
										<label class="col-sm-2 col-form-label">완료율</label>
										<div class="col-sm-1">
											<div class="form-group">
												<select class="selectpicker" name="j_completeR">
													<c:forEach var="complete" items="${completeN }">
														<option value="${complete}"
															<c:if test="${jobdetail.j_completeR eq complete}">selected</c:if>>
															${complete*100}%</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="row" style="float: right;">
										<div class="col">
											<button class="btn" id="uptBtn">수정</button>
											<button class="btn" id="delBtn">삭제</button>
											<button class="btn" id="backBtn">되돌아가기</button>
										</div>
									</div>
								</form>
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