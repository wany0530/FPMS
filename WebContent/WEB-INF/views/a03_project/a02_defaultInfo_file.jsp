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
 <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
		zenkit
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="../assets/css/black-dashboard.css?v=1.1.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
</head>
<style>
	.dinfo_file{ display:none; position:fixed; top:30%; left:33%; z-index: 999; }
	.dinfo_file .card-footer { text-align:right;}
	.dinfo_file .card-body, .dinfo_file .card-footer { background-color:white;}
	.dinfo_file .card-body label { color: black;}
	.dinfo_file .form-control { color: black;}
	.dinfo_file .form-group input[type=file] {}
</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#cancel").click(function(){
			$(".dinfo_file").css("display","none");
			$(".wrapper").css("filter","none");
		});
	});
	
</script>
<body>
	<div class="col-md-4 dinfo_file">
		<div class="card">
    		<div class="card-header">
    			<h3 class="card-title">파일 등록</h3>
    		</div>
    		<div class="card-body">
    			<form action="#">
     				<div class="form-group">
      					<div class="row">
		      				<label class="col-md-12" style="font-size:14px;">파일명</label>
		      			</div>
	      				<div class="row">
		      				<div class="col-md-12 form-group">
		      					<input type="file" class="form-control">
		      				</div>
	      				</div>
	      				<div class="row">
		      				<label class="col-md-12" style="font-size:14px;">프로젝트 설명</label>
		      				<div class="form-group col-md-12">
		      					<textarea class="form-control" style="max-height: 120px; border: 1px solid #2b3553; border-radius: 0.4285rem;" rows="5"></textarea>
		      				</div>
	      				</div>
      				</div>
      			</form>
			</div>
      		<div class="card-footer">
      			<button type="submit" class="btn btn-warning" id="uptBtn">
      				<span><i class="tim-icons icon-pencil" style="margin-top:-5px"></i> 수정</span></button>
      			<button type="submit" class="btn" id="cancel">
      				<span><i class="tim-icons icon-refresh-01" style="margin-top:-5px"></i> 취소</span></button>
      		</div>
      	</div>
	</div>
</body>
</html>
