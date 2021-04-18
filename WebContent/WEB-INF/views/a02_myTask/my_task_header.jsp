<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="fileName" value="${pageContext.request.servletPath}" />
<div class="card">
	<div class="row">
		<div class="col-md-12">
			<div class="card-body">
				<ul class="nav ">
					<li class="nav-item mr-1">
			          <a class="btn ${(fileName=='/mytask.do?method=task')?'btn-primary':''}" 
			          		href="${path}/mytask.do?method=task">
			        		<i class="tim-icons icon-bullet-list-67"></i> 작업물
			      		</a>
			        </li>
			        <li class="nav-item mr-1">
			          <a class="btn ${(fileName=='/mytask.do?method=outputs')?'btn-primary':''}" 
			          	href="${path}/output.do?method=outputs">
			        		<i class="tim-icons icon-attach-87"></i> 산출물
			      		</a>
			        </li>		
					
	     		 </ul>
	    	</div>
	  </div>
	</div>
</div>
	