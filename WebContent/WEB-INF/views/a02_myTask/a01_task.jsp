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
<title>zenkit</title>
<%@ include file="../a01_main/bootstrapTop.jsp"%> 
<style>
#projectRow:hover {
	background: #1E1E28;
	cursor: pointer;
}
.hidden {
	display:none;
	}
.hjheight, .btn-app {
	height:40px;
	margin:0;
}
#no_task_tr {
	height:300px;
}
#taskTable a {
	color: #d1c0e8;
}
#taskTable a:hover {
	color: #FF00DD;
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
				<%@ include file="my_task_header.jsp"%>
				<div class="d-flex justify-content-end mb-3">
				  <div class="col-md-3 " style="float:right;">
                        <select id="statesel" class="selectpicker hjheight" data-size="5" data-style="btn btn-primary" title="Single Select">
                          <option value="" selected>진행상태를 선택하세요</option>
                          <option>시작전</option>
                          <option>지연</option>
                          <option>정상진행</option>
                        </select>
                  </div>
                  <form:form modelAttribute="sch" method="post" class="hidden">
                  	<form:hidden path="p_name"/>
                  	<form:hidden path="j_name"/>
                  	<form:hidden path="ingstate"/>
                  	<form:hidden path="curPage"/>
                  </form:form>
                  <div class="col-md-3 " style="float:right;">
                        <select id="prosel" class="selectpicker hjheight" data-size="5" data-style="btn btn-primary" title="Single Select">
                          <option value="" selected>프로젝트를 선택하세요.</option>
                          <c:forEach var="pros" items="${myPros}">
                          	<option>${pros}</option>
                          </c:forEach>
                        </select>
                  </div>
				  <div class="col-md-3">
                    <div class="input-group m-0 hjheight">
                      <div class="input-group-prepend hjheight">
                        <div class="input-group-text hjheight">
                          <i class="tim-icons icon-zoom-split"></i>
                        </div>
                      </div>
                      <input type="text" id="jobNameSch" class="form-control hjheight" placeholder="Search.." />
                    </div>
                  </div>
					<button class="btn btn-primary btn-app" data-toggle="modal">승인요청</button>
				</div>

				<div class="row">
					<div class="col-md-12">
		            <div class="card">

		              <div class="card-body">
		                  <table class="table table-striped" id="taskTable">
		                  	<colgroup>
	        					<col width="50px">
	        					<col width="20%">
		        				<col width="25%">
		        				<col width="90px">
		        				<col width="80px">
		        				<col width="100px">
		        				<col width="100px">
		        				<col width="100px">
        					</colgroup>
		                    <thead class="text-primary">
		                      <tr>
		                        <th class="text-center">
		                          <div class="form-check">
		                            <label class="form-check-label">
		                              <input id="checkAll" class="form-check-input" type="checkbox">
		                              <span class="form-check-sign"></span>
		                            </label>
		                          </div>
		                        </th>
		                        <th class="text-left">작업</th>
		                        <th class="text-left">프로젝트</th>
		                        <th class="text-center">승인자</th>
		                        <th class="text-center">상태</th>
		                        <th class="text-center">시작일</th>
		                        <th class="text-center">완료일</th>
		                        <th class="text-center">완료율</th>
		                      </tr>
		                    </thead>
		                    <tbody>
		                    <c:if test="${empty taskList}">
		                    	<tr class="text-center" id="no_task_tr">
        							<td colspan="8">데이터가 없습니다</td>
        						</tr>
		                    </c:if>
		                    <c:if test="${!empty taskList}">
		                    <c:forEach var="task" items="${taskList}">
							<c:choose>
			                    <c:when test="${task.ingstate eq '지연'}">
				                    <c:set var="state" value="<span class='badge badge-danger'>지연</span>"/>
				                    <tr class="rate">
			                    </c:when>
			                    <c:when test="${task.ingstate eq '시작전'}">
				                    <c:set var="state" value="<span class='badge badge-default'>시작전</span>"/>
				                    <tr class="nstart">
			                    </c:when>
			                    <c:otherwise>
				                    <c:set var="state" value="<span class='badge badge-success'>정상진행</span>"/>
				                    <tr class="ing">
			                    </c:otherwise>   
							</c:choose>

		                    		<td class="text-center">
	        							<div class="form-check">
	        							<label class="form-check-label">
	        							<input name="checkjno" class="form-check-input jnochk" type="checkbox" value="${task.j_no}">
	        							<span class="form-check-sign">
											<span class="check"></span>
										</span>
										</label>
										</div>
        							</td>
		                    		<td>${task.j_name}</td>
		                    		<td><a href="javascript:goProject(${task.p_no})">${task.p_name}</a></td>
		                    		<td class="text-center">${task.pm_name}</td>
		                    		<td class="text-center task_state">${state}</td>
		                    		<td class="text-center"><fmt:formatDate value="${task.j_startD}" pattern="yyyy.MM.dd"/></td>
		                    		<td class="text-center"><fmt:formatDate value="${task.j_endD}" pattern="yyyy.MM.dd"/></td>
		                    		<td class="text-center">
				                     	<input type="number" name="completeRate${task.j_no}" class="form-control compleInput" 
				                     		min="0" max="100" step="10" value="<fmt:parseNumber value='${task.j_completeR*100}' integerOnly='true'/>"/>
		                    		</td>
		                    	</tr>
		                    </c:forEach>
		                    </c:if>               
		                    </tbody>
		                  </table>
		                 <c:if test="${!empty taskList}">
	        			<nav aria-label="...">
	  						<ul class="pagination justify-content-center">
								<li class="page-item">
									<a class="page-link" href="javascript:goPage(${sch.startBlock-1})" aria-label="Previous">
										<span aria-hidden="true">
											<i class="tim-icons icon-double-left" aria-hidden="true"></i>
										</span>
									</a>
								</li>
								<c:forEach var="cnt" begin="${sch.startBlock}" end="${sch.endBlock}">
									<li class="page-item ${sch.curPage==cnt ? 'active':''}">
										<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a>
									</li>
								</c:forEach>
								<li class="page-item">
									<a class="page-link" href="javascript:goPage(${sch.endBlock+1})" aria-label="Next">
										<span aria-hidden="true">
											<i class="tim-icons icon-double-right" aria-hidden="true"></i>
										</span>
									</a>
								</li>
							</ul>
						</nav>
						</c:if>
		              </div> <%--card-body --%>
		            </div>
		          </div>
				</div>
				<!-- end row -->
					<!-- notice modal -->
					<div class="modal fade" id="authModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-notice">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">
										<i class="tim-icons icon-simple-remove"></i>
									</button>
									<h4 class="modal-title" id="myModalLabel">승인요청</h4>
								</div>
								<div class="modal-body" id="auth-form">
							        <div class="form-group">
								        <label id="authContentLabel" for="auth_content" style="color:#222a42;">승인요청 내용</label>
								        <textarea class="form-control" id="auth_content" rows="7" style="color:#222a42;border:1px solid #2b3553;max-height:150px;"></textarea>
									</div>
							    </div>	
							    <div class="modal-footer">
							       <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							       <button type="button" class="btn btn-primary" id="authreqBtn">저장</button>
							    </div>
							</div>
						</div>
					</div>
				<!-- end notice modal -->
 			</div>
			<!-- End Content -->	
		</div>
	</div>
	<%@ include file="../a01_main/plugin.jsp"%>
	 <%@ include file="../a01_main/bootstrapBottom.jsp"%>
<script>
	$('.navbar-brand').text('내 작업');
	var path="${path}";
	var task = {};
	var schPname="${sch.p_name}";
	if(schPname!="") {
		$('#prosel').val(schPname);
	}
	var schState="${sch.ingstate}";
	if(schState!="") {
		$('#statesel').val(schState);
	}
	function goPage(page) {
		$("[name=curPage]").val(page);
		$("form").submit();
	}
</script>
<script src="${path}/z02_js/myTask.js"></script>
</body>

</html>