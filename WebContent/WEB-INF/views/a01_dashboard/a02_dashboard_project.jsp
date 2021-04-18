<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png"> -->
<title>zenkit</title>
<%@ include file="../a01_main/bootstrapTop.jsp"%> 
<style>
html, body {
	/* height: 100%;	padding: 0px;	margin: 0px;	overflow: hidden; */}
</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.5.1.js"></script>


</head>
<body class="sidebar-mini ">
	<div class="wrapper">
		<%@ include file="../a01_main/sidebar.jsp"%>
		<div class="main-panel">			
			<%@ include file="../a01_main/header.jsp"%>

			<div class="content">				
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="card card-tasks">
							<div class="card-header">
								<h4 class="title" style="margin-bottom:-30px;">프로젝트 정보</h4>
								<div class="col-md-3 " style="float:right; ">									
									<input type="hidden" name="p_no" value=""/>
				                        <select class="selectpicker" data-size="5" data-style="btn btn-primary" 
				                        	title="프로젝트 선택" id="projSelect" style="width:50px;">
				                         <!--  <option disabled selected>프로젝트</option> -->
				                          <c:forEach var="pn" items="${projNameList}">
				                         	 <option value="${pn.p_no}">${pn.p_name}</option>
				                          </c:forEach>
				                        </select>
			                       
			                 	</div>
							</div>

							
							<div class="card-body">
								<div class="row mb-2">
									<div class="col-md-12">
									 	<h3 id="pName"></h3>									 	
									</div>
								</div>
								<div class="row mb-4">
									<div class="col-md-3">
										<h5>시작일</h5>
										<div class="btn btn-info btn-sm" id="startD">
										</div>
									</div>
									<div class="col-md-3">
										<h5>종료일</h5>
										<div class="btn btn-danger btn-sm" id="endD">
										</div>
									</div>
									<div class="col-md-6">
										<h5 class="mb-2">Progress</h5>
										<div class="progress-container">
											<span class="progress-badge">&nbsp</span>
											<div class="progress">
												<div class="progress-bar" role="progressbar" id="progressbar"
													aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
													<span class="progress-value" id="progress">%</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-md-12">
										<h5>PM</h5>
										<h5 id="pmName"></h5>										
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6 col-sm-6 text-center">
						<div class="card card-tasks text-left">
							<div class="card-header">
								<h4 class="title">참여인원</h4>
							</div>
							<div class="card-body">
								<div class="table-full-width table-responsive"
									style="overflow: auto; max-height: 380px;">
									<table class="table">
										<thead>							
											<tr>
												<th>이름</th><th>직급</th><th>직책</th>
											</tr>											
										</thead>
										<tbody id="resList">								
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End of row -->

				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="title">주요 작업 현황</h4>
							</div>

							<div class="card-body row p-4 m-0" >	
							<div id="please" style="width:100%;"></div>								
								<!-- 
								<div class="col-md-2 bg-info p-3">
									<div class="progress-container">
										<h4>유스케이스 설계</h4>
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
												style="width: 25%; background: white;">
												<span class="progress-value">25%</span>
											</div>
										</div>
									</div>
								</div>
								 -->
							</div>
							<!-- End of card-body -->

						</div>
					</div>
				</div>
				<!-- End of row -->

				<div class="row">
					<div class="col-md-6">
						<div class="card card-chart card-chart-pie">
							<div class="card-header">
								<h4 class="title">프로젝트 태스크 진행상태</h4>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-6">
										<div class="chart-area">
											<canvas id="PieChartGradient"></canvas>
										</div>
									</div>
									<div class="col-6">
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-warning "></i> 시작전 - 5 건
										</h4>
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-warning "></i> 진행중 - 5 건
										</h4>
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-warning "></i> 완료 - 5 건
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card card-chart card-chart-pie">
							<div class="card-header">
								<h4 class="title">리스크 현황</h4>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-6">
										<div class="chart-area">
											<canvas id="PieChartGradient2"></canvas>
										</div>
									</div>
									<div class="col-6">
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-warning "></i> 고객변심 - 5 건
										</h4>
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-warning "></i> 일정지연 - 3 건
										</h4>
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-warning "></i> 기타 - 2 건
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- End of row -->

				<div class="row">
				
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="title">작업배정 현황</h4>
							</div>
							<div class="card-body p-4">
								<div id="gantt_here" style="width:100%; height:500px;"></div>
							</div>
						</div>
					</div>
					
				</div>
				<!-- End of row -->
				
			</div>
			<!-- End Content -->

		</div>
	</div>
	<div class="fixed-plugin">
		<div class="dropdown show-dropdown">
			<a href="#" data-toggle="dropdown"> <i class="fa fa-cog fa-2x">
			</i>
			</a>
			<ul class="dropdown-menu">
				<li class="header-title">Sidebar Background</li>
				<li class="adjustments-line"><a href="javascript:void(0)"
					class="switch-trigger background-color">
						<div class="badge-colors text-center">
							<span class="badge filter badge-primary active"
								data-color="primary"></span> <span
								class="badge filter badge-info" data-color="blue"></span> <span
								class="badge filter badge-success" data-color="green"></span> <span
								class="badge filter badge-warning" data-color="orange"></span> <span
								class="badge filter badge-danger" data-color="red"></span>
						</div>
						<div class="clearfix"></div>
				</a></li>
				<li class="header-title">Sidebar Mini</li>
				<li class="adjustments-line">
					<div class="togglebutton switch-sidebar-mini">
						<span class="label-switch">OFF</span> <input type="checkbox"
							name="checkbox" checked class="bootstrap-switch" data-on-label=""
							data-off-label="" /> <span class="label-switch label-right">ON</span>
					</div>
					<div class="togglebutton switch-change-color mt-3">
						<span class="label-switch">LIGHT MODE</span> <input
							type="checkbox" name="checkbox" checked class="bootstrap-switch"
							data-on-label="" data-off-label="" /> <span
							class="label-switch label-right">DARK MODE</span>
					</div>
				</li>
				<li class="button-container mt-4"><a
					href="../docs/1.0/getting-started/introduction.html"
					class="btn btn-default btn-block btn-round"> Documentation </a></li>
				<li class="header-title">Thank you for 95 shares!</li>
				<li class="button-container text-center">
					<button id="twitter" class="btn btn-round btn-info">
						<i class="fab fa-twitter"></i> &middot; 45
					</button>
					<button id="facebook" class="btn btn-round btn-info">
						<i class="fab fa-facebook-f"></i> &middot; 50
					</button> <br> <br> <a class="github-button"
					href="https://github.com/creativetimofficial/ct-black-dashboard-pro"
					data-icon="octicon-star" data-size="large" data-show-count="true"
					aria-label="Star ntkme/github-buttons on GitHub">Star</a>
				</li>
			</ul>
		</div>

	</div>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
	
