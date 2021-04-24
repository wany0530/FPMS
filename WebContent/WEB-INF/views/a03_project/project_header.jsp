<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="fileName" value="${pageContext.request.servletPath}" />
<div class="card">
	<div class="row">
		<div class="col-md-12">
			<div class="card-body">
				<ul class="nav ">
				
					<!-- 요약정보 -->
					<li class="nav-item mr-1">
		          	<a class="btn ${(fileName=='/WEB-INF/views/a03_project/a01_detailInfo.jsp')?'btn-primary':''}"
		          		href="${path}/project.do?method=detail_1">
		        			<i class="tim-icons icon-book-bookmark"></i> 요약정보
		      		</a>
	        		</li>
	        		
	        		<!-- 기본정보 -->
					<li class="nav-item mr-1">
	          		<a class="btn ${(fileName=='/WEB-INF/views/a03_project/a02_defaultInfo.jsp')?'btn-primary':''}"
	          			href="${path}/proInfo.do?">
	        				<i class="tim-icons icon-paper"></i> 기본정보
	      			</a>
					</li>
					
					<!-- 리소스 관리 -->
					<c:if test="${sesMem.pos_no == 3}">
					<li class="nav-item mr-1">
						<a class="btn ${(fileName=='/WEB-INF/views/a03_project/a03_resource.jsp')?'btn-primary':''}"
							href="${path}/project.do?method=detail_3">
		        			<i class="tim-icons icon-single-02"></i> 인원관리
						</a>
					</li>
					</c:if>
	        	
					<!-- 작업관리 -->
					<li class="nav-item mr-1">
						<a class="btn ${(fileName=='/WEB-INF/views/a03_project/a04_Job.jsp')?'btn-primary':''}"
							id="jobBtn" href="${path}/job.do?method=job">
							<i class="tim-icons icon-bullet-list-67"></i> 작업관리
						</a>
					</li>
					
					<!-- 배정정보 -->
					<li class="nav-item mr-1">
						<a class="btn ${(fileName=='/WEB-INF/views/a03_project/a05_assign.jsp')?'btn-primary':''}"
							href="${path}/assign.do">
	        				<i class="tim-icons icon-badge"></i> 배정현황
	      			</a>
	        		</li>
	        		
					<!-- 채팅 정보 -->
					<li class="nav-item mr-1">
						<a class="btn ${(fileName=='/WEB-INF/views/a03_project/a04_chatt.jsp')?'btn-primary':''}"
							href="${path}/chatt.do?method=chatt">
	        				<i class="tim-icons icon-badge"></i> 채팅
	      			</a>
	        		</li>

	      </ul>
	    </div>
	  </div>
	</div>
</div>
	