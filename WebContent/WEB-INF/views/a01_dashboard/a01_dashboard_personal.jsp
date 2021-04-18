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
                   <a href="${path}/mytask.do?method=task" style="color:#a9a9b1; font-weight:500;">
	                 View More <i class="tim-icons icon-minimal-right"></i> 
	               </a>
                </div>
              </div>
            </div>
          </div>

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
	                <a href="project.do?method=detail_1" style="color:#a9a9b1; font-weight:500;">
	                 View More <i class="tim-icons icon-minimal-right"></i> 
	                 </a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div class="card card-stats">
              <div class="card-body" OnClick="location.href ='${path}/mytask.do?method=output'">
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
	                <a href="${path}/mytask.do?method=output" style="color:#a9a9b1; font-weight:500;">
	                  View More <i class="tim-icons icon-minimal-right"></i>
	                </a> 
                </div>
              </div>
            </div>
          </div>               
        </div>
  
        <h4 class="title pl-3">참여 프로젝트</h4>
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
                          산출물
                        </th>
                        <th class="text-center">
                          리스크
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="project" items="${projectList}">
                      <tr>
                        <td class="text-center">
                          ${project.p_name}
                        </td>
                        <td class="text-center">
                         ${project.p_no}
                        </td>
                        <td class="text-center">
                          ${project.p_pm}
                        </td>
                        <td class="text-center">
                          ${project.d_name}
                        </td>
                        <td class="text-center">
                          ${project.progress}
                        </td>
                        <td class="text-center">
                        <!-- <fmt:formatDate value="${project.p_endD}"/> -->
                         <fmt:formatDate value="${project.p_startD}"/>
                        </td>
                        <td class="text-center">
                         <fmt:formatDate value="${project.p_endD}"/>
                        </td>
                        <td class="text-center">
                          ${project.percent}%
                        </td>
                        <td class="text-center">
                          ${project.poCnt}
                        </td>
                        <td class="text-center">
                          2
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
	
	
	<!-- selectProgress	selectDname	year1	year2 -->
	<div class="content">
		<div class="row" style="margin-bottom:30px;">
              <div class="col-md-3 " style="float:right;">
              	 <input type="hidden" name="d_no" value=""/>
                  <select class="selectpicker" data-size="5" data-style="btn btn-primary" 
				        title="부서 선택" id="deptSelect" style="width:50px;">
                       <c:forEach var="sd" items="${selectDname}">
                    	  <option value="${sd.d_no}">${sd.d_name}</option>
                      </c:forEach>
                   </select>
             </div>
        </div>     	             
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h4 class="title"  style="margin-bottom:-30px;">주요프로젝트 현황</h4>
                  <div class="col-md-3 " style="float:right;">
                  		<input type="hidden" name="progress" value=""/>
                        <select class="selectpicker" data-size="5" data-style="btn btn-primary" 
                        	title="진행상태 선택" id="proSelect">
	                          <c:forEach var="sp" items="${selectProgress}">
					             <option>${sp.progress}</option>
					          </c:forEach>
                        </select>
                  </div>
                  <div class="col-md-3 " style="float:right;">
                  		<input type="hidden" name="pYear1" value=""/>
                        <select class="selectpicker" data-size="5" data-style="btn btn-primary"
                        	title="연도 선택" id="year1Select">
                         	  <c:forEach var="year" items="${year1}">
					             <option value="${year.pYear1}">${year.pYear1}</option>
					      	 </c:forEach>
                        </select>
                 </div>
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
                          산출물
                        </th>
                        <th class="text-center">
                          리스크
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    <!-- 모델명 : allProjInfo -->
                    <c:forEach var="info" items="${allProjInfo}">
                      <tr>
                        <td class="text-center">
                          ${info.p_name}
                        </td>
                        <td class="text-center">
                         ${info.p_no}
                        </td>
                        <td class="text-center">
                          ${info.pmName}
                        </td>
                        <td class="text-center">
                          ${info.d_name}
                        </td>
                        <td class="text-center">
                          ${info.progress}
                        </td>
                        <td class="text-center">
                         <fmt:formatDate value="${info.p_startD}"/>
                        </td>
                        <td class="text-center">
                         <fmt:formatDate value="${info.p_endD}"/>
                        </td>
                        <td class="text-center">
                          ${info.percent}%
                        </td>
                        <td class="text-center">
                          ${info.poCnt}
                        </td>
                        <td class="text-center">
                          2
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
                      	<th class="text-left">
                          부서번호
                        </th>
                      	<th class="text-left">
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
                      	<td class="text-left">
                          ${ac.d_no}
                        </td>
                        <td class="text-left">
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
          
           <div class="col-md-6">
            <div class="card card-chart card-chart-pie"> 
              <div class="card-header">
                <h4 class="title">리스크 현황</h4>
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
      </div>
	</c:if>
	
	
    </div>
  </div>

   <%@ include file="../a01_main/plugin.jsp"%>
    <%@ include file="../a01_main/bootstrapBottom.jsp"%>

  <script>
    $(document).ready(function() {
    	
    	// 수행지표 tr 클릭 시 해당부서의 프로젝트 리스트 뜨게
    	// 모델명 deptProjCnt
    	/*
         $("#dInfo").on("click", "tr", function(){
        	 alert("부서번호 : "+ $(this).find("td:eq(0)").text() );
		 });
		*/
      /*
      $('#dInfo').click(function(){			
			$.ajax({
				type:"post",
				url:"${path}/jsonAlist.do?d_no="+$(this).attr("option","selected").val(),
				dataType:"json",
				success:function(data){
					
					
					// 종합 대시보드 프로젝트 수행지표 리스트 (부서 내 프로젝트별)
					// 모델명 deptProjList
					var list = data.deptProjList;	
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
										 

				},					
				error:function(err){
					alert("에러발생");
					console.log(err);
				}					 
			});						
					
		});
       */
         
         
      // Javascript method's body can be found in assets/js/demos.js
      demo.initChartPageCharts();

     
      

    });
  </script>
</body>

</html>
