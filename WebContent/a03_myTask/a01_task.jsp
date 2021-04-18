<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<title>zenkit</title>
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="../assets/css/black-dashboard.css?v=1.1.1" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="../assets/demo/demo.css" rel="stylesheet" />

<style>
#projectRow:hover {
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
				<%@ include file="my_task_header.jsp"%>
				
				<div class="d-flex justify-content-end mb-2">
				  <div class="col-md-3 " style="float:right;">
                        <select class="selectpicker" data-size="5" data-style="btn btn-primary" title="Single Select">
                          <option disabled selected>진행상태</option>
                          <option value="2">시작 전</option>
                          <option value="3">완료</option>
                          <option value="4">진행</option>
                        </select>
                  </div>
                  <div class="col-md-3 " style="float:right;">
                        <select class="selectpicker" data-size="5" data-style="btn btn-primary" title="Single Select">
                          <option disabled selected>프로젝트</option>
                          <option value="2">2021</option>
                          <option value="3">2020</option>
                          <option value="4">2019</option>
                        </select>
                  </div>
				
				
					<div class="col-sm-3">
                    <div class="input-group m-0" style="top: 5px;">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="tim-icons icon-zoom-split"></i>
                        </div>
                      </div>
                      <input type="text" name="firstname"
                      	class="form-control" placeholder="Search.." />
                    </div>
                  </div>
					<button class="btn"> <!-- onclick="location.href='${path}/a02_project/a00_regProject.jsp'" -->
						승인요청
					</button>
				</div>

				<div class="row">
					<div class="col-md-12">
		            <div class="card">
		              <div class="card-header">
		                <h4 class="card-title">작업</h4>
		              </div>
		              <div class="card-body">
		                <div class="table-responsive">
		                  <table class="table table-striped">
		                    <thead class="text-primary">
		                      <tr>
		                        <th class="text-center">
		                          <div class="form-check">
		                            <label class="form-check-label">
		                              <input class="form-check-input" type="checkbox" checked="">
		                              <span class="form-check-sign"></span>
		                            </label>
		                          </div>
		                        </th>
		                        <th class="text-left">
		                          작업
		                        </th>
		                        <th class="text-left">
		                          프로젝트
		                        </th>
		                        <th class="text-center">
		                          승인자
		                        </th>
		                        <th class="text-center">
		                          상태
		                        </th>
		                        <th class="text-center">
		                          시작일
		                        </th>
		                        <th class="text-center">
		                          완료일
		                        </th>
		                        <th class="text-center">
		                          완료율
		                        </th>
		                      </tr>
		                    </thead>
		                    <tbody>
		                      <tr>
		                        <td class="text-center">
		                          <div class="form-check">
		                            <label class="form-check-label">
		                              <input class="form-check-input" type="checkbox" checked="">
		                              <span class="form-check-sign"></span>
		                            </label>
		                          </div>
		                        </td>
		                        <td>
		                         ECOBEAN
		                        </td>
		                        <td>
		                          요구사항 정의서
		                        </td>
		                        <td class="text-center">
		                          김나영
		                        </td>
		                        <td class="text-center">
		                          완료
		                        </td>
		                       <td class="text-center">
		                          2019-02-14
		                        </td>
		                        <td class="text-center">
		                          2019-06-30
		                        </td>
		                        <td class="text-center">
		                          <div class="col-md-3" style="width:50px; padding:0px;">
				                    <div class="input-group m-0" style="padding:0px;">
				                      <input type="text" name="firstname" 
				                      	class="form-control" placeholder="완료율" style=" width:160px;"/>
				                    </div>
				                  </div>
		                        </td>
		                      </tr>
		                      <tr>
		                        <td class="text-center">
		                          <div class="form-check">
		                            <label class="form-check-label">
		                              <input class="form-check-input" type="checkbox">
		                              <span class="form-check-sign"></span>
		                            </label>
		                          </div>
		                        </td>
		                        <td>
		                         GAMEFLIX
		                        </td>
		                        <td>
		                         화면설계서
		                        </td>
		                        <td class="text-center">
		                          김나영
		                        </td>
		                        <td class="text-center">
		                          완료
		                        </td>
		                       <td class="text-center">
		                          2019-02-14
		                        </td>
		                        <td class="text-center">
		                          2019-06-30
		                        </td>
		                       <td class="text-center">
		                          <div class="col-md-3" style="width:50px; padding:0px;">
				                    <div class="input-group m-0" style="padding:0px;">
				                      <input type="text" name="firstname" 
				                      	class="form-control" placeholder="완료율" style=" width:160px;"/>
				                    </div>
				                  </div>
		                        </td>
		                      </tr>
		                      <tr>
		                        <td class="text-center">
		                          <div class="form-check">
		                            <label class="form-check-label">
		                              <input class="form-check-input" type="checkbox" checked="">
		                              <span class="form-check-sign"></span>
		                            </label>
		                          </div>
		                        </td>
		                        <td>
		                          PLO
		                        </td>
		                        <td>
		                          뮤직플레이어
		                        </td>
		                        <td class="text-center">
		                          하성찬
		                        </td>
		                        <td class="text-center">
		                          진행
		                        </td>
		                        <td class="text-center">
		                          2020-02-14
		                        </td>
		                        <td class="text-center">
		                          2020-06-30
		                        </td>
		                        <td class="text-center">
		                          <div class="col-md-3" style="width:50px; padding:0px;">
				                    <div class="input-group m-0" style="padding:0px;">
				                      <input type="text" name="firstname" 
				                      	class="form-control" placeholder="완료율" style=" width:160px;"/>
				                    </div>
				                  </div>
		                        </td>
		                      </tr>
		                      <tr>
		                        <td class="text-center">
		                          <div class="form-check">
		                            <label class="form-check-label">
		                              <input class="form-check-input" type="checkbox">
		                              <span class="form-check-sign"></span>
		                            </label>
		                          </div>
		                        </td>
		                        <td>
		                          ZENKIT
		                        </td>
		                        <td>
		                          대시보드
		                        </td>
		                        <td class="text-center">
		                          김나영
		                        </td>
		                        <td class="text-center">
		                          시작전
		                        </td>
		                        <td class="text-center">
		                          2021-02-14
		                        </td>
		                        <td class="text-center">
		                          2021-06-30
		                        </td>
		                        <td class="text-center">
		                          <div class="col-md-3" style="width:50px; padding:0px;">
				                    <div class="input-group m-0" style="padding:0px;">
				                      <input type="text" name="firstname" 
				                      	class="form-control" placeholder="완료율" style=" width:160px;"/>
				                    </div>
				                  </div>
		                        </td>
		                      </tr>		                      
		                    </tbody>
		                  </table>
		                </div>
		              </div>
		            </div>
		          </div>
				</div>
				<!-- end row -->
      	</div>
			<!-- End Content -->

			<footer class="footer">
				<div class="container-fluid">
					<ul class="nav">
						<li class="nav-item"><a href="javascript:void(0)"
							class="nav-link"> Creative Tim </a></li>
						<li class="nav-item"><a href="javascript:void(0)"
							class="nav-link"> About Us </a></li>
						<li class="nav-item"><a href="javascript:void(0)"
							class="nav-link"> Blog </a></li>
					</ul>
					<div class="copyright">
						©
						<script>
							document.write(new Date().getFullYear())
						</script>
						made with <i class="tim-icons icon-heart-2"></i> by <a
							href="javascript:void(0)" target="_blank">Creative Tim</a> for a
						better web.
					</div>
				</div>
			</footer>
		</div>
	</div>
	<div class="fixed-plugin">
		<div class="dropdown show-dropdown">
			<a href="#" data-toggle="dropdown"> <i class="fa fa-cog fa-2x">
			</i>
			</a>
			<ul class="dropdown-menu">
				<li class="header-title">Sidebar Background</li>
				<li class="adjustments-line"><a href="javascript:void(0)"
					class="switch-trigger background-color">
						<div class="badge-colors text-center">
							<span class="badge filter badge-primary active"
								data-color="primary"></span> <span
								class="badge filter badge-info" data-color="blue"></span> <span
								class="badge filter badge-success" data-color="green"></span> <span
								class="badge filter badge-warning" data-color="orange"></span> <span
								class="badge filter badge-danger" data-color="red"></span>
						</div>
						<div class="clearfix"></div>
				</a></li>
				<li class="header-title">Sidebar Mini</li>
				<li class="adjustments-line">
					<div class="togglebutton switch-sidebar-mini">
						<span class="label-switch">OFF</span> <input type="checkbox"
							name="checkbox" checked class="bootstrap-switch" data-on-label=""
							data-off-label="" /> <span class="label-switch label-right">ON</span>
					</div>
					<div class="togglebutton switch-change-color mt-3">
						<span class="label-switch">LIGHT MODE</span> <input
							type="checkbox" name="checkbox" checked class="bootstrap-switch"
							data-on-label="" data-off-label="" /> <span
							class="label-switch label-right">DARK MODE</span>
					</div>
				</li>
				<li class="button-container mt-4"><a
					href="../docs/1.0/getting-started/introduction.html"
					class="btn btn-default btn-block btn-round"> Documentation </a></li>
				<li class="header-title">Thank you for 95 shares!</li>
				<li class="button-container text-center">
					<button id="twitter" class="btn btn-round btn-info">
						<i class="fab fa-twitter"></i> &middot; 45
					</button>
					<button id="facebook" class="btn btn-round btn-info">
						<i class="fab fa-facebook-f"></i> &middot; 50
					</button> <br> <br> <a class="github-button"
					href="https://github.com/creativetimofficial/ct-black-dashboard-pro"
					data-icon="octicon-star" data-size="large" data-show-count="true"
					aria-label="Star ntkme/github-buttons on GitHub">Star</a>
				</li>
			</ul>
		</div>

	</div>
	<!--   Core JS Files   -->
	<script src="../assets/js/core/jquery.min.js"></script>
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap.min.js"></script>
	<script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<script src="../assets/js/plugins/moment.min.js"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script src="../assets/js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for Sweet Alert -->
	<script src="../assets/js/plugins/sweetalert2.min.js"></script>
	<!--  Plugin for Sorting Tables -->
	<script src="../assets/js/plugins/jquery.tablesorter.js"></script>
	<!-- Forms Validations Plugin -->
	<script src="../assets/js/plugins/jquery.validate.min.js"></script>
	<!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
	<script src="../assets/js/plugins/jquery.bootstrap-wizard.js"></script>
	<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
	<script src="../assets/js/plugins/bootstrap-selectpicker.js"></script>
	<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script src="../assets/js/plugins/bootstrap-datetimepicker.js"></script>
	<!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
	<script src="../assets/js/plugins/jquery.dataTables.min.js"></script>
	<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
	<script src="../assets/js/plugins/bootstrap-tagsinput.js"></script>
	<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
	<script src="../assets/js/plugins/jasny-bootstrap.min.js"></script>
	<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
	<script src="../assets/js/plugins/fullcalendar/fullcalendar.min.js"></script>
	<script src="../assets/js/plugins/fullcalendar/daygrid.min.js"></script>
	<script src="../assets/js/plugins/fullcalendar/timegrid.min.js"></script>
	<script src="../assets/js/plugins/fullcalendar/interaction.min.js"></script>
	<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
	<script src="../assets/js/plugins/jquery-jvectormap.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="../assets/js/plugins/nouislider.min.js"></script>
	<!-- Chart JS -->
	<script src="../assets/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="../assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="../assets/js/black-dashboard.min.js?v=1.1.1"></script>
	<!-- Black Dashboard DEMO methods, don't include it in your project! -->
	<script src="../assets/demo/demo.js"></script>
	<script>
    $(document).ready(function() {
      $().ready(function() {
        $sidebar = $('.sidebar');
        $navbar = $('.navbar');
        $main_panel = $('.main-panel');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');
        sidebar_mini_active = true;
        white_color = false;

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();



        $('.fixed-plugin a').click(function(event) {
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .background-color span').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data', new_color);
          }

          if ($main_panel.length != 0) {
            $main_panel.attr('data', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data', new_color);
          }
        });

        $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            sidebar_mini_active = false;
            blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
          } else {
            $('body').addClass('sidebar-mini');
            sidebar_mini_active = true;
            blackDashboard.showSidebarMessage('Sidebar mini activated...');
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);
        });

        $('.switch-change-color input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (white_color == true) {

            $('body').addClass('change-background');
            setTimeout(function() {
              $('body').removeClass('change-background');
              $('body').removeClass('white-content');
            }, 900);
            white_color = false;
          } else {

            $('body').addClass('change-background');
            setTimeout(function() {
              $('body').removeClass('change-background');
              $('body').addClass('white-content');
            }, 900);

            white_color = true;
          }


        });

        $('.light-badge').click(function() {
          $('body').addClass('white-content');
        });

        $('.dark-badge').click(function() {
          $('body').removeClass('white-content');
        });
      });
    });
	</script>
</body>

</html>