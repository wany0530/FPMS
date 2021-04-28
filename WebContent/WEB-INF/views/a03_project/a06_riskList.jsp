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

<head>
  <%@ include file="../a01_main/bootstrapTop.jsp" %>
  <style>
	.riskListTr:hover {
	   background-color: #2c2e43;
	   cursor: pointer; 
	}
	</style>
</head>

<body class="sidebar-mini ">
  <div class="wrapper">
   <%@ include file="../a01_main/sidebar.jsp" %>
    <div class="main-panel">
  <%@ include file="../a01_main/header.jsp"%>
        
        <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            
                <i class="tim-icons icon-simple-remove"></i>
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- End Navbar -->
      <div class="content">
   
        <div class="row mt-5">
          <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                 <!--   <div class="row mb-3"> -->
                   <form:form modelAttribute="sch" method="post" class="row mb-3">
                   	<form:hidden path="curPage"/>
					<div class="col-md-5 pr-0">
	                    <div class="input-group m-0" style="top: 5px;">
	                      <div class="input-group-prepend">
	                        <div class="input-group-text">
	                          <i class="tim-icons icon-zoom-split"></i>
	                        </div>
	                      </div>
	                      <form:input path="r_name" class="form-control" placeholder="검색"/>
	                    </div>
					</div>
					<div class="col-md-7 text-left p-0">
						<button class="btn btn-simple btn-behance">검 색</button>
						<button type="button" id="insertBtn" class="btn btn-simple btn-dribbble" style="position:absolute;right:20px;">
                          리스크 등록</button>
					</div>
					</form:form>
				
<!-- 					
					<div class="col-12 col-md-2 ml-auto text-right">
					
					</div> 
					
				</div>-->
                <div class="toolbar">
                 
<%--                 <div class="col-sm-12 col-md-6">
                 <div id="datatable_filter" class="dataTables_filter">
                   <label>
                    <input type="hidden" name="p_no" value="${risk.p_no}">
                   </label>
                
                  </div>
             
                </div> --%>
                <table id="datatable" class="table">
                	<colgroup>
                		<col width="35%">
                		<col width="35%">                		
                	</colgroup>
                	
                  <thead>
                    <tr class="text-center data" >
                      <th>리스크 명</th>
                      <th>프로젝트 명</th>
                      <th>리스크 상태</th>
                      <th>등록자</th>
                      <th>등록일</th>  
                    </tr>
                  </thead>
                  <tbody>
                 
                  <c:forEach var="risk" items="${riskList }">
                    <tr class="text-center data riskListTr" id="${risk.r_no}">
                  
                      <td>${risk.r_name}</td>
                      <td>${risk.p_name}</td>
                      <td>${risk.rs_name }</td>
                      <td>${risk.u_name}</td>        
                      <td><fmt:formatDate value="${risk.r_regdate}"/>
                      </td>
                     
                    </tr>
                    
                    </c:forEach>
                   
                </tbody>
                </table>
                
              </div>
              <!-- end content-->
            </div>
            <!--  end card  -->
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
						<a class="page-link" href="javascript:goPage(${cnt})">${cnt} ${sch.curPage==cnt ? '<span class="sr-only">(current)</span>':''}</a>
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
            
          </div>
          <!-- end col-md-12 -->
        </div>
        <!-- end row -->
       
      </div>
     
    </div>
  </div>
  </div>
 <%@ include file="../a01_main/plugin.jsp" %>
 <%@ include file="../a01_main/bootstrapBottom.jsp" %>

<script type="text/javascript">
$('.navbar-brand').text('리스크');
$(document).ready(function(){
	$("#insertBtn").click(function(){
		location.href="${path}/zenkit.do?method=riskInsertForm"
	});
	$("#detailBtn").click(function(){
		location.href="${path}/detailRisk"
	});
	$(".riskListTr").click(function(){
		var r_no=$(this).attr("id");
		console.log(r_no);
		location.href="${path}/zenkit.do?method=detail&r_no="+r_no;
	});
});
function goPage(page) {
	$("[name=curPage]").val(page);
	$("form").submit();
}
</script>
</body>
</html>