<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sidebar">
   <div class="sidebar-wrapper" style="overflow: hidden;">
      <div class="logo">
      
          <a href="javascript:void(0)" class="simple-text logo-mini">
            <img src="${path}/assets/img/logo_symbol.png" />
          </a>
          <a href="javascript:void(0)" class="simple-text logo-normal">
            zenkit
          </a>
        </div>
        <ul class="nav">
        
          <li>
            <a data-toggle="collapse" href="#pagesExamples">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p class="title">
                대시보드
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="pagesExamples">
              <ul class="nav">
         	    <c:if test="${sesMem.pos_no > 2}">
                <li>
                  <a href="${path}/dashboard.do?method=personalList">
                    <span class="sidebar-mini-icon">PE</span>
                    <span class="sidebar-normal title"> 개인 대시보드 </span>
                  </a>
                </li>
                <li>
                  <a href="${path}/dashboard.do?method=projectList">
                    <span class="sidebar-mini-icon">PJ</span>
                    <span class="sidebar-normal title"> 프로젝트 대시보드 </span>
                  </a>
                </li>    
                </c:if>
                <c:if test="${sesMem.pos_no <= 2}">
	                <li>
	                  <a href="${path}/dashboard.do?method=personalList">
	                    <span class="sidebar-mini-icon">CS</span>
	                    <span class="sidebar-normal title"> 종합 대시보드 </span>
	                  </a>
	                </li>
	                <li>
	                  <a href="${path}/dashboard.do?method=departList">
	                    <span class="sidebar-mini-icon">DP</span>
	                    <span class="sidebar-normal title"> 부서 대시보드 </span>
	                  </a>
	                </li>   
                </c:if>
              </ul>
            </div>
          </li>
          
          <c:if test="${sesMem.pos_no == 4}">
          <li>
            <a href="${path}/mytask.do?method=task">
              <i class="tim-icons icon-single-02"></i>
              <p class="title">
                내 작업
              </p>
            </a>                      
          </li>
          </c:if>
          
          <c:if test="${sesMem.pos_no > 2}">
          <li>
            <a  href="${path}/calendar.do?method=list">
              <i class="tim-icons icon-components"></i>
              <p class="title">
                일정 관리
              </p>
            </a>                      
          </li>
          </c:if>
          
          <c:if test="${sesMem.pos_no > 2}">
          <li>
            <a href="${path}/project.do?method=form">
              <i class="tim-icons icon-notes"></i>
              <p class="title">
                프로젝트
              </p>
            </a>                      
          </li>         
          </c:if>
          <c:if test="${sesMem.pos_no > 2}">
          <li>
            <a data-toggle="collapse" href="#tablesExamples">
              <i class="tim-icons icon-bullet-list-67"></i>
              <p class="title">
                결재
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="tablesExamples">
              <ul class="nav">
              	 <c:if test="${sesMem.pos_no == 3}">
					 <li>
                  <a href="${path}/authIng.do">
                    <span class="sidebar-mini-icon">PA</span>
                    <span class="sidebar-normal title"> 결재진행함 </span>
                  </a>
                </li>
                <li>
                  <a href=" ${path}/authApp.do">
                    <span class="sidebar-mini-icon">CA</span>
                    <span class="sidebar-normal title"> 결재완료함</span>
                  </a>
                </li>
                <li>
                  <a href=" ${path}/authRej.do">
                    <span class="sidebar-mini-icon">RA</span>
                    <span class="sidebar-normal title"> 결재반려함</span>
                  </a>
                </li>
                </c:if>
                <c:if test="${sesMem.pos_no == 4}">
                <li>
                  <a href="${path}/authReq.do">
                    <span class="sidebar-mini-icon">RA</span>
                    <span class="sidebar-normal title"> 결재요청함</span>
                  </a>
                </li>
                </c:if>
              </ul>
            </div>
          </li>
          </c:if>
          
			<!-- 리스크 -->
			<c:if test="${sesMem.pos_no > 2}">
				<li class="nav-item mr-1">
					<a href="${path}/zenkit.do?method=riskList">
						<i class="tim-icons icon-alert-circle-exc"></i> 
						<p class="title">리스크</p>
					</a>
				</li>
			</c:if>
          
          <c:if test="${sesMem.pos_no == 2}">
          <li>
				<a href="${path}/department.do?method=form">
					<i class="tim-icons icon-vector"></i>
					<p class="title">부서 관리</p>
				</a>
			</li>
			<li>
				<a href="${path}/user.do?method=form">
					<i class="tim-icons icon-single-02"></i>
					<p class="title">임직원 관리</p>
				</a>
			</li>
			</c:if>       
      </ul>
   	</div>
</div>