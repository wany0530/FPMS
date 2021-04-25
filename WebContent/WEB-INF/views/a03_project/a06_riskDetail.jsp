<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="../a01_main/bootstrapTop.jsp" %>
 <link href="${path}/z01_css/riskDetail.css" rel="stylesheet" />
</head>
<%
   pageContext.setAttribute("cn", "\n");
%>
<body class="sidebar-mini ">
<div class="wrapper">
   <%@ include file="../a01_main/sidebar.jsp" %>
   <div class="main-panel">
   <%@ include file="../a01_main/header.jsp" %>
   <!-- End Navbar -->
      <div class="content"> <!-- id="TypeValidation" -->
      <div class="row">
         <div class="col-lg-6 risk-card">
         <!-- 리스크상세정보 -->
         <div class="card">
            <div class="card-header">
               <h3 class="risk-title">리스크 상세 정보</h3>
            </div>
            <div class="card-body">
               <div class="riskactionList_container">
               <form method="post" id="riskForm">
                  <input type="hidden" name="proc"/>
                  <input type="hidden" name="r_no" value="${risk.r_no}">
                  <div class="row">
                     <label class="col-sm-2 col-form-label text-right">제목</label>
                     <div class="col-sm-10">
                        <div class="form-group">
                           <input name="r_name" class="form-control" value="${risk.r_name}">
                        </div>
                     </div>
                  </div>
                  <div class="row">
                      <label class="col-sm-2 col-form-label text-right">프로젝트명</label>
                     <div class="col-sm-10">
                        <div class="form-group">
                           <div class="form-control">${risk.p_name}</div>           
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <label class="col-sm-2 col-form-label text-right">등록자</label>
                     <div class="col-sm-4">
                        <div class="form-group">
                           <div class="form-control">${risk.r_send}</div>
                         </div>
                     </div>
                     <label class="col-sm-2 col-form-label text-right">등록일</label>
                     <div class="col-sm-4">
                        <div class="form-group">
                           <div class="form-control"><fmt:formatDate value="${risk.r_regdate}"/></div>
                           </div>
                        </div> 
                     </div>
                  <div class="row">
                     <label class="col-sm-2 col-form-label text-right">리스크 내용</label>
                     <div class="col-sm-10">
                        <div class="form-group">
                           <textarea name="r_content" rows="10" class="form-control" placeholder="내용을 입력하세요" 
                                     style="color:#D4D4D8;border:1px solid #2b3553;max-height:200px;">${risk.r_content}</textarea>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <label class="col-sm-2 col-form-label text-right">리스크 상태</label>
                     <div class="col-sm-4">
                        <div class="form-group">
                           <div class="form-control">${risk.rs_name}</div>
                        </div>
                     </div>
                  </div>
                  <h3 class="risk-title rt">조치 정보</h3>
                  <div class="row">
                     <label class="col-sm-2 col-form-label text-right">조치자</label>
                     <div class="col-sm-4">
                        <div class="form-group">
                           <select name="r_receive" class="selectpicker" id="r_receive">
                                      <option value="0">조치자 선택 </option>
                                      <c:forEach var="getUser" items="${getUsers}">
                                      <option value="${getUser.u_id}">${getUser.u_name}</option>
                                      </c:forEach>
                                   </select>
                        </div>
                     </div>
                     <label class="col-sm-2 col-form-label text-right">대응전략</label>
                     <div class="col-sm-4">
                        <div class="form-group">
                           <select name="r_strat" class="selectpicker" id="r_strat">
                                      <option value="">대응전략 선택</option>
                                      <c:forEach var="rs" items="${resStrategies}">
                                      <option>${rs.title}</option>
                                      </c:forEach>
                                   </select>
                        </div>
                     </div>
                  </div>
                  <div class="row riskBtn">
                     <div class="col-sm-12">
                        <button type="button" id="listBtn" class="btn btn-success btn-sm btn-simple">리스크 목록</button>
                        <c:if test="${pmNumber==sesMem.u_no}">
                        <c:if test="${risk.rs_name ne '조치완료'}">
                        <button type="submit" id="uptBtn" class="btn btn-info btn-sm btn-simple">수정</button>
                        </c:if>
                        <button type="button" id="delBtn" class="btn btn-warning btn-sm btn-simple">삭제</button>
                        </c:if>
                     </div>
                  </div>
               </form>
               </div>
            </div> <!-- cardbody -->
         </div>
         </div>
         <!-- 조치내용 -->
         <div class="col-lg-6 risk-card">
         <div class="card">
            <div class="card-header">
               <h3 class="risk-title">조치내용</h3>
                  </div>
            <div class="card-body">
               <div class="riskactionList_container">
                  <div class="row riskaction_form">
                     <div class="formBox">
                        <form id="raForm" method="post" action="${path}/zenkit.do?method=riskActionInsert">
                           <input type="hidden" name="ac_receive" value="${sesMem.u_id}">
                           <input type="hidden" name="ac_name">
                           <input type="hidden" name="ac_state">
                           <input type="hidden" name="r_no" value="${risk.r_no}">
                        </form>
                        <div class="formBox_header">
                           <div class="writer">${sesMem.u_name}</div>
                           <div class="datetime"></div>
                           <div class="state-selector">
                              <div class="selborder">
                                 <select class="selectpicker" id="raState" data-style="btn btn-primaty" title="리스크상태를 선택하세요">
                                    <option>진행</option>
                                    <option>홀드</option>
                                    <c:if test="${sesMem.u_no==pmNumber || sesMem.u_id==risk.r_receive}">
                                    <option>조치완료</option>         
                                    </c:if>                     
                                 </select>
                              </div>
                           </div>
                        </div>
                        <textarea rows="10" class="form-control ratextarea" placeholder="조치내용을 입력하세요" 
                           style="color:#D4D4D8;border:none;max-height:100px;padding:10px 15px;"></textarea>
                     </div>
                     <div class="col-md-12 riskaction_btn">
                        <c:choose>
                        <c:when test="${sesMem.u_no==pmNumber || sesMem.u_id==risk.r_receive }">
                        <button type="button" id="rainsBtn" class="btn btn-primary btn-simple" style="float:right;">조치내용 등록</button>
                        </c:when>
                        <c:when test="${risk.rs_name eq '조치완료'}"><div style="height:48px;"></div></c:when>
                        <c:otherwise><div style="height:48px;"></div></c:otherwise>
                        </c:choose>
                     </div>
                  </div>
                  <div class="riskaction_scroll">
                     <div class="riskactionList">
                        <c:if test="${!empty riskactionList}">
                        <c:forEach var="riskaction" items="${riskactionList}">
                           <div class="riskaction">
                           <h4>${riskaction.ac_receive}<span class="riskaction_date"><fmt:formatDate value="${riskaction.ac_date}"/></span></h4>
                           <div class="row">
                              <div class="riskactionState">
                              <c:if test="${riskaction.ac_state eq '진행'}">
                                 <span class="badge badge-info">진행</span>
                              </c:if>
                              <c:if test="${riskaction.ac_state eq '조치완료'}">
                                 <span class="badge badge-success">조치완료</span>
                              </c:if>
                              <c:if test="${riskaction.ac_state eq '홀드'}">
                                 <span class="badge badge-warning">홀드</span>
                              </c:if>
                              </div>
                              <div class="col-md-8 riskactionName">${fn:replace(riskaction.ac_name, crcn, '<br/>')}</div>
                           </div>
                           </div>
                        </c:forEach>
                        </c:if>
                        <%-- 
                        <div class="riskaction">
                           <h4>김나영<span class="riskaction_date">2021-04-02</span></h4>
                           <div class="row">
                           <div class="riskactionState"><span class="badge badge-success">조치완료</span></div>
                           <div class="col-md-8 riskactionName">리스크 조치 완료 하였습니다.<br>고칠게너무많았네요 ^^</div>
                           </div>
                        </div>
                        <div class="riskaction">
                           <h4>조치자<span class="riskaction_date">2021-04-02</span></h4>
                           <div class="row">
                           <div class="riskactionState"><span class="badge badge-info">진행</span></div>
                           <div class="col-md-8 riskactionName">리스크 조치 진행합니다.</div>
                           </div>
                        </div>
                        <div class="riskaction">
                           <h4>조치자<span class="riskaction_date">2021-04-02</span></h4>
                           <div class="row">
                           <div class="riskactionState"><span class="badge badge-warning">홀드</span></div>
                           <div class="col-md-8 riskactionName">리스크 홀드합니다.</div>
                           </div>
                        </div>
                        --%>
                     </div>   
                  </div>
               </div>
            </div>
         </div>
         </div>
      </div>
      </div>
   </div>
