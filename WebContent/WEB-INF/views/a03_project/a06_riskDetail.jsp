<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
 <%@ include file="../a01_main/bootstrapTop.jsp" %>
</head>

<body class="sidebar-mini ">
  <div class="wrapper">
  <%@ include file="../a01_main/sidebar.jsp" %>
   <div class="main-panel">
    <%@ include file="../a01_main/header.jsp" %>
      
     
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
        <div class="row">
          <div class="col-md-6">
           
          </div>
         
          <div class="col-md-12"> <!-- id="TypeValidation" -->
            <form  class="form-horizontal"  method="post" >
              <input type="hidden" name="proc"/>
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">리스크 상세 정보[${param.r_no}]</h4>
                </div>
                <div class="card-body">
                 
                 <div class="row">
                    <label class="col-sm-2 col-form-label">리스크번호</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                        <input name="r_no" class="form-control" value="${risk.r_no }" >
                                              
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code>*필수</code>
                    </label>
                  </div>
                  <div class="row">
                    <label class="col-sm-2 col-form-label">작업번호</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                        <input name="j_no" class="form-control" value="${risk.j_no }" >
                                              
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code>*필수</code>
                    </label>
                  </div>
               
                  <div class="row">
                    <label class="col-sm-2 col-form-label">제목</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                        <input name="r_name" class="form-control" value="${risk.r_name }">
                                              
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code>*필수</code>
                    </label>
                  </div>
                  
                     <div class="row">
                    <label class="col-sm-2 col-form-label">등록자</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                       <input name="r_send" class="form-control" value="${risk.r_send }">
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code>*필수</code>
                    </label>
                  </div>
                
                   <div class="row">
                    <label class="col-sm-2 col-form-label">리스크 내용</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                       <textarea name="r_content" rows="10" class="form-control" placeholder="내용을 입력하세요">
                        ${risk.r_content }</textarea>
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code></code>
                    </label>
                  </div>
                
                   <div class="row">
                    <label class="col-sm-2 col-form-label">등록일</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                    
                         <input type="text" name="r_regdate" class="form-control" value="<fmt:formatDate value="${risk.r_regdate}"/>" />
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code>*필수</code>
                    </label>
                  </div>
                  <div class="row">
                    <label class="col-sm-2 col-form-label">리스크 상태</label>
                    <div class="col-sm-3">
                      <div class="form-group">
                        <input class="form-control" type="text" name=rs_name value="${risk.rs_name }"/>
                      </div>
                    </div>
                    
                    <label class="col-sm-4 label-on-right">
                      <code></code>
                      
                    </label>
                    
                  </div>
                  
                </div>
               
                <div class="card-footer text-center">
                    <button type="submit" id="insBtn" class="btn btn-primary">조치내용 등록</button>
                  &nbsp; &nbsp;    
                 
                  <button type="submit" id="uptBtn" class="btn btn-primary">수정</button>
                  &nbsp; &nbsp;    
                 
                   <button  id="delBtn" class="btn btn-primary">삭제</button>
                </div>
              </div>
              </form>
            </div>
             
          </div>
          <div class="col-md-12">
          
          </div>
          
        </div>
         
      </div>
      
   
  <%@ include file="../a01_main/plugin.jsp" %>
 <%@ include file="../a01_main/bootstrapBottom.jsp" %>
 <script type="text/javascript">
 
 $(document).ready(function(){
	 $("#insBtn").click(function(){
		 	alert("조치내용 등록 화면으로 이동합니다.");
	 });
	 
	 
    $("#uptBtn").click(function(){
    	var r_send = $("[name=r_send]").val();
    	if(confirm("수정하시겠습니까?")){
    		$("[name=proc]").val("upt");
    		$("form").attr("action","${path}/zenkit.do?method=update");
    		$("form").submit();
    	}
    });
    
    $("#delBtn").click(function(){
    	var r_send = $("[name=r_send]").val();
    	
    	if(confirm("삭제하시겠습니까?")){
    	$("[name=proc]").val("del");
    	//   alert($("[name=r_no]").val());
    	
    	 $("form").attr("action","${path}/zenkit.do?method=delete");
    	 $("form").submit();
    	}
    });
    
   var proc="${param.proc}";
    if(proc=="upt"){
    	if(confirm("수정되었습니다.\n 조회 화면으로 이동하시겠습니까?")){
    		$(location).attr("href","${path}/zenkit.do?method=riskList");
    	}
    }
    if(proc=="del"){
    	alert("삭제되었습니다.\n 조회화면으로 이동합니다.");
	   $(location).attr("href","${path}/zenkit.do?method=riskList");
      }
 });
 
 </script>
</body>
</html>