<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../a01_main/bootstrapTop.jsp"%>
	<style>
	html, body {
		/* height: 100%;
		padding: 0px;
		margin: 0px;
		overflow: hidden; */
	}
	
	.data:hover {
		background: #1E1E28;
		cursor: pointer;
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

				<!-- Start project-info -->
				<div class="row">

					<div class="col-lg-4 col-md-4">
						<div class="card card-tasks">
							<div class="card-header mb-1">
								<h4 class="title">프로젝트 정보</h4>
							</div>
							<div class="card-body">
							
							<!-- 프로젝트 정보 -->
								<div class="row mb-3 text-right">
								<label class="col-sm-3 col-form-label title">
									진행률 :
								</label>
								<div class="col-md-9">
									<div class="progress-container progress-primary pr-5 pt-3">
										<div class="progress">
											<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
												id ="totProgressBar" style="width: 0%;">
												<span class="progress-value text-primary" style="top: 13px; right:12px;" id="totProgress">
													0%
												</span>
			                        </div>
			                      </div>
			                    </div>
									</div>
								</div>
							
								<!-- 프로젝트 명 -->
								<div class="row mb-3 text-right">
									<label class="col-sm-3 col-form-label title">
										프로젝트 명 :
									</label>
									<div class="col-sm-9">
										<div class="form-group pr-5">
											<input type="text" class="form-control" disabled 
		                        		value="${proInfo.p_name}" style="color: gray;">
										</div>
									</div>
								</div>
								
								<!-- 담당 부서 정보 -->
								<div class="row mb-3 text-right">
									<label class="col-sm-3 col-form-label title">
										담당 부서 :
									</label>
									<div class="col-sm-9">
										<div class="form-group pr-5">
											<input type="text" class="form-control" disabled 
		                        		value="${sesMem.d_name}" style="color: gray;">
										</div>
									</div>
								</div>
								
								<!-- PM 정보 -->
								<div class="row mb-3 text-right">
									<label class="col-sm-3 col-form-label title">
										PM :
									</label>
									<div class="col-sm-9">
										<div class="form-group pr-5">
											<input type="text" class="form-control" disabled 
		                        		value="${pm}" style="color: gray;">
										</div>
									</div>
								</div>
								
								<!-- 시작일 -->
								<div class="row mb-3 text-right">
									<label class="col-sm-3 col-form-label title">
										시작일 :
									</label>
									<div class="col-sm-9">
										<div class="form-group pr-5">
											<h3 class="form-control text-center title mb-0" style="color: white; background: #1D8CF7;">
												${proInfo.p_startD_s}
											</h3>
										</div>
									</div>
								</div>
								
								<!-- 종료일 -->
								<div class="row text-right">
									<label class="col-sm-3 col-form-label title">
										종료일 :
									</label>
									<div class="col-sm-9">
										<div class="form-group pr-5">
											<h3 class="form-control text-center title	" style="color: white; background: #FE5D93;">
												${proInfo.p_endD_s}
											</h3>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-sm-4 text-center">
						<div class="card card-tasks text-left">
							<div class="card-header mb-4">
								<h4 class="title">참여인원</h4>
							</div>
							<div class="card-body">
								<div class="table-full-width table-responsive"
									style="overflow: auto; max-height: 350px;">
									<table class="table text-center mr-auto ml-auto" style="width: 90%">
										<thead>
											<tr>
												<th><h4 class="p-0 m-0 text-info">이 름</h4></th>
												<th><h4 class="p-0 m-0 text-info">직 책</h4></th>
												<th><h4 class="p-0 m-0 text-info">직 급</h4></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="resource" items="${resourceList}">
												<tr>
													<td>${resource.u_name}</td>
													<td>${resource.pos_name}</td>
													<td>${resource.r_name}</td>
												</tr>												
											</c:forEach>										
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-4 col-sm-4 text-center">
						<div class="card card-tasks text-left">
							<div class="card-header mb-4">
								<h4 class="title">내가 처리할 조치 리스트</h4>
							</div>
							<div class="card-body">
								<div class="table-full-width table-responsive"
									style="overflow: auto; max-height: 350px;">
									<table class="table text-left mr-auto ml-auto" style="width: 90%">
										<tbody>
											<c:forEach var="risk" items="${myRiskList}">
												<tr class="data" id="${risk.r_no}">
													<td>${risk.r_no}</td>
													<td>
														<p class="text-warning" style="height: 21px; width:100%; overflow: hidden; margin: 0px;">
															${risk.r_content}
														</p>
													</td>
												</tr>
											</c:forEach>										
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<!-- End of row -->

				<div class="row">
				
					<!-- 작업 진행 상태 -->
					<div class="col-md-6">
						<div class="card card-chart card-chart-pie">
							<div class="card-header">
								<h4 class="title">작업 진행 상태</h4>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-6">
										<div class="chart-area">
											<canvas id="jobChart"></canvas>
										</div>
									</div>
									<div class="col-6">
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-danger "></i>
											<span class="title text-danger">시작전 - ${jobStatuCnt.cnt1} 건</span>
										</h4>
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-warning "></i>
											<span class="title text-warning">진행중 - ${jobStatuCnt.cnt2} 건</span>
										</h4>
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-info "></i>
											<span class="title text-info">완료 - ${jobStatuCnt.cnt3} 건</span>
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 리크스 현황 -->
					<div class="col-md-6">
						<div class="card card-chart card-chart-pie">
							<div class="card-header">
								<h4 class="title">리스크 현황</h4>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-6">
										<div class="chart-area">
											<canvas id="riskChart"></canvas>
										</div>
									</div>
									<div class="col-6">
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-danger "></i>
											<span class="title text-danger">오픈 - ${riskStatuCnt.cnt1} 건</span>
										</h4>
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-warning "></i>
											<span class="title text-warning">진행 - ${riskStatuCnt.cnt2} 건</span>
										</h4>
										<h4 class="card-title">
											<i class="tim-icons  icon-tag text-info "></i>
											<span class="title text-info">조치완료 - ${riskStatuCnt.cnt3} 건</span>
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- End of row -->
				
				<c:if test="${sesMem.pos_no == 4}">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header mb-4" style="align-items: center;">
								<h4 class="title mr-3" style="display: inline;">내 주요 작업 현황</h4>
								<span class="badge badge-danger">진행 전</span>
								<span class="badge badge-warning">진행 중</span>
								<span class="badge badge-info">진행완료</span>
							</div>
							<div class="card-body">
								<div class="row">
								<c:forEach var="job" items="${jobList}">
									<div class="col-sm-2">
										<div class="form-group">
											<c:set var="input" value="${job.j_completeR * 100}"/>
											<c:set var="color" value="${(input==0)?'#FE5D93':(input==100)?'#0175FA':'#FF8D72'}"/>
											<h3 class="form-control text-center title	mb-1"
												style="color: white; background: ${color}; height: 40px; overflow: auto;">
												${job.j_name}
											</h3>
										</div>
										<h4 class="text-center title"style="color: white;">
											${job.j_completeR * 100} %
										</h4>
									</div>
								</c:forEach>
								</div>
							</div>	
							<!-- End of card-body -->

						</div>
					</div>
				</div>
				</c:if>
				<!-- End of row -->

				<c:if test="${sesMem.pos_no == 4}">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="title">내 담당 영역</h4>
							</div>
							<div class="card-body p-4">
								<div id="gantt_here" style="width:100%; height:500px;"></div>
							</div>
						</div>
					</div>
				</div>
				</c:if>
				<!-- End of row -->
				
				
			</div>
			<!-- End Content -->
		</div>
	</div>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
	
	<script>
		
		$(".data").click(function(){
			var r_no=$(this).attr("id");
			console.log(r_no);
			
			location.href="${path}/zenkit.do?method=detail&r_no="+r_no;
		});
	
	
		var pos = "${sesMem.pos_no}";
		
		if(pos == 4){
			gantt.init("gantt_here");
		}
		
			$.ajax({
				type:"post",
				url:"${path}/project.do?method=jobdata",
				dataType:"json",
				success:function(data){
					var totProgress = data.totProgress;
					var data = data.userJob;
					console.log(data);
					
					if(totProgress == "NaN")
						totProgress = 0;
					$('#totProgress').text(Math.round(totProgress)+"%");
					$('#totProgressBar').css("width",totProgress+"%");
					if(pos == 4){
						gantt.parse({
							data
						});
					}
				},
				error:function(err){
					console.log(err);
				}
			})			
		if(pos == 4){	
			$('.gantt_add').css("display", "none");
			$('.gantt_grid_head_add').css("display", "none");
		}
		// 작업 차트
		var ctx = document.getElementById("jobChart").getContext("2d");

		var myChart = new Chart(ctx, {
			type: 'pie',
			data: {
				labels: [1, 2, 3],
				datasets: [{
					label: "Emails",
					pointRadius: 0,
					pointHoverRadius: 0,
					backgroundColor: ['#FE5D93', '#FF8D72', '#0175FA'],
					borderWidth: 0,
					data: ['${jobStatuCnt.cnt1}', '${jobStatuCnt.cnt2}', '${jobStatuCnt.cnt3}']
				}]
			},
			options: {
				cutoutPercentage: 70,
				legend: {
				display: false
			},
			tooltips: {
				backgroundColor: '#f5f5f5',
				titleFontColor: '#333',
				bodyFontColor: '#666',
				bodySpacing: 4,
				xPadding: 12,
				mode: "nearest",
				intersect: 0,
				position: "nearest"
			},
			scales: {
				yAxes: [{
					display: 0,
					ticks: {
						display: false
	            },
	            gridLines: {
						drawBorder: false,
						zeroLineColor: "transparent",
						color: 'rgba(255,255,255,0.05)'
	            }
				}],

				xAxes: [{
					display: 0,
	            barPercentage: 1.6,
	            gridLines: {
						drawBorder: false,
						color: 'rgba(255,255,255,0.1)',
						zeroLineColor: "transparent"
	            },
	            ticks: {
						display: false,
	            }
				}]
			},
	      }
		});
		// 리스크 차트
		var ctx = document.getElementById("riskChart").getContext("2d");

		var myChart = new Chart(ctx, {
			type: 'pie',
			data: {
				labels: [1, 2, 3],
				datasets: [{
					label: "Emails",
					pointRadius: 0,
					pointHoverRadius: 0,
					backgroundColor: ['#FE5D93', '#FF8D72', '#0175FA'],
					borderWidth: 0,
					data: ['${riskStatuCnt.cnt1}', '${riskStatuCnt.cnt2}', '${riskStatuCnt.cnt3}']
				}]
			},
			options: {
				cutoutPercentage: 70,
				legend: {
				display: false
			},
			tooltips: {
				backgroundColor: '#f5f5f5',
				titleFontColor: '#333',
				bodyFontColor: '#666',
				bodySpacing: 4,
				xPadding: 12,
				mode: "nearest",
				intersect: 0,
				position: "nearest"
			},
			scales: {
				yAxes: [{
					display: 0,
					ticks: {
						display: false
	            },
	            gridLines: {
						drawBorder: false,
						zeroLineColor: "transparent",
						color: 'rgba(255,255,255,0.05)'
	            }
				}],

				xAxes: [{
					display: 0,
	            barPercentage: 1.6,
	            gridLines: {
						drawBorder: false,
						color: 'rgba(255,255,255,0.1)',
						zeroLineColor: "transparent"
	            },
	            ticks: {
						display: false,
	            }
				}]
			},
	      }
		});
  </script>
</body>

</html>