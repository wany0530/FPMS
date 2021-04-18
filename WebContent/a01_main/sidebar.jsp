<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sidebar">
   <div class="sidebar-wrapper">
      <div class="logo">
          <a href="${path}/a01_main/a01_dashboard_personal.jsp" class="simple-text logo-mini">
            <img src="../assets/img/logo_symbol.png" />
          </a>
          <a href="javascript:void(0)" class="simple-text logo-normal">
            zenkit
          </a>
        </div>
        <ul class="nav">
        
          <li>
            <a data-toggle="collapse" href="#pagesExamples">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>
                대시보드
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="pagesExamples">
              <ul class="nav">
                <li>
                  <a href="${path}/a01_main/a01_dashboard_personal.jsp">
                    <span class="sidebar-mini-icon">PE</span>
                    <span class="sidebar-normal"> 개인 대시보드 </span>
                  </a>
                </li>
                <li>
                  <a href="${path}/a01_main/a02_dashboard_project.jsp">
                    <span class="sidebar-mini-icon">PJ</span>
                    <span class="sidebar-normal"> 프로젝트 대시보드 </span>
                  </a>
                </li>               
              </ul>
            </div>
          </li>
          <li>
            <a data-toggle="collapse" href="#componentsExamples">
              <i class="tim-icons icon-single-02"></i>
              <p>
                내 작업
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="componentsExamples">
              <ul class="nav">
                <li>
                   <a href="${path}/a03_myTask/a01_task.jsp">
                    <span class="sidebar-mini-icon">MW</span>
                    <span class="sidebar-normal"> 내 작업</span>
                  </a>
                </li>
                <li>
                  <a href="##">
                    <span class="sidebar-mini-icon">SM</span>
                    <span class="sidebar-normal"> 일정 관리 </span>
                  </a>
                </li>               
              </ul>
            </div>                      
          </li>
          
          
          <li>
            <a data-toggle="collapse" href="#formsExamples">
              <i class="tim-icons icon-notes"></i>
              <p>
                프로젝트
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="formsExamples">
              <ul class="nav">
                <li>
                  <a href="${path}/a02_project/a00_projectList.jsp">
                    <span class="sidebar-mini-icon">PC</span>
                    <span class="sidebar-normal"> 프로젝트 센터</span>
                  </a>
                </li>
                <li>
                  <a href="##">
                    <span class="sidebar-mini-icon">PO</span>
                    <span class="sidebar-normal"> 프로젝트 산출물 </span>
                  </a>
                </li>               
              </ul>
            </div>
          </li>
          
          <li>
            <a data-toggle="collapse" href="#tablesExamples">
              <i class="tim-icons icon-bullet-list-67"></i>
              <p>
                결재
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="tablesExamples">
              <ul class="nav">
                <li>
                  <a href="${path}/a06_auth/authIng.jsp">
                    <span class="sidebar-mini-icon">PA</span>
                    <span class="sidebar-normal"> 결재진행함 </span>
                  </a>
                </li>
                <li>
                  <a href="${path}/a06_auth/authAppReject.jsp">
                    <span class="sidebar-mini-icon">CA</span>
                    <span class="sidebar-normal"> 결재완료함</span>
                  </a>
                </li>
                <li>
                  <a href="${path}/a06_auth/authAppReject.jsp">
                    <span class="sidebar-mini-icon">RA</span>
                    <span class="sidebar-normal"> 결재반려함</span>
                  </a>
                </li>
                <li>
                  <a href="${path}/a06_auth/authReq.jsp">
                    <span class="sidebar-mini-icon">RA</span>
                    <span class="sidebar-normal"> 결재요청함</span>
                  </a>
                </li>
              </ul>
            </div>
          </li>
          <li>
            <a data-toggle="collapse" href="#mapsExamples">
              <i class="tim-icons icon-app"></i>
              <p>
                일반업무
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="mapsExamples">
              <ul class="nav">
                <li>
                  <a href="${path}/a05_risk/a01_riskTable.jsp">
                    <span class="sidebar-mini-icon">MR</span>
                    <span class="sidebar-normal"> 리스크 관리 </span>
                  </a>
                </li>
              </ul>
           </div>
         </li>         
      </ul>
   	</div>
</div>