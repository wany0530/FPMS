<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="form"
      uri="http://www.springframework.org/tags/form"%>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html lang="en">

<head>
  <%@ include file="../a01_main/bootstrapTop.jsp" %>
  
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
                   <div class="row mb-3">
					<div class="col-12 col-md-3 pr-0">
                    <div class="input-group m-0" style="top: 5px;">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="tim-icons icon-zoom-split"></i>
                        </div>
                      </div>
                      <input type="text" name="schWord" value=""
                      	class="form-control" placeholder="검색"/>
                    </div>
					</div>
					<div class="col-12 col-md-2 text-left p-0">
						<button class="btn btn-simple btn-behance">검 색</button>
						&nbsp;
						
						 <button type="button" id="insertBtn" class="btn btn-simple btn-dribbble">
                          리스크 등록</button>
					</div>
					
					<div class="col-12 col-md-2 ml-auto text-right">
					
					</div>
					
				</div>
              
                <div class="toolbar">
                 
                <div class="col-sm-12 col-md-6">
                 <div id="datatable_filter" class="dataTables_filter">
                   <label>
                    
                    <input type="hidden" name="p_no" value="${risk.p_no}">
                   </label>
                
                  </div>
             
                </div>
                <table id="datatable" class="table table-striped">
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
                    <tr class="text-center data" id="${risk.r_no}">
                  
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
								
								
								
								
									<!-- 이전 버튼 -->
									<li class="page-item">
										<button class="page-link" aria-label="Previous" disabled>
											<span aria-hidden="true">
												<i class="tim-icons icon-double-left" aria-hidden="true"></i>
											</span>
										</button>
									</li>
									
									<!-- 페이지 버튼 -->
									
										<li class="page-item active">
											<button class="page-link">
												1
											</button>
										</li>
									
										<li class="page-item ">
											<button class="page-link">
												2
											</button>
										</li>
									
										<li class="page-item ">
											<button class="page-link">
												3
											</button>
										</li>
									
										<li class="page-item ">
											<button class="page-link">
												4
											</button>
										</li>
									
										<li class="page-item ">
											<button class="page-link">
												5
											</button>
										</li>
									
									
									<!-- 다음 버튼 -->									
									<li class="page-item">
										<button class="page-link" aria-label="Next" disabled>
											<span aria-hidden="true">
												<i class="tim-icons icon-double-right" aria-hidden="true"></i>
											</span>
										</button>
									</li>
									
								</ul>
            
          </div>
          <!-- end col-md-12 -->
          
          
        </div>
        <!-- end row -->
       
      </div>
     
    </div>
  </div>
 <%@ include file="../a01_main/plugin.jsp" %>
 <%@ include file="../a01_main/bootstrapBottom.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#insertBtn").click(function(){
		location.href="${path}/zenkit.do?method=riskInsertForm"
	});
	$("#detailBtn").click(function(){
		location.href="${path}/detailRisk"
	});
	$(".data").dblclick(function(){
		var r_no=$(this).attr("id");
		console.log(r_no);
		
		location.href="${path}/zenkit.do?method=detail&r_no="+r_no;
	});
});
</script>
</body>
</html>