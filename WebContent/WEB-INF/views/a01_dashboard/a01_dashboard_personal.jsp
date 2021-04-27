<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 

<!DOCTYPE html>
<html lang="en">
<script>
	$(document).ready(function(){
		var session = "${sesMem.u_no}";
	})
</script>
<head>
  <meta charset="utf-8" />
  <title> zenkit </title> 
   <%@ include file="../a01_main/bootstrapTop.jsp"%> 
</head>

<body class="sidebar-mini ">
	
  <div class="wrapper">   
   <%@ include file="../a01_main/sidebar.jsp"%>
    <div class="main-panel">
      <%@ include file="../a01_main/header.jsp"%>
    <c:if test="${sesMem.pos_no >2}">
      <div class="content">
        <div class="row"> 
         <c:if test="${sesMem.pos_no >3}"> 
          <div class="col-lg-3 col-md-6">
            <div class="card card-stats">
              <div class="card-body" OnClick="location.href ='${path}/mytask.do?method=task'">
                <div class="row">
                  <div class="col-5">
                    <div class="info-icon text-center icon-warning">
                      <i class="tim-icons icon-single-02"></i>
                    </div>
                  </div>
                  
	                  <div class="col-7">
	                    <div class="numbers">
	                      <p class="card-category" style="font-weight:550;">작업</p>
	                     <c:forEach var="jc" items="jobCnt" varStatus="status">
	                      	<h3 class="card-title">${jobCnt}</h3>
	                    </c:forEach>
	                    </div>
	                  </div>
                  
                </div>
              </div>
              <div class="card-footer">
                <hr>
                <div class="stats">
                   <a href="mytask.do?method=task" style="color:#a9a9b1; font-weight:500;">
	                 View More <i class="tim-icons icon-minimal-right"></i> 
	               </a>
                </div>
              </div>
            </div>
          </div>
		</c:if>
          <div class="col-lg-3 col-md-6">
            <div class="card card-stats">
              <div class="card-body" OnClick="location.href ='${path}/project.do?method=form'">
                <div class="row">
                  <div class="col-5">
                    <div class="info-icon text-center icon-success">
                      <i class="tim-icons icon-notes"></i>
                    </div>
                  </div>
                  <div class="col-7">
                    <div class="numbers">
                      <p class="card-category" style="font-weight:550;">프로젝트</p>
                      <h3 class="card-title">${projectCnt}</h3>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <hr>
                <div class="stats">
	                <a href="project.do?method=form" style="color:#a9a9b1; font-weight:500;">
	                 View More <i class="tim-icons icon-minimal-right"></i> 
	                 </a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div class="card card-stats">
              <div class="card-body" OnClick="location.href ='${path}/mytask.do?method=outputs'">
                <div class="row">
                  <div class="col-5">
                    <div class="info-icon text-center icon-danger">
                      <i class="tim-icons icon-attach-87"></i>
                    </div>
                  </div>
                  <div class="col-7">
                    <div class="numbers">
                      <p class="card-category" style="font-weight:550;">산출물</p>
                      <h3 class="card-title">${outputCnt}</h3>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <hr>
                <div class="stats">
	                <a href="mytask.do?method=outputs" style="color:#a9a9b1; font-weight:500;">
	                  View More <i class="tim-icons icon-minimal-right"></i>
	                </a> 
                </div>
              </div>
            </div>
          </div> 
          <div class="col-lg-3 col-md-6">
            <div class="card card-stats">
              <div class="card-body"">
                <div class="row">
                  <div class="col-5">
                    <div class="info-icon text-center icon-info">
                      <i class="tim-icons icon-alert-circle-exc"></i>
                    </div>
                  </div>
                  <div class="col-7">
                    <div class="numbers">
                      <p class="card-category" style="font-weight:550;">리스크</p>
                      <h3 class="card-title">${riskCnt}</h3>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <hr>
                <div class="stats">
	                <a >
	                &nbsp;
	                </a> 
                </div>
              </div>
            </div>
          </div>                     
        </div>
  
        <h4 class="title pl-3">프로젝트 진행율</h4>
        <div class="row">
	        <c:forEach var="proj" items="${projectDate}">
	          <div class="col-sm-6 col-lg-3">
	            <div class="card ">
	              <div class="card-body" style="padding-top:2em;">
	                 <h4 style="font-weight:450;">${proj.p_name}</h4>   
	                 <div class="progress-container progress-primary">
	                   <span class="progress-badge">D-${proj.dDay}</span>
	                   <div class="progress">
	                     <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${proj.percent}%;">
	                       <span class="progress-value">${proj.percent}%</span>
	                     </div>
	                   </div>
	                 </div>     
	              </div>
	            </div>
	          </div>
	        </c:forEach>  
        </div>

		<div class="row">					
			<!-- 작업 진행 상태 -->
			<div class="col-md-6">
				<div class="card card-chart card-chart-pie">
					<div class="card-header">
						<h4 class="title">작업 진행 현황</h4>
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
									<span class="title text-danger">시작전 - ${projJobCnt.beforeCnt} 건</span>
								</h4>
								<h4 class="card-title">
									<i class="tim-icons  icon-tag text-warning "></i>
									<span class="title text-warning">진행중 - ${projJobCnt.ongoingCnt} 건</span>
								</h4>
								<h4 class="card-title">
									<i class="tim-icons  icon-tag text-info "></i>
									<span class="title text-info">완료 - ${projJobCnt.doneCnt} 건</span>
								</h4>
							</div>
						</div>
					</div>
				</div>
			</div>				
			<!-- 리스크 상태 -->
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
									<span class="title text-danger">오픈 - ${riskCntList.rOpenCnt} 건</span>
								</h4>
								<h4 class="card-title">
									<i class="tim-icons  icon-tag text-warning "></i>
									<span class="title text-warning">조치완료 - ${riskCntList.rDoneCnt} 건</span>
								</h4>
								<h4 class="card-title">
									<i class="tim-icons  icon-tag text-info "></i>
									<span class="title text-info">진행 - ${riskCntList.rOngoingCnt} 건</span>
								</h4>
								<h4 class="card-title">
									<i class="tim-icons  icon-tag" style="color:#4FFF4C;"></i>
									<span class="title" style="color:#4FFF4C;">홀드 - ${riskCntList.rHoldCnt} 건</span>
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
                <h4 class="title">참여프로젝트 현황</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class="text-primary">
                      <tr>
                        <th class="text-center">
                          프로젝트명
                        </th>
                        <th class="text-center">
                          프로젝트코드
                        </th>
                        <th class="text-center">
                          PM
                        </th>
                        <th class="text-center">
                          부서
                        </th>
                        <th class="text-center">
                          진행상태
                        </th>
                        <th class="text-center">
                          시작일
                        </th>
                        <th class="text-center">
                          종료일
                        </th>
                        <th class="text-center">
                          진행률(%)
                        </th>
                        <th class="text-center">
                          작업물
                        </th>
                        <th class="text-center">
                          리스크
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="project" items="${persProjList}">
                      <tr>
                        <td class="text-center">
                          ${project.p_name}
                        </td>
                        <td class="text-center">
                         ${project.p_no}
                        </td>
                        <td class="text-center">
                          ${project.pm_name}
                        </td>
                        <td class="text-center">
                          ${project.d_name}
                        </td>
                        <td class="text-center">
                          ${project.progress_state}
                        </td>
                        <td class="text-center">
                         <fmt:formatDate value="${project.p_startD}"/>
                        </td>
                        <td class="text-center">
                         <fmt:formatDate value="${project.p_endD}"/>
                        </td>
                        <td class="text-center">
                          ${project.progress_rt}%
                        </td>
                        <td class="text-center">
                          ${project.job_cnt}
                        </td>
                        <td class="text-center">
                          ${project.risk_cnt}
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
      </div>
	</c:if>
	
	<c:if test="${sesMem.pos_no < 3}">
	<div class="content">
		<div class="row" style="margin-bottom:30px;">
              <div class="col-md-3 " style="float:right;">
              	 <input type="hidden" name="d_no" value=""/>
                   <select class="selectpicker" data-size="5" data-style="btn btn-primary" 
                    title="부서 선택" id="deptSelect" style="width:50px;">
                    <option value="0">부서 선택</option>
                       <c:forEach var="sd" items="${selectDname}">
                         <option value="${sd.d_no}">${sd.d_name}</option>
                      </c:forEach>
                   </select>
                   
             </div>
        </div>     	             
        <div class="row">
          <div class="col-md-12">
            <div class="card">            
			<%--               
			<div class="card-header">
                <h4 class="title"  style="margin-bottom:-30px;">주요프로젝트 현황</h4>
                  <div class="col-md-3 " style="float:right;">
                  		<input type="hidden" name="progress_state" value=""/>
                        <select class="selectpicker" data-size="5" data-style="btn btn-primary" 
                        	title="진행상태 선택" id="proSelect">
	                          <c:forEach var="sp" items="${selectProgress}">
					             <option value="">${sp.progress_state}</option>
					          </c:forEach>
                        </select>
                  </div>
              </div> --%>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class="text-primary">
                      <tr>
                        <th class="text-center">
                          프로젝트명
                        </th>
                        <th class="text-center">
                          프로젝트코드
                        </th>
                        <th class="text-center">
                          PM
                        </th>
                        <th class="text-center">
                          부서
                        </th>
                        <th class="text-center">
                          진행상태
                        </th>
                        <th class="text-center">
                          시작일
                        </th>
                        <th class="text-center">
                          종료일
                        </th>
                        <th class="text-center">
                          진행률(%)
                        </th>
                        <th class="text-center">
                          작업물
                        </th>
                        <th class="text-center">
                          리스크
                        </th>
                      </tr>
                    </thead>
                    <tbody id="allProjAjax">
                    <!-- 모델명 : allProjList -->
                    <c:forEach var="info" items="${allProjList}">
                      <tr>
                        <td class="text-center">
                          ${info.p_name}
                        </td>
                        <td class="text-center">
                         ${info.p_no}
                        </td>
                        <td class="text-center">
                          ${info.pm_name}
                        </td>
                        <td class="text-center">
                          ${info.d_name}
                        </td>
                        <td class="text-center">
                          ${info.progress_state}
                        </td>
                        <td class="text-center">
                         <fmt:formatDate value="${info.p_startD}"/>
                        </td>
                        <td class="text-center">
                         <fmt:formatDate value="${info.p_endD}"/>
                        </td>
                        <td class="text-center">
                          ${info.progress_rt}%
                        </td>
                        <td class="text-center">
                          ${info.job_cnt}
                        </td>
                        <td class="text-center">
                          ${info.risk_cnt}
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
      <div class="row">
      
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h4 class="title" id="joddd">프로젝트 수행지표</h4>             
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class="text-primary">
                      <tr>
                      	<th class="text-center">
                          부서번호
                        </th>
                      	<th class="text-center">
                          부서
                        </th>
                        <th class="text-center">
                          전체
                        </th>
                        <th class="text-center">
                          시작 전
                        </th>
                        <th class="text-center">
                          진행
                        </th>
                        <th class="text-center">
                          지연
                        </th>                        
                        <th class="text-center">
                          완료
                        </th>
                      </tr>
                    </thead>
                    <!-- 모델명 allCnts -->
                    
                    <tbody id="dInfo">                   
                    <c:forEach var="ac" items="${allCnts}">
                    <input type="hidden" name="d_no" value="${ac.d_no}" id="selectDno" />
                      <tr>                     
                      	<td class="text-center">
                          ${ac.d_no}
                        </td>
                        <td class="text-center">
                          ${ac.d_name}
                          
                        </td>
                        <td class="text-center">
                          ${ac.allCnt}
                        </td>
                        <td class="text-center">
                          ${ac.before_Cnt}
                        </td>
                        <td class="text-center">
                          ${ac.ongoing_Cnt}
                        </td>
                        <td class="text-center">
                          ${ac.late_Cnt}
                        </td>
                        <td class="text-center">
                          ${ac.complete_Cnt}
                        </td>
                      </tr>
                      <tr id="projDtlList">
                      </tr>
                      </c:forEach>                     
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          
          <!-- 리스크 상태 -->
			<div class="col-md-6">
				<div class="card card-chart card-chart-pie">
					<div class="card-header">
						<h4 class="title">리스크 현황</h4>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<div class="chart-area">
									<canvas id="allRiskChart"></canvas>
								</div>
							</div>
							<div class="col-6">
								<h4 class="card-title">
									<i class="tim-icons icon-tag text-danger "></i>
									<span class="title text-danger">오픈 - ${allRiskCnt.rOpenCnt} 건</span>
								</h4>
								<h4 class="card-title">
									<i class="tim-icons icon-tag text-warning "></i>
									<span class="title text-warning">조치완료 - ${allRiskCnt.rDoneCnt} 건</span>
								</h4>
								<h4 class="card-title">
									<i class="tim-icons icon-tag text-info "></i>
									<span class="title text-info">진행 - ${allRiskCnt.rOngoingCnt} 건</span>
								</h4>
								<h4 class="card-title">
									<i class="tim-icons icon-tag" style="color:#4FFF4C;"></i>
									<span class="title" style="color:#4FFF4C;">홀드 - ${allRiskCnt.rHoldCnt} 건</span>
								</h4>
							</div>
						</div>
					</div>
				</div>
			</div>		    
        </div>       
      </div>
	</c:if>
	
	
    </div>
  </div>

   <%@ include file="../a01_main/plugin.jsp"%>
    <%@ include file="../a01_main/bootstrapBottom.jsp"%>

  <script>
    $(document).ready(function() {
    	
		 // 종합 대시보드 부서 선택 ajax
	      $('#deptSelect').change(function(){	
				$.ajax({
					type:"post",
					url:"${path}/jsonAlist.do?d_no="+$(this).attr("option","selected").val(),
					dataType:"json",
					success:function(data){
						// 종합 대시보드 주요프로젝트 현황 (부서별)
						// 모델명 deptProjList
						var list = data.deptProjList;	
						var show = "";
						$.each(list, function(idx, ad, arry){
							show += '<tr><td class="text-center">'+ad.p_name+'</td>';
							show += '<td class="text-center">'+ad.p_no+'</td>';
							show += '<td class="text-center">'+ad.pm_name+'</td>';
							show += '<td class="text-center">'+ad.d_name+'</td>';
							show += '<td class="text-center">'+ad.progress_state+'</td>';
							show += '<td class="text-center">'+ad.p_startD_s+'</td>';
							show += '<td class="text-center">'+ad.p_endD_s+'</td>';
							show += '<td class="text-center">'+ad.progress_rt+'</td>';
							show += '<td class="text-center">'+ad.job_cnt+'</td>';
							show += '<td class="text-center">'+ad.risk_cnt+'</td></tr>';
						});	
						$('#allProjAjax').html(show);				 
					},					
					error:function(err){
						alert("에러발생");
						console.log(err);
					}					 
				});						
						
			});

			 // 종합 대시보드 진행상태 선택 ajax
/* 			 
	      $('#proSelect').change(function(){	
			
	    	 var pg = document.getElementById('proSelect');
	    	 var progress_state = pg.options[pg.selectedIndex].text;
	    	 //var progress_state = $(this).attr("option","selected").text();
	    	  alert(progress_state);
	    	  
	    	  $.ajax({
					type:"post",
					url:"${path}/jsonAlist.do?progress_state="+progress_state,
					dataType:"json",
					success:function(data){
						// 종합 대시보드 주요프로젝트 현황 (진행상태별)
						// pgProjList
						var list = data.pgProjList;	
						var show = "";
						$.each(list, function(idx, ad, arry){
							show += '<tr><td class="text-center">'+ad.p_name+'</td>';
							show += '<td class="text-center">'+ad.p_no+'</td>';
							show += '<td class="text-center">'+ad.pm_name+'</td>';
							show += '<td class="text-center">'+ad.d_name+'</td>';
							show += '<td class="text-center">'+ad.progress_state+'</td>';
							show += '<td class="text-center">'+ad.p_startD_s+'</td>';
							show += '<td class="text-center">'+ad.p_endD_s+'</td>';
							show += '<td class="text-center">'+ad.progress_rt+'</td>';
							show += '<td class="text-center">'+ad.job_cnt+'</td>';
							show += '<td class="text-center">'+ad.risk_cnt+'</td></tr>';
						});	
						$('#allProjAjax').html(show);
					},					
					error:function(err){
						alert("에러발생");
						console.log(err);
					}					 
				});						
	    	  
			});
 */
		if(${sesMem.pos_no}<2){
			
			// 종합 대시보드
			// 리스크 현황    	allRiskCnt			
			var ctx = document.getElementById("allRiskChart").getContext("2d");

			var myChart = new Chart(ctx, {
				type: 'pie',
				data: {
					labels: [1, 2, 3, 4],
					datasets: [{
						label: "Emails",
						pointRadius: 0,
						pointHoverRadius: 0,
						backgroundColor: ['#FE5D93', '#FF8D72', '#0175FA','#4FFF4C'],
						borderWidth: 0,
						data: ['${allRiskCnt.rOpenCnt}', '${allRiskCnt.rDoneCnt}'
							, '${allRiskCnt.rOngoingCnt}', '${allRiskCnt.rHoldCnt}']
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
			 			
		} else{
			// 개인 대시보드
			// 리스크 현황  			
			var ctx = document.getElementById("riskChart").getContext("2d");

			var myChart = new Chart(ctx, {
				type: 'pie',
				data: {
					labels: [1, 2, 3, 4],
					datasets: [{
						label: "Emails",
						pointRadius: 0,
						pointHoverRadius: 0,
						backgroundColor: ['#FE5D93', '#FF8D72', '#0175FA','#4FFF4C'],
						borderWidth: 0,
						data: ['${riskCntList.rOpenCnt}', '${riskCntList.rDoneCnt}'
							, '${riskCntList.rOngoingCnt}', '${riskCntList.rHoldCnt}']
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


    	// 개인 대시보드
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
					data: ['${projJobCnt.beforeCnt}', '${projJobCnt.ongoingCnt}', '${projJobCnt.doneCnt}']
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
						display: false
	            }
				}]
			},
	      }
		});		
	}

    });
  </script>
</body>

</html>
