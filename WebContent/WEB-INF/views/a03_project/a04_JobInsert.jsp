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
	
</script>
<style>
#tableData th {
	text-align: center;
}

#tableData td {
	text-align: center;
}
</style>
<script>
	$(document).ready(function() {
		
		var pm = "${project.p_pm}";
		var user = "${sesMem.u_id}";
		if(pm != user){
			alert("작업 등록 권한이 없습니다. \n조회페이지로 이동하겠습니다.");
			location.href="${path}/job.do?method=list";
		}
		
		$("#backpage").on("click",function(){
			location.href="${path}/job.do?method=list";
			return false;
		});
		
		$("[name=j_name]").keyup(function(event){
			if($("[name=j_name]").val().length > 0){
				$("[name=j_name]").attr("style", "border-color:none;");
			}else{
				$("[name=j_name]").attr("style", "border-color:red;");
			}
		});
		
		$("[name=j_content]").keyup(function(event){
			if($("[name=j_content]").val().length > 0){
				$("[name=j_content]").attr("style", "border-color:none; width: 99%; height: 200px;");
			}else{
				$("[name=j_content]").attr("style", "border-color:red; width: 99%; height: 200px;");
			}
		});
		
		$("[name=j_startD]").focusout(function(event){
			if($("[name=j_startD]").val().length > 0){
				$("[name=j_startD]").attr("style", "border-color:none;");
			}else{
				$("[name=j_startD]").attr("style", "border-color:red;");
			}
		});
		
		$("[name=j_endD]").focusout(function(event){
			if($("[name=j_endD]").val().length > 0){
				$("[name=j_endD]").attr("style", "border-color:none;");
			}else{
				$("[name=j_endD]").attr("style", "border-color:red;");
			}
		});
		
		$("#regBtn").on("click",function(){
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
				$("form").submit();	
			}
		})
		
		$("[name=j_endD]").on("focusout",function(){
			if($("[name=j_endD]").val() < $("[name=j_startD]").val()){
				$("[name=j_endD]").attr("style", "border-color:red;");
				$("[name=j_endD]").val("");
			}
		})
		
		var proc="${proc}";
		
		if(proc == "insert"){
			if(!confirm("등록 완료!! \n 계속 등록하시겠습니까??")){
				location.href="${path}/job.do?method=list";	
			}else{
				location.href="${path}/job.do?method=insertForm";
			}
		};
		
		
		
		
		$("#jobBtn").attr("class", "btn btn-primary");
	
		
	});
</script>
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
								<h4 class="card-title">작업 등록</h4>
							</div>
							<div class="card-body">
								<form method="post" class="form-horizontal" action="${path}/job.do?method=insert">
									<c:forEach var="job" items="${joblist}">
										<input type="hidden" value="${job.j_startD}"/> 
									</c:forEach>
									<div class="row">
										<label class="col-sm-2 col-form-label"> 
											<i class="tim-icons icon-button-power"></i> 작업번호
										</label>
										<div class="col-sm-1">
											<div class="form-group">
												<input type="text" class="form-control" value="Auto" readonly>
											</div>
										</div>
										<label class="col-sm-1 col-form-label"> 
										<i class="tim-icons icon-pin"></i> 상위작업
										</label>
										<div class="col-sm-2">
											<div class="form-group">
												 <select class="selectpicker" name="j_refno">
												 		<option value="0">새 작업</option>
												 	<c:if test="${joblist ne null}">
												 		<c:forEach var="job" items="${joblist}">
															<option value="${job.j_no}">${job.j_name }</option>
														</c:forEach>	
												 	</c:if>
												</select>
											</div>
										</div>
										<label class="col-sm-1 col-form-label"> <i
											class="tim-icons icon-paper"></i> 프로젝트명
										</label>
										<div class="col-sm-2">
											<div class="form-group">
												<select class="selectpicker" name="p_no">
													<option value="${project.p_no}">${project.p_name}</option>
												</select>
											</div>
										</div>
										<label class="col-sm-1 col-form-label"> 
										<i class="tim-icons icon-pencil"></i> 등록날짜
										</label>
										<div class="col-sm-2">
											<div class="form-group">
												<input type="text" class="form-control datepicker" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="row">
										<label class="col-sm-2 col-form-label"> <i
											class="tim-icons icon-pencil"></i> 작업명
										</label>
										<div class="col-sm-4">
											<div class="form-group">
												<input type="text" class="form-control" name="j_name" placeholder="작업명을 입력해주세요.">
											</div>
										</div>
										<label class="col-sm-3 col-form-label"> 
										<i class="tim-icons icon-pencil"></i> 수정날짜
										</label>
										<div class="col-sm-2">
											<div class="form-group">
												<input type="text" class="form-control datepicker" readonly="readonly">
											</div>
										</div>
										<label class="col-sm-2 col-form-label"> <i
											class="tim-icons icon-pencil"></i> 담당자
										</label>
										<div class="col-sm-1">
											<div class="form-group">
												<select class="selectpicker" name="u_no">
												 	<c:forEach var="pp" items="${people}">
														<option value="${pp.u_no}">${pp.u_name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<label class="col-sm-2 col-form-label">작업설명</label>
										<div class="col-sm-10">
											<div class="form-group">
												<input type="text" class="form-control" style="width: 99%; height: 200px;" name="j_content" placeholder="작업설명을 입력해주세요."/>
											</div>
										</div>
									</div>
									<div class="row">
										<label class="col-sm-3 col-form-label">시작날짜</label>
										<div class="col-sm-2">
											<div class="form-group">
												<input type="text" class="form-control datepicker" name="j_startD" placeholder="시작날짜를 선택해주세요">
											</div>
										</div>
										<label class="col-sm-5 col-form-label">종료날짜</label>
										<div class="col-sm-2">
											<div class="form-group">
												<input type="text" class="form-control datepicker" name="j_endD" placeholder="종료날짜를 선택해주세요">
											</div>
										</div>
										<label class="col-sm-2 col-form-label">완료율</label>
										<div class="col-sm-1">
											<div class="form-group">
												<select class="selectpicker" name="j_completeR">
													<option value="0">0%</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row" style="float: right;">
										<div class="col">
											<button class="btn" id="regBtn">등록하기</button>
											<button class="btn" id="backpage">취소하기</button>
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