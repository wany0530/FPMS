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
      
        <div class="col-md-8 ml-auto mr-auto">
        
          <h2 class="text-center"></h2>
          <p class="text-center">
           
            <a href="#" target="_blank"></a>
                    
         
           <button type="button" id="insertBtn" class="btn btn-primary">
            리스크 등록</button>
            
          </p>
        </div>
        <div class="row mt-5">
          <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <div class="toolbar">
                  <!--        Here you can write extra buttons/actions for the toolbar              -->
                  <!-- 영문을 모르겠어서 한땀한땀 
                  <div id="datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                   <div class="row">
                    <div class="dataTables_length" id="datatable_length">
                     <label>
                      
                      <select name="datatable_length" aria-controls="datatable"
                      class="custom-select-sm form-control form-control-sm">
                       <option value="10">10</option>
                       <option value="25">25</option>
                       <option value="50">50</option>
                       <option value="-1">All</option>
                       </select>
                             
                     </label>
              
                   </div>
                  </div>
                </div>
                 -->
                
                <div class="col-sm-12 col-md-6">
                 <div id="datatable_filter" class="dataTables_filter">
                   <label>
                    <input type="search" class="form-control form-control-sm"
                    placeholder="Search records" aria-controls="datatable">      
                   </label>
                
                  </div>
             
                </div>
                <table id="datatable" class="table table-striped">
                  <thead>
                    <tr class="text-center data" >
                     
                      <th>제목(리스크명)</th>
                      <th>리스크 상태</th>
                      <th>등록자</th>
                      <th>등록일</th>
                     
                    </tr>
                  </thead>
                  <tbody>
                 
                  <c:forEach var="risk" items="${riskList }">
                    <tr class="text-center data" id="${risk.r_no}">
                    
                      <td>${risk.r_name}</td>
                      <td>${risk.rs_name }</td>
                      <td>${risk.r_send}</td>            
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