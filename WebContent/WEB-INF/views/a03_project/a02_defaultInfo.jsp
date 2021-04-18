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
	<%@ include file="../a01_main/bootstrapTop.jsp"%>
</head>
<style>
	.defaultInfo .card label {
		color:white;
	}
</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#uptBtn").click(function(){
			location.href="${path}/proInfo_Edit.do?p_no="+${proInfo.p_no};
		});
		$("#delBtn").click(function(){
			if(confirm("프로젝트를 삭제하시겠습니까?")){
				location.href="${path}/delproInfo.do?p_no="+${proInfo.p_no};
			}
		});
	});
	
</script>
<body class="sidebar-mini">
	<div class="wrapper">
	
    <%@ include file="../a01_main/sidebar.jsp"%>
    <div class="main-panel">
    	<%@ include file="../a01_main/header.jsp"%>
      
      <!-- Your content here -->
      <div class="content defaultInfo">  
      	<%@ include file="project_header.jsp"%>
        <div class="row">
      		<div class="col-md-12">
      			<div class="card">
      				<div class="card-header">
      					<h3 class="card-title">프로젝트 등록 정보</h3>
      				</div>
      				<div class="card-body">
      						<div class="form-group">
      							<div class="row">
		      						<label class="col-md-6" style="font-size:14px;">프로젝트명</label>
		      						<label class="col-md-6" style="font-size:14px;">프로젝트 코드</label>
	      						</div>
	      						<div class="row">
		      						<div class="col-md-6 form-group">
		      							<div class="form-control">${proInfo.p_name}</div>
		      						</div>
		      						<div class="col-md-6 form-group">
		      							<div class="form-control">${proInfo.p_no}</div>
		      						</div>
	      						</div>
	      						<div class="row">
		      						<label class="col-md-6" style="font-size:14px;">프로젝트관리자</label>
	      						</div>
	      						<div class="row">
		      						<div class="col-md-3 form-group">
		      							<div class="dropdown bootstrap-select">
			      							<div class="form-control">${proInfo.d_name}</div>
		      							</div>
		      						</div>
		      						<div class="col-md-3 form-group">
		      							<div class="dropdown bootstrap-select">
			      							<div class="form-control">${proInfo.u_name}</div>
		      							</div>
		      						</div>
	      						</div>
	      						<div class="row">
		      						<label class="col-md-6" style="font-size:14px;">프로젝트 설명</label>
		      						<div class="form-group col-md-12">
		      							<div class="form-control" style="height:120px;">${proInfo.p_content}</div>
		      						</div>
	      						</div>
      						</div>
      				</div>
      				<br><br><br><br>
      				<c:if test="${sesMem.pos_no == 3}">
      				<div class="card-footer">
      					<button class="btn btn-success" id="uptBtn">
      						<span><i class="tim-icons icon-pencil" style="margin-top:-5px"></i> 수정</span></button>
      					<button class="btn btn-danger" id="delBtn"
      						style="float:right">
      					 	<i class="tim-icons icon-simple-remove"></i> Delete</button>
      				</div>
      				</c:if>
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