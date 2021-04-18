<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../a01_main/bootstrapTop.jsp"%>
	<style>
	.project-item:hover {
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
				
				<div class="row mb-3">
					<div class="col-12 col-md-3 pr-0">
                    <div class="input-group m-0" style="top: 5px;">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="tim-icons icon-zoom-split"></i>
                        </div>
                      </div>
                      <input type="text" name="schWord" value="${schObject.schWord}"
                      	class="form-control" placeholder="Search.."/>
                    </div>
					</div>
					<div class="col-12 col-md-2 text-left p-0">
						<button class="btn">검 색</button>
					</div>
					<c:if test="${sesMem.pos_no == 3}">
					<div class="col-12 col-md-2 ml-auto text-right">
						<button class="btn btn-primary"
							onclick="location.href='${path}/project.do?method=regForm'">
							프로젝트 등록
						</button>
					</div>
					</c:if>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<form id="proForm" method="post">
								<input type="hidden" name="p_no" value=""/>
								<table id="simple-table" class="table text-center">
									<colgroup>
										<col width="30%">
										<col width="20%">
										<col width="15%">
										<col width="15%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th>프로젝트</th>
											<th>프로젝트 코드</th>
											<th>시작일</th>
											<th>완료일</th>
											<th>산출물</th>
											<th>이슈</th>
										</tr>
									</thead>
									
									<tbody id="project-list">
									</tbody>
									
								</table>
								</form>
								
								<!-- 페이징 -->
								<ul class="pagination justify-content-center">
								<c:set var="page" value="${(empty schObject.currPage)?1:schObject.currPage}" />
								<c:set var="startNum" value="${page-(page-1)%5}"/>
								<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(schObject.count/10), '.')}"/>
								
									<!-- 이전 버튼 -->
									<li class="page-item">
										<button class="page-link" aria-label="Previous" ${(startNum <= 1)?'disabled':''}>
											<span aria-hidden="true">
												<i class="tim-icons icon-double-left" aria-hidden="true"></i>
											</span>
										</button>
									</li>
									
									<!-- 페이지 버튼 -->
									<c:forEach begin="${startNum}" end="${startNum+4}" varStatus="status">
										<li class="page-item ${(page) == (status.current)?'active':''}">
											<button class="page-link">
												${status.index}
											</button>
										</li>
									</c:forEach>
									
									<!-- 다음 버튼 -->									
									<li class="page-item">
										<button class="page-link" aria-label="Next" ${(lastNum <= startNum+4)?'disabled':''}>
											<span aria-hidden="true">
												<i class="tim-icons icon-double-right" aria-hidden="true"></i>
											</span>
										</button>
									</li>
									
								</ul>
								
							</div>
							<!-- end content-->
						</div>
						<!--  end card  -->
					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->
      	</div>
			<!-- End Content -->

		</div>
	</div>
	<script src="${path}/assets/js/core/jquery.min.js"></script>
	<script>
	// 프로젝트 리스트 읽어오기
	var sch = $('[name=sch]').val();
	
	$.ajax({
		type:"post",
		url:"${path}/project.do?method=data",
		/* data:$('form').serialize(), */
		dataType:"json",
		success:function(data){
			console.log(data);
			var projectList = data.projectList;
			
			var show = "";
			$.each(projectList, function(idx, pro){
				show += "<tr class='project-item'><td>"+pro.p_name+"</td>";
				show += "<td>"+pro.p_no+"</td>";
				show += "<td>"+pro.p_startD_s+"</td>";
				show += "<td>"+pro.p_endD_s+"</td>";
				show += "<td>"+5+"</td>";
				show += "<td>"+5+"</td></tr>";
			});
			$('#project-list').html(show);
		},
		error:function(err){
			console.log(err);
		}
	});
	</script>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
	
	<script>
	$(document).ready(function() {
		// 프로젝트 상세 클릭
		$('.project-item').on('click',function(){
			var p_no = $(this).children().eq(1).text();
			$('[name=p_no]').val(p_no);
			$('#proForm').submit();
		});
	});
	</script>
</body>
</html>