<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="fileName" value="${pageContext.request.servletPath}" />
<div class="card">
	<div class="row">
		<div class="col-md-12">
			<div class="card-body">
				<ul class="nav ">
				<li class="nav-item mr-1">
	          	<a class="btn ${(fileName=='/a02_project/a01_detailInfo.jsp')?'btn-primary':''}"
	          	href="${path}/a02_project/a01_detailInfo.jsp">
	        		<i class="tim-icons icon-book-bookmark"></i> 요약정보
	      		</a>
	        </li>
					<li class="nav-item mr-1">
	          <a class="btn ${(fileName=='/a02_project/a02_defaultInfo.jsp')?'btn-primary':''}"
	          	href="${path}/a02_project/a02_defaultInfo.jsp">
	        		<i class="tim-icons icon-paper"></i> 기본정보
	      		</a>
	        </li>
			  <li class="nav-item mr-1">
	          <a class="btn ${(fileName=='/a02_project/a03_resource.jsp')?'btn-primary':''}"
	          	href="${path}/a02_project/a03_resource.jsp">
	        		<i class="tim-icons icon-single-02"></i> 리소스
	      		</a>
	        </li>
			<li class="nav-item mr-1">
	          <a class="btn" href="##">
	        		<i class="tim-icons icon-bullet-list-67"></i> 작업관리
	      		</a>
	        </li>
					<li class="nav-item mr-1">
	          <a class="btn" href="##">
	        		<i class="tim-icons icon-badge"></i> 배정현황
	      		</a>
	        </li>
					<li class="nav-item mr-1">
	          <a class="btn" href="${path}/a05_risk/a01_riskTable.jsp">
	        		<i class="tim-icons icon-alert-circle-exc"></i> 리스크
	      		</a>
	      </ul>
	    </div>
	  </div>
	</div>
</div>
	