</div> 
<%@ include file="../a01_main/plugin.jsp" %>
<%@ include file="../a01_main/bootstrapBottom.jsp" %>
<script type="text/javascript">
var receive = "${risk.r_receive}";
if(receive!="") {
   $('#r_receive').val(receive);
}
var strategy = "${risk.r_strat}";
if(strategy!="") {
   $('#r_strat').val(strategy);
}
$(document).ready(function(){
   selectBtnCss();    
   
   
   $("#rainsBtn").click(function(){
      if(strategy=="") {
         alert('대응전략이 등록되지 않았습니다.');
         return;
      }
      if($('#raState').val()=="") {
         alert('조치상태를 선택해주세요');
         return;
      }
      if($('.ratextarea').val()=="") {
         alert('조치내용을 입력해주세요');
         return;
      }
      $('[name=ac_name]').val($('.ratextarea').val());
      $('[name=ac_state]').val($('#raState').val());
     // $('#raForm').attr('action', '${path}/zenkit.do?method=riskActionInsert');
      $('#raForm').submit();
   });
    
    $("#uptBtn").click(function(){
       var r_send = $("[name=r_send]").val();
       if(confirm("수정하시겠습니까?")){
          $("[name=proc]").val("upt");
          $("#riskForm").attr("action","${path}/zenkit.do?method=update");
          $("#riskForm").submit();
       }
    });
    
    $("#delBtn").click(function(){
       var r_send = $("[name=r_send]").val();
       
       if(confirm("삭제하시겠습니까?")){
       $("[name=proc]").val("del");
       //   alert($("[name=r_no]").val());
       
        $("#riskForm").attr("action","${path}/zenkit.do?method=delete");
        $("#riskForm").submit();
       }
    });
    
   var proc="${param.proc}";
    if(proc=="upt"){
      alert("수정되었습니다.");
      $(location).attr("href","${path}/zenkit.do?method=detail&r_no="+${param.r_no});
    }
    if(proc=="del"){
       alert("삭제되었습니다.\n 조회화면으로 이동합니다.");
      $(location).attr("href","${path}/zenkit.do?method=riskList");
      }
    
 });
   
   var todaydate = new Date();
//   $('.formBox_header .datetime').text(todaydate.getFullYear() + '-' + (todaydate.getMonth()+1) + '-' + todaydate.getDate());
   $('.formBox_header .datetime').text(todaydate.toLocaleDateString());
   function selectBtnCss() {
      $('.selborder .bs-placeholder').css('border', 'none');
       $('.selborder .bs-placeholder').css('margin', '0');
       $('.selborder .bs-placeholder').css('height', '51px');
       $('.selborder .bs-placeholder').css('line-height', '32px');
       $('.selborder .bs-placeholder').css('padding-left', '20px');
   }
   $('#listBtn').click(function(){
      location.href='${path}/zenkit.do?method=riskList';
   });
   $('textarea').focus(function(){
      $(this).css('border', '1px solid #e14eca');
   });
   $('textarea').blur(function(){
      if($(this).attr('class')=='form-control ratextarea'){
         $(this).css('border', 'none');
      } else {
         $(this).css('border', '1px solid #2b3553');
      }
   });
   
 </script>
</body>
</html>