<script>
	$(document).ready(function() {
	      // Javascript method's body can be found in assets/assets-for-demo/js/demo.js
	    	demo.initChartPageCharts();

			$('#projSelect').change(function(){			
				$.ajax({
					type:"post",
					url:"${path}/jsonPlist.do?p_no="+$(this).attr("option","selected").val(), 
					dataType:"json",
					success:function(data){
						
						
						// 프로젝트 대시보드 p_no별 프로젝트정보
						var list = data.plist;	
						console.log(list);
						$.each(list, function(idx, pro, arry){
							var pName = $("#pName").text(pro.p_name);
							var pmName = $("#pmName").text(pro.p_pm);
							var startD = $("#startD").text(pro.p_startD_s);
							var endD = $("#endD").text(pro.p_endD_s);				
							var progress = $("#progress").text(pro.percent+"%");
							var progressbar = $("#progressbar").css("width",pro.percent+"%");
							var p_name = $("#p_name").text();
						});		
						
						// 프로젝트 대시보드 p_no별 참여인력(리소스) 
						var rlist = data.rlist;
						var show = "";
						$.each(rlist, function(idx, res, arry){
							show += "<tr><td>"+res.u_name+"</td>";
							show += "<td>"+res.r_name+"</td>";
							show += "<td>"+res.pos_name+"</td></tr>";
						});
						$('#resList').html(show);
						
						// 프로젝트 주요작업 현황 6개 
						var jlists = data.jlist;
						
						console.log(jlists);						
						for(var idx=0; idx<jlists.length ; idx++){	
							//console.log(jlists[idx].j_name +" / "+jlists[idx].j_completer);
							var jShow = "";
							jShow += '<div class="col-md-2 bg-warning p-3" id="jobList'+idx+'" style="float:left;">';
							jShow += '<div class="progress-container">';
							jShow += '<h4>'+jlists[idx].j_name+'</h4>';
							jShow += '<div class="progress">';
							jShow += '<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:'+jlists[idx].j_completer+'%; background: white;">';
							jShow += '<span class="progress-value">'+jlists[idx].j_completer+'%</span>';
							jShow += '</div></div></div></div>';	
							console.log("jShow : "+jShow);
							// $('.card-body row p-4 m-0').append(jShow);
							$("#please").append(jShow);
						};
											 

					},					
					error:function(err){
						alert("에러발생");
						console.log(err);
					}					 
				});						
						
			});

		
		gantt.init("gantt_here");
		
		gantt.parse({
			data: [
				{ id: 1, text: "요구사항 정의", start_date: "01-04-2021", duration: 18, progress: 0.4, open: true },
				{ id: 2, text: "화면설계", start_date: "02-04-2021", duration: 8, progress: 0.6, parent: 1 },
				{ id: 3, text: "화면구현", start_date: "11-04-2021", duration: 8, progress: 0.6, parent: 1 }
			],
			links: [
				{id: 1, source: 1, target: 2, type: "1"},
				{id: 2, source: 2, target: 3, type: "0"}
			]
		});
		
    });
  </script>
</body>

</html>