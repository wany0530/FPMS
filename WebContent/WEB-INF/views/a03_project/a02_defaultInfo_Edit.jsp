<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>       
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../a01_main/bootstrapTop.jsp"%>
</head>
<style>
	.defaultInfo_Edit .card label { color:white; }

</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#canBtn").click(function(){
			location.href="${path}/proInfo.do?p_no="+${proInfo.p_no};
		});
		$("#strBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				if($("[name=p_name]").val()=="" || $("[name=p_name]").val()==null ){
					alert("제목을 입력해주세요");
					return false;
				}
				if($("[name=p_content]").val()=="" || $("[name=p_content]").val()==null){
					alert("내용을 입력해주세요");
					return false;
				}
				$("[name=proc]").val("upt");
				$("#frm").attr("action","${path}/uptProInfo.do");
				$("#frm").submit();
			}
		});
		<%--
		var proc="${param.proc}";
		if(proc=="upt"){
			if(confirm("수정되었습니다!\n 조회화면으로 이동합니다.")){
				location.href="${path}/proInfo.do?p_no="+${proInfo.p_no};
			}
		}
		--%>
		$("#delBtn").click(function(){
			if(confirm("프로젝트를 삭제하시겠습니까?")){
				$("[name=proc]").val("del");
				location.href="${path}/delproInfo.do?p_no="+${proInfo.p_no};
			}
		});
		<%--
		if(proc=="del"){
			alert("삭제되었습니다!\n 조회화면으로 이동합니다.");
		}
		--%>
	});
	


</script>
<body class="sidebar-mini dInfo_edit">
	<div class="wrapper">
	
    <%@ include file="../a01_main/sidebar.jsp"%>
    <div class="main-panel">
    <%@ include file="../a01_main/header.jsp"%>

      <!-- Your content here -->
      <div class="content defaultInfo_Edit">  
      	<%@ include file="project_header.jsp"%>
        <div class="row">
      		<div class="col-md-12">
      			<div class="card">
      				<div class="card-header">
      					<h3 class="card-title">프로젝트 등록 정보</h3>
      				</div>
      				<div class="card-body">
      					<form method="post" id="frm">
      						<input type="hidden" name="proc"/>
      						<div class="form-group">
      							<div class="row">
		      						<label class="col-md-6" style="font-size:14px;">프로젝트명</label>
		      						<label class="col-md-6" style="font-size:14px;">프로젝트 코드</label>
	      						</div>
	      						<div class="row">
		      						<div class="col-md-6 form-group">
		      							<input id="p_name" name="p_name" type="text" class="form-control" value="${proInfo.p_name}" style="color:white;">
		      						</div>
		      						<div class="col-md-6 form-group">
		      							<input type="text" name="p_no" class="form-control" value="${proInfo.p_no}" style="color:white;" readonly>
		      						</div>
	      						</div>
	      						<div class="row">
		      						<label class="col-md-6" style="font-size:14px;">프로젝트관리자</label>
	      						</div>
	      						<div class="row">
		      						<div class="col-md-3 form-group">
		      							<div class="dropdown bootstrap-select">
			      							<input type="text" name="d_name" class="form-control" value="${proInfo.d_name}" style="color:white;" readonly>
		      							</div>
		      						</div>
		      						<div class="col-md-3 form-group">
		      							<div class="dropdown bootstrap-select">
			      							<input type="text" name="u_name" class="form-control" value="${proInfo.u_name}" style="color:white;" readonly>
		      							</div>
		      						</div>
	      						</div>
	      						<div class="row">
		      						<label class="col-md-6" style="font-size:14px;">프로젝트 설명</label>
		      						<div class="form-group col-md-12">
		      							<textarea id="p_content" name="p_content" class="form-control pinfo_textarea" rows="5"
		      								style="max-height: 120px;">${proInfo.p_content}</textarea>
		      						</div>
	      						</div>
      						</div>
      					</form>
      				</div>
      				<br><br><br><br>
      				<div class="card-footer">
      					<button type="button" class="btn btn-success" id="strBtn">
      						<span><i class="tim-icons icon-check-2" style="margin-top:-5px"></i> 저장</span></button>
      					<button class="btn" id="canBtn">
      						<span><i class="tim-icons icon-refresh-01" style="margin-top:-5px"></i> 취소</span></button>
      					<button class="btn btn-danger" id="delBtn"
      						style="float:right">
      					 	<span><i class="tim-icons icon-simple-remove"></i> Delete</span></button>
      				</div>
      			</div>
      		</div>
        </div>
      </div>
      <!--  End content -->

    </div>
  </div>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>

   
</body>
</html>