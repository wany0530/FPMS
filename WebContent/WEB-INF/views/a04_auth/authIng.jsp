<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<fmt:requestEncoding value="utf-8"/> 
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../a01_main/bootstrapTop.jsp" %>
  <link href="${path}/z01_css/auth.css" rel="stylesheet" />
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
        			<form:form modelAttribute="sch" method="post" class="form-row">
        				<form:hidden path="curPage"/>
        			<div class="col-md-3">
        				<div class="dropdown bootstrap-select">
        					<form:select path="pro_name" class="selectpicker" data-size="7" data-style="btn btn-primary">
        						<option class="bs-title-option" value="">프로젝트를 선택하세요</option>
        						<form:options items="${pmPros}"/>
        					</form:select>
<%--        					<form:select path="pro_name" items="${pros}" class="selectpicker" data-size="7" data-style="btn btn-primary"/>
         					<select class="selectpicker" data-size="7" data-style="btn btn-primary">
        						<option class="bs-title-option">프로젝트를 선택하세요</option>
        						<option>프로젝트1</option>
        						<option>프로젝트2</option>
        					</select>--%>
        				</div>
        			</div>
        			<div class="col-md-4">
        				<div class="input-group">
        					<div class="input-group-prepend" style="height:40.67px">
    					       <div class="input-group-text">
       					  	     <i class="tim-icons icon-zoom-split"></i>
       						    </div>
       						</div>
	        				<form:input path="job_name" class="form-control auth-search-input" placeholder="Search.."/>
	        				<button type="submit" class="btn btn-primary btn-sm auth-search-btn">검색</button>
	        			</div>
        			</div>
        			<div class="col-md-5">
        				<div class="auth-align-right">
        					<button type="button" class="btn btn-primary btn-sm btn-app" data-toggle="modal">작업승인</button><%--#authModal --%>
        					<button type="button" class="btn btn-primary btn-sm btn-app" data-toggle="modal">작업반려</button>
	        				<!-- Modal -->
							<div class="modal fade" id="authModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h4 class="modal-title" id="authModalLabel">작업승인</h4>
							        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							          <i class="tim-icons icon-simple-remove"></i>
							        </button>
							      </div>
							      <div class="modal-body" id="auth-form">
							        <div class="form-group">
								        <label id="authContentLabel" for="auth_content" style="color:#222a42;">작업승인 내용</label>
								        <textarea class="form-control" id="auth_content" rows="7" style="color:#222a42;border:1px solid #2b3553;max-height:150px;"></textarea>
									</div>
							      </div>	
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-primary" id="authBtn">저장</button>
							      </div>
							    </div>
							  </div>
							</div>
        				</div>
        				
        			</div>
        			</form:form>
       <%--  			</div>--%>
        			
        		</div>
        		<div class="card-body">
        			<table class="table" id="auth-table">
        				<colgroup>
        					<col style="width:50px">
        					<col style="width:25%">
        					<col style="width:30%">
        					<col style="width:100px">
        					<col style="width:150px">
        					<col style="width:110px">
        				</colgroup>
        				<thead>
        					<tr>
        						<th>
        							<div class="form-check">
        							<label class="form-check-label">
        							<input id="checkAll" class="form-check-input" type="checkbox">
        							<span class="form-check-sign">
										<span class="check"></span>
									</span>
									</label>
									</div>
        						</th>
        						<th>결재작업</th>
        						<th>프로젝트</th>
        						<th>상태</th>
        						<th>결재요청자</th>
        						<th>요청완료율(%)</th>
        						<th>결재요청일</th>
        					</tr>
        				</thead>
        				<tbody id="authTableBody">
        					<c:if test="${empty authList}">
        						<tr class="text-center" id="no_task_tr">
        							<td colspan="7">데이터가 없습니다</td>
        						</tr>
        					</c:if>
        					<c:if test="${!empty authList}">
        					<c:forEach var="auth" items="${authList}">
        					<tr data-ano="${auth.a_no}" data-jno="{'j_no':${auth.j_no}}">
        						<td class="text-center">
        							<div class="form-check">
        							<label class="form-check-label">
        							<input name="checkano" class="form-check-input" type="checkbox" value="${auth.a_no}" data-compler="${auth.a_requestP}" data-jno="${auth.j_no}">
        							<span class="form-check-sign">
										<span class="check"></span>
									</span>
									</label>
									</div>
        						</td>
        						<td style="padding-left:20px;"><%--<a href="#">작업명</a> --%>
        							<a href="javascript:void(0)" class="jno_${auth.j_no}" id="btnWorkTab" data-toggle="modal" data-target=".bd-example-modal-lg">${auth.job_name}</a>
        						</td>
        						<td style="padding-left:20px;"><a href="javascript:goProject(${auth.p_no})">${auth.pro_name}</a></td>
         						<td class="text-center"><span class="badge badge-success">${auth.a_name}</span></td>
        						<td class="text-center">${auth.req_name}</td>
        						<td class="text-center">${auth.a_requestP}%</td>
        						<td class="text-center"><fmt:formatDate value="${auth.a_date}" pattern="yyyy.MM.dd"/></td>
        					</tr>
        					</c:forEach>
        					</c:if> 
        				</tbody>
        			</table>
        			<c:if test="${!empty authList}">
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
        		</div>
        	</div>
        </div>
      </div>
      <%-- 작업정보창(모달) --%>
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
			      				<span id="task_completeP" class="form-control"></span>
			      			</div>
			      			<label class="col-lg-2 col-form-label text-right">승인자</label>
			      			<div class="col-lg-3">
			      				<span id="task_resName" class="form-control"></span>
			      			</div>
			      		</div>
			      		<div class="form-group row">
			      			<label class="col-lg-2 col-form-label text-right">메모</label>
			      			<div class="col-lg-8">
			      				<textarea class="form-control" id="task_memo" rows="7" style="color:#222a42;border:1px solid #2b3553;max-height:200px;" readonly></textarea>
			      			</div>
			      		</div>
		      		</div>
		      		<%-- 산출물 --%>
		      		<div class="tab-pane" id="tab_1_2">
		      			<div class="grid-template-row">
		      				<div class="row grid-row">
		      					<div class="col-md-7">
		      						<div class="forum-list-title" id="task_outputname">파일제목</div>
		      						<div class="font-s13 text-muted">업로드자명 on 업로드일&nbsp;&nbsp;file size</div>
		      					</div>
		      					<div class="col-md-4" style="max-width: 32%;">
		      						<a href="${path}/" class="btn-label-brand btn btn-sm" title="파일 다운로드">
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
		      				<div class="col-md-10">
		      					<span class="badge badge-primary">기안자</span><span id="modal_reqName"></span>
	      					</div>
	      					<div class="col-md-10">
	      						<span id="modal_reqN"></span>
	      					</div>
		      			</div>
		      			<div class="row grid-row">
		      				<div class="col-md-10">
		      					<span class="badge badge-info">결재자</span><span id="modal_resName"></span>
	      					</div>
	      					<div class="col-md-10">
	      						<span id="modal_resN"></span>
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
    </div>
  </div>
  <%@ include file="../a01_main/plugin.jsp" %>
  <%@ include file="../a01_main/bootstrapBottom.jsp" %>
  <script src="${path}/z02_js/auth.js"></script>
<script>
	var path="${path}";
	$('.navbar-brand').text('결재진행함');
	function goPage(page) {
		$("[name=curPage]").val(page);
		$("form").submit();
	}
</script>
</body>

</html>