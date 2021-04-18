<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<fmt:requestEncoding value="utf-8"/> 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>zenkit</title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="../assets/css/black-dashboard.css?v=1.1.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <link href="../z01_css/auth.css" rel="stylesheet" />
</head>

<body class="sidebar-mini ">
  <div class="wrapper">
    <%@ include file="../a01_main/sidebar.jsp" %>
    <div class="main-panel">
		<%@ include file="../a01_main/header.jsp" %>
      <div class="content">
        <!-- Your content here -->
        <div class="col-md-12">
        	<div class="card">
        		<div class="card-header">
        			<div class="form-row">
        			<div class="col-md-3">
        				<div class="dropdown bootstrap-select">
        					<select class="selectpicker" data-size="7" data-style="btn btn-primary">
        						<option class="bs-title-option">작업 상태를 선택하세요</option>
        						<option>승인중</option>
        						<option>승인완료</option>
        						<option>반려</option>
        					</select>
        				</div>
        			</div>
        			<div class="col-md-3">
        				<div class="dropdown bootstrap-select">
        					<select class="selectpicker" data-size="7" data-style="btn btn-primary">
        						<option class="bs-title-option">프로젝트를 선택하세요</option>
        						<option>프로젝트1</option>
        						<option>프로젝트2</option>
        					</select>
        				</div>
        			</div>
        			<div class="col-md-4">
        				<div class="input-group">
        					<div class="input-group-prepend" style="height:40.67px">
    					       <div class="input-group-text">
       					  	     <i class="tim-icons icon-zoom-split"></i>
       						    </div>
       						</div>
	        				<input type="text" class="form-control auth-search-input" placeholder="Search..">
	        				<button class="btn btn-primary btn-sm auth-search-btn">검색</button>
	        			</div>
        			</div>
        			</div>
        			
        		</div>
        		<div class="card-body">
        			<table class="table" id="auth-table">
        				<colgroup>
        					<col style="width:25%">
        					<col style="width:25%">
        					<col style="width:100px">
        					<col style="width:150px">
        					<col style="width:200px">
        				</colgroup>
        				<thead>
        					<tr>
        						<th>결재작업</th>
        						<th>프로젝트</th>
        						<th>상태</th>
        						<th>결재요청자</th>
        						<th>결재요청일</th>
        						<th></th>
        					</tr>
        				</thead>
        				<tbody id="authTableBody">
        					<tr>
        						<td style="padding-left:20px;"><%--<a href="#">작업명</a> --%>
        							<a href="#" id="btnWorkTab" data-toggle="modal" data-target=".bd-example-modal-lg">작업명</a>
        						</td>
        						<td style="padding-left:20px;"><a href="#">프로젝트</a></td>
        						<td class="text-center"><span class="badge badge-success">승인중</span></td>
        						<td class="text-center">신길동</td>
        						<td class="text-center">2021-04-01</td>
        						<td class="text-center">
        							<button type="button" class="btn btn-primary btn-sm btn-simple" id="auth-cancle">결재회수</button>
        						</td>
        					</tr>
        					<tr>
        						<td style="padding-left:20px;"><a href="#">작업명</a></td>
        						<td style="padding-left:20px;"><a href="#">프로젝트</a></td>
        						<td class="text-center"><span class="badge badge-info">승인완료</span></td>
        						<td class="text-center">하길동</td>
        						<td class="text-center">2021-03-31</td>
        						<td class="text-center"></td>
        					</tr>
        					<tr>
        						<td style="padding-left:20px;"><a href="#">작업명</a></td>
        						<td style="padding-left:20px;"><a href="#">프로젝트</a></td>
        						<td class="text-center"><span class="badge badge-danger">반려</span></td>
        						<td class="text-center">신길동</td>
        						<td class="text-center">2021-03-30</td>
        						<td class="text-center"></td>
        					</tr>
        					<tr>
        						<td style="padding-left:20px;"><a href="#">작업명</a></td>
        						<td style="padding-left:20px;"><a href="#">프로젝트</a></td>
        						<td class="text-center"><span class="badge badge-default">회수</span></td>
        						<td class="text-center">이길동</td>
        						<td class="text-center">2021-03-29</td>
        						<td class="text-center"></td>
        					</tr>
        				</tbody>
        			</table>
        			<nav aria-label="...">
  						<ul class="pagination">
							<li class="page-item disabled">
								<a class="page-link" href="#" tabindex="-1">Previous</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1 <span class="sr-only">(current)</span></a></li>
							<li class="page-item">
								<a class="page-link" href="#">2</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item">
								<a class="page-link" href="#">Next</a>
							</li>
						</ul>
					</nav>
        		</div>
        	</div>
        </div>
      </div>
      <%-- 작업정보창 --%>
      <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		    	<div class="modal-header">
					<nav class="nav" id="task_info_nav">
						<a class="nav-link task_info_nav active" href="#tab_1_1">작업정보</a>
						<a class="nav-link task_info_nav" href="#tab_1_2">산출물</a>
						<a class="nav-link task_info_nav" href="#tab_1_3">결재 정보</a>
					</nav>
				   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				     <i class="tim-icons icon-simple-remove"></i>
				   </button>
				</div>
		      	<div class="modal-body" style="min-height: 450px;">
		      		<%-- 작업정보 --%>
		      		<div class="tab-pane active" id="tab_1_1">
			      		<div class="form-group row">
			      			<label class="col-lg-2 col-form-label text-right">작업명</label>
			      			<div class="col-lg-8">
			      				<span id="task_name" class="form-control">작업명</span>
			      			</div>
			      		</div>
			      		<div class="form-group row">
			      			<label class="col-lg-2 col-form-label text-right">시작</label>
			      			<div class="col-lg-3">
			      				<span id="task_start" class="form-control">2020-04-01</span>
			      			</div>
			      			<label class="col-lg-2 col-form-label text-right">완료</label>
			      			<div class="col-lg-3">
			      				<span id="task_finish" class="form-control">2020-04-03</span>
			      			</div>
			      		</div>
			      		<div class="form-group row">
			      			<label class="col-lg-2 col-form-label text-right">완료율(%)</label>
			      			<div class="col-lg-3">
			      				<span id="task_start" class="form-control"></span>
			      			</div>
			      			<label class="col-lg-2 col-form-label text-right">승인자</label>
			      			<div class="col-lg-3">
			      				<span id="task_finish" class="form-control"></span>
			      			</div>
			      		</div>
			      		<div class="form-group row">
			      			<label class="col-lg-2 col-form-label text-right">메모</label>
			      			<div class="col-lg-8">
			      				<textarea class="form-control" id="task_memo" rows="7" style="color:#222a42;border:1px solid #2b3553;max-height:200px;"></textarea>
			      			</div>
			      		</div>
		      		</div>
		      		<%-- 산출물 --%>
		      		<div class="tab-pane" id="tab_1_2">
		      			<div class="grid-template-row">
		      				<div class="row grid-row">
		      					<div class="col-md-7">
		      						<div class="forum-list-title">파일제목</div>
		      						<div class="font-s13 text-muted">업로드자명 on 업로드일&nbsp;&nbsp;file size</div>
		      					</div>
		      					<div class="col-md-4" style="max-width: 32%;">
		      						<a href="#" class="btn-label-brand btn btn-sm" title="파일 다운로드">
		      							<i class="fa fa-download">
		      							</i>
		      						</a>
		      					</div>
		      				</div>
		      				<div class="row grid-row">
		      					<div class="col-md-7">
		      						<div class="forum-list-title">파일제목2</div>
		      						<div class="font-s13 text-muted">업로드자명 on 업로드일&nbsp;&nbsp;file size</div>
		      					</div>
		      					<div class="col-md-4" style="max-width: 32%;">
		      						<a href="#" class="btn-label-brand btn btn-sm" title="파일 다운로드">
		      							<i class="fa fa-download">
		      							</i>
		      						</a>
		      					</div>
		      				</div>
		      			</div>
		      		</div>
		      		<%-- 결재 정보--%>
		      		<div class="tab-pane" id="tab_1_3">
		      			<div class="row grid-row">
		      				<div class="col-md-7">
		      					
		      				</div>
		      				<div class="col-md-4">
		      				</div>
		      			</div>
		      		</div>
		      	</div>
		      	<div class="modal-footer">
		      		<button type="button" class="authClose"></button>
		      		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      	</div> 
		    </div><%-- modal-content --%>
		  </div>
		</div>

      <footer class="footer">
        <div class="container-fluid">
          <ul class="nav">
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
                Creative Tim
              </a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
                About Us
              </a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
                Blog
              </a>
            </li>
          </ul>
          <div class="copyright">
            ©
            <script>
              document.write(new Date().getFullYear())
            </script> made with <i class="tim-icons icon-heart-2"></i> by
            <a href="javascript:void(0)" target="_blank">Creative Tim</a> for a better web.
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <script src="../assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="../assets/js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="../assets/js/plugins/sweetalert2.min.js"></script>
  <!--  Plugin for Sorting Tables -->
  <script src="../assets/js/plugins/jquery.tablesorter.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="../assets/js/plugins/jquery.validate.min.js"></script>
  <!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="../assets/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="../assets/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="../assets/js/plugins/bootstrap-datetimepicker.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
  <script src="../assets/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="../assets/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="../assets/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <script src="../assets/js/plugins/fullcalendar/fullcalendar.min.js"></script>
  <script src="../assets/js/plugins/fullcalendar/daygrid.min.js"></script>
  <script src="../assets/js/plugins/fullcalendar/timegrid.min.js"></script>
  <script src="../assets/js/plugins/fullcalendar/interaction.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="../assets/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="../assets/js/plugins/nouislider.min.js"></script>
  <!-- Chart JS -->
  <script src="../assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/black-dashboard.min.js?v=1.1.1"></script>
  <!-- Black Dashboard DEMO methods, don't include it in your project! 
  <script src="../assets/demo/demo.js"></script>-->
  <script src="${path}/z02_js/auth.js"></script>
<script>
</script>
</body>

</html>