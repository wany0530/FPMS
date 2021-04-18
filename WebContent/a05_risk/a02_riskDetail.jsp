<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="../assets/css/black-dashboard.css?v=1.1.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
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
         
          <div class="col-md-12">
            <form id="TypeValidation" class="form-horizontal">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">리스크 상세 정보</h4>
                </div>
                <div class="card-body">
                  <div class="row">
                    <label class="col-sm-2 col-form-label">제목</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                        <input class="form-control" type="text" name="required" required placeholder="일정 지연" />
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code>*필수</code>
                    </label>
                  </div>
                     <div class="row">
                    <label class="col-sm-2 col-form-label">프로젝트1</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                       <select class="form-control" name="condition">
                         <option disabled></option>
                          <option value="1">프로젝트1</option>
                          <option value="2">프로젝트2</option>
                          <option value="3">프로젝트3</option>
                          <option value="4">프로젝트4</option>
                          <option value="5">프로젝트5</option>         
                        
                       </select>
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code>*필수</code>
                    </label>
                  </div>
                  <div class="row">
                    <label class="col-sm-2 col-form-label">작업</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                        <select class="form-control" name="condition">
                         <option disabled></option>
                          <option value="1">화면설계서 작성</option>
                          <option value="2">작업명</option>
                          <option value="3">작업명</option>
                          <option value="4">작업명</option>
                          <option value="5">작업명</option>         
                          <option value="6">작업명</option>         
                          <option value="7">작업명</option>         
                       </select>
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code></code>
                    </label>
                  </div>
                   <div class="row">
                    <label class="col-sm-2 col-form-label">리스크 내용</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                        <input class="form-control" type="text" name="content" required placeholder="리스크 내용"/>
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code></code>
                    </label>
                  </div>
                  <div class="row">
                    <label class="col-sm-2 col-form-label">첨부파일</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                        <input class="form-control" type="url" name="name"  required placeholder="첨부파일등록"/>
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code></code>
                    </label>
                  </div>
                  <div class="row">
                    <label class="col-sm-2 col-form-label">조치자</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                      <select class="form-control" name="condition">
                         <option disabled></option>
                          <option value="1">pm01</option>
                          <option value="2">CEO</option>
                          <option value="3">이사</option>
                          <option value="4">부장</option>
                          <option value="5">과장</option>         
                          <option value="6">대리</option>         
                          <option value="7">사원</option>         
                       </select>
                     
                      </div>
                    </div>
                    <label class="col-sm-3 label-on-right">
                      <code>*필수</code>
                    </label>
                  </div>
                  
                   <div class="row">
                    <label class="col-sm-2 col-form-label">조치 희망일</label>
                    <div class="col-sm-7">
                      <div class="form-group">
                         <input type="text" class="form-control datetimepicker" value="10/05/2018">
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
                        <select class="form-control" name="condition">
                         <option disabled></option>
                          <option value="2">오픈</option>
                          <option value="2">진행</option>
                          <option value="2">취소</option>
                          <option value="2">홀드</option>
                          <option value="2">조치완료</option>         
                       </select>
                      </div>
                    </div>
                    
                    <label class="col-sm-4 label-on-right">
                      <code></code>
                    </label>
                  </div>
                </div>
                <div class="card-footer text-center">
                  <button type="submit" class="btn btn-primary">수정</button>
                  &nbsp; &nbsp;    
                  <a href="a03_riskInsert.jsp">
                   <button type="submit" class="btn btn-primary">삭제</button></a>
                </div>
              </div>
            </form>
          </div>
          <div class="col-md-12">
          
          </div>
        </div>
      </div>
      <footer class="footer">
        <div class="container-fluid">
          <ul class="nav">
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
                Creative Tim
              </a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
                About Us
              </a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
                Blog
              </a>
            </li>
          </ul>
          <div class="copyright">
            ©
            <script>
              document.write(new Date().getFullYear())
            </script> made with <i class="tim-icons icon-heart-2"></i> by
            <a href="javascript:void(0)" target="_blank">Creative Tim</a> for a better web.
          </div>
        </div>
      </footer>
    </div>
  </div>
  <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
      <a href="#" data-toggle="dropdown">
        <i class="fa fa-cog fa-2x"> </i>
      </a>
      <ul class="dropdown-menu">
        <li class="header-title"> Sidebar Background</li>
        <li class="adjustments-line">
          <a href="javascript:void(0)" class="switch-trigger background-color">
            <div class="badge-colors text-center">
              <span class="badge filter badge-primary active" data-color="primary"></span>
              <span class="badge filter badge-info" data-color="blue"></span>
              <span class="badge filter badge-success" data-color="green"></span>
              <span class="badge filter badge-warning" data-color="orange"></span>
              <span class="badge filter badge-danger" data-color="red"></span>
            </div>
            <div class="clearfix"></div>
          </a>
        </li>
        <li class="header-title">
          Sidebar Mini
        </li>
        <li class="adjustments-line">
          <div class="togglebutton switch-sidebar-mini">
            <span class="label-switch">OFF</span>
            <input type="checkbox" name="checkbox" checked class="bootstrap-switch" data-on-label="" data-off-label="" />
            <span class="label-switch label-right">ON</span>
          </div>
          <div class="togglebutton switch-change-color mt-3">
            <span class="label-switch">LIGHT MODE</span>
            <input type="checkbox" name="checkbox" checked class="bootstrap-switch" data-on-label="" data-off-label="" />
            <span class="label-switch label-right">DARK MODE</span>
          </div>
        </li>
        <li class="button-container mt-4">
          <a href="../docs/1.0/getting-started/introduction.html" class="btn btn-default btn-block btn-round">
            Documentation
          </a>
        </li>
        <li class="header-title">Thank you for 95 shares!</li>
        <li class="button-container text-center">
          <button id="twitter" class="btn btn-round btn-info"><i class="fab fa-twitter"></i> &middot; 45</button>
          <button id="facebook" class="btn btn-round btn-info"><i class="fab fa-facebook-f"></i> &middot; 50</button>
          <br>
          <br>
          <a class="github-button" href="https://github.com/creativetimofficial/ct-black-dashboard-pro" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star ntkme/github-buttons on GitHub">Star</a>
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
  <!--  Google Maps Plugin    -->
  <!-- Place this tag in your head or just before your close body tag. -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
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
  <script>
    function setFormValidation(id) {
      $(id).validate({
        highlight: function(element) {
          $(element).closest('.form-group').removeClass('has-success').addClass('has-danger');
          $(element).closest('.form-check').removeClass('has-success').addClass('has-danger');
        },
        success: function(element) {
          $(element).closest('.form-group').removeClass('has-danger').addClass('has-success');
          $(element).closest('.form-check').removeClass('has-danger').addClass('has-success');
        },
        errorPlacement: function(error, element) {
          $(element).closest('.form-group').append(error);
        },
      });
    }

    $(document).ready(function() {
      setFormValidation('#RegisterValidation');
      setFormValidation('#TypeValidation');
      setFormValidation('#LoginValidation');
      setFormValidation('#RangeValidation');
    });
  </script>
</body>

</html>