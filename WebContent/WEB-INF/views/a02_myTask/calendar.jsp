<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>       
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
	<%@include file="../a01_main/bootstrapTop.jsp" %>



<link href='${path}/a00_com/lib/main.css' rel='stylesheet' />
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<script src='${path}/a00_com/lib/main.js'></script>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
    
  }
  
  input[type=text], select, label, textarea{
  	margin-bottom:12px; padding:.43em; width:95%;
  }
  .input-group-text{
  	width:100%; 
  	text-align:center;
  	background-color:linen;
  	color:black;
  	font-weight:bolder;
  }
  .input-group-prepend{
  	width:35%;
  	}
  	
   .card h2 {
  	color:black;
  }
  .fc-col-header-cell-cushion{
  	font-weight:bold;
  }
	.form-control{
		height:45.67px;
		border:1px solid black;
	}
	.input-group-prepend .input-group-text{
		color:black;
	}
	/*
  .ui-widget-content{
  	background-color:white;
  }
  */
  .ui-widget-header {
    border: 1px solid #e14eca;
    background: #e14eca;
    background-image: linear-gradient(to bottom left, #e14eca, #ba54f5, #e14eca);
    font-weight: bold;
	}
  body{
  	margin:0px;
  }
  /*
  .ui-dialog-titlebar-close{
    background-size: 210% 210%;
    background-position: top right;
    background-color: white;
    transition: all 0.15s ease;
    box-shadow: none;
  }
  */
 textarea.form-control {
    border: 1px solid #2b3553;
    border-radius:.25rem;
}
	.input-group-append, .input-group-prepend .input-group-text,
	 .input-group-prepend .input-group-text {
		background-color:#525f7f;
		color:white;
	}
	.ui-widget-content{
	background-color:white;
	}
	.input-group-focus{
		background-color:#525f7f;
		border-radius: 0.4285rem;
	}
	.form-contrl:focus{
		background-color:#525f7f;
		border-radius: 0.4285rem;
	}
	button{
		color:white;
		background-color:#e14eca;
		border-radius: 0.4285rem;
		border-color:#e14eca;
	}
	.ui-dialog-titlebar-close{
		background-color:white;
		color:#e14eca;
	}
	
</style>
<script type="text/javascript">
<%--
 
 
--%>
	// 전역변수로 날짜 데이터 가져오기 위해 선언
	var date = {};

	// document.addEventListener("DOMContentLoaded")
	// 전체 DOM에 로딩되었을 때, jquery $(document).ready();와 동일
	document.addEventListener('DOMContentLoaded', function() {
		var opts={
			autoOpen:false, // 초기에 로딩하지 않게 처리
			width:"400px",
			modal:true
		}
		
		$("#schDialog").dialog(opts);
		/*
		$("#schDialog").dialog({
			autoOpen:false, // 초기에 로딩하지 않게 처리
			width:"350px",
			modal:true // 입력시 그 외 화면처리는 비활성화 처리
		});
		*/
		
	    var calendarEl = document.getElementById('calendar');
		// new FullCalendar.Calendar("대상 DOM객체",
		//							{속성:속성값, 속성2:속성값2..})
	    // # calendar의 new FullCalendar.Calendar()를 통해서 화면에
	    // 나타날 객체를 참조변수로 가지고 있고..
		// alert(new Date().toISOString());
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	headerToolbar: {
	        	left: 'prevYear prev today next nextYear',
	        	center: 'title',
	        	right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
	      	},
	      	themeSystem: 'bootstrap',
	      	initialDate: new Date().toISOString(), // 초기 로딩 날짜(오늘로 ISO 형식).
	      	navLinks: true, // can click day/week names to navigate views
	      	selectable: true,
	      	selectMirror: true,
	      	// 이벤트명:function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용
	      	select: function(arg) {
	    	 
	    		// 등록시, 기존 내용 로딩을 방지 처리, 초기화 처리
	    		$("#schDialog>form")[0].reset();
		  		
		  		console.log("## 매개변수 arg의 속성"); // console을 통해서
		  		console.log(arg); //console을 통해서 해당 속성 확인
	    	  	// 화면에 보이는 형식 설정
		      	// 클릭한 날짜를 전역변수에 할당/시작일과 마지막을 date형식으로 할당.
	    		// 위에 선언한 전역변수에 날짜 시간 정보를 할당함으로
	    		// 다른 함수에서 활용할 수 있게 한다.
		      	date.start=arg.start; // arg.start는 데이터 유형은 Date 이다.
		    	date.end=arg.end;
	    	  
		    	opts.buttons={
		    		"등록":function(){	
		    			// alert("등록 처리합니다!");
		    			var sch=callSch(); // 리턴값이 입력된 객체 데이터
		    			console.log("## 등록할 데이터 ##");
		    			console.log(sch);
		    			if(sch.title=="" || sch.title==null){
		    				alert("제목을 입력해주세요");
		    				return false;
		    			} else if(sch.content=="" || sch.content==null){
		    				alert("내용을 입력해주세요");
		    				return false;
		    			}
		    			// 화면에 출력
		    			if(sch.title){
			    			// 화면에 처리할 이벤트 할당
			    			calendar.addEvent(sch);
			    			calendar.unselect();
			    		}
			    			
			    		// ajax 처리. (DB 등록)
			    		$.ajax({
			    			type:"post",
			    			url:"${path}/calendar.do?method=insert",
			    			dataType:"json",
			    			data:sch, // 요청값을 json 객체로 전달 가능
			    			success:function(data){
			    				// data.모델명
			    				if(data.success=="Y"){
			    					alert("등록 성공");
			    				}
			    				calendar.refetchEvents();
		                        calendar.getEventById( "0" ).remove();
			    			},
			    			error:function(err){
			    				console.log(err);
			    			}
			    		});	
			    		$("#schDialog").dialog("close");
		    		
		    		}
		    	};	
		  	 
		   		
		    	// bootstrap으로 진행 시 주석 풀고 밑 dialog 주석처리
		    	
	    		// console.log("# 매개변수 arg의 속성 #");
	    	 	// console.log(arg); // console을 통해서 해당 속성 확인
	         	// $("#schDialog").dialog("open");
	    	 	// alert("시작일:"+arg.start.toISOString());
	    	 	// $("#btn01").click();
	    	 
				
	    	 	// 화면에 보이는 날짜는 한국식 표현식으로 처리
				$("[name=start]").val(arg.start.toLocaleString());
	        	$("[name=end]").val(arg.end.toLocaleString());
	        	// all.Day는 boolean 값이기에 select의 선택형식에 맞게 처리하려면
	        	// ""+ 형식으로 문자열 처리가 필요하다.
	        	$("[name=allDay]").val(""+arg.allDay);
	        	// 등록버튼이 있는 dialog 옵션 설정
	        	$("#schDialog").dialog(opts);
	        	// 등록 화면 로딩
		    	$("#schDialog").dialog("open");													
	    	/*
	    	 var title = prompt('입력할 일정:');
	    	// title이 값이 있을 떄, 
	    	// 화면에 calendar.addEvent() json 형식으로 일정을 추가
	       
	    	if (title) {
	        	// calendar로 선언한 객체에 속성/속성값으로 일정을 추가 등록
	        	// 화면에 보이는 부분
	          calendar.addEvent({
	            title: title,
	            start: arg.start,
	            end: arg.end,
	            allDay: arg.allDay,
	            backgroundColor:"yellow",
	            textColor:"blue"
	          })
	        }
	    	*/
	    	// ajax를 통해서 실제 데이터 입력 처리
			},
	      	eventDrop:function(arg){
	    		eventUpt(arg.event);
	      	},
	      	eventResize:function(arg){
	    		eventUpt(arg.event);
	      	},
	      	eventClick: function(arg) {
	          	// 있는 일정을 클릭 시,
	          	// 상세 화면 보이기(등록되어 있는 데이터 출력)
	          	// ajax를 통해서, 수정/삭제
	          	// 삭제 1 : 화면에서 삭제
	          	// arg.event : 해당 상세 정보를 가지고 있다.
	          	/*  event의 날짜 저장*/
	          	date.start=arg.event.start;
		      	date.end=arg.event.end;
	          	/* 각 form에 값 추가 */
	          	// 1. 화면 로딩
	          	//	2번이상 중복된 함수 사용이 필요한 부분은 모듈로 분리 처리
				detail(arg.event);
	          	// 2. 기능별 버튼에 대한 처리
	          	opts.buttons={
	          	  	"수정":function(){
		          		// 수정 후, json 데이터 가져오기
		          		// 화면에 form 하위에 있는 요소객체의 값을 가져오는 부분
		          		var sch=callSch();
		          		console.log("#수정할 값#");
		          	 	console.log(sch);
		          		// 1. 화면단  변경
		          		// 현재 캘린더 api의 속성 변경하기
		          		var event = calendar.getEventById(sch.id);
		          		// 속성값 변경 setProp
		          		event.setProp("title",sch.title);
		          		event.setProp("textColor",sch.textColor);
		          		event.setProp("backgroundColor",sch.backgroundColor);
		          		event.setProp("borderColor",sch.borderColor);
						// 확장 속성 : 	writer [입력]
		          		// 			content [입력]
		          		event.setExtendedProp("content",sch.content);
		          		event.setAllDay(sch.allDay);
		          		  
		          		/* 2. DB 변경*/
		          		updateCall(sch);
		          		$("#schDialog").dialog("close");
					},
		          	"삭제":function(){
		          		var idVal=$("[name=id]").val();
		          		// 화면에서 삭제 처리
		          		var event=calendar.getEventById(idVal);
		          		event.remove();
		          		// DB 삭제 처리
		          		$.ajax({
		          			type:"post",
		          			url:"calendar.do?method=delete",
		    			    data:{id:idVal},
		    			    dataType:"json",
		    			    success:function(data){
		    			    	if(data.success=="Y"){
		    			    		alert("삭제 성공");	
		    			    	}
		    			    },
		    			    error:function(err){
		    			    	alert("에러발생");
		    			    	console.log(err);
		          	  		}
		          		});
		          		$("#schDialog").dialog("close");
	          		}
		        }
	    
	          	$("#schDialog").dialog(opts);
		      	$("#schDialog").dialog("open");
	            /*
	    	    if (confirm('일정 삭제하시겠습니까?')) {
	            arg.event.remove()
	            */
	      	},
	      	editable: true,
	     	dayMaxEvents: true, // allow "more" link when too many events
	      	events: function(info, successCallback, failureCallback){
	    	  	// ajax 처리로 데이터를 로딩 시킨다.
	    	  	// 화면에 나타날 일정들을 ajax를 통해서 호출하고,
	    	  	// success 함수를 통해서 서버에서 받은 데이터를 가져오고,
	    	  	// successCallback이라는 매개변수를 받은 함수에 일정 내용을 전달하면
	    	  	// 전체 화면에서 일정이 반영된다.
	    	  	$.ajax({
	    		  	type:"get",
	    		  	url:"${path}/calendar.do?method=data",
	    		  	dataType:"json",
	    		  	success:function(data){
	    				console.log(data.list);
	    				successCallback(data.list);
	    		  	},
	    		  	error:function(err){
	    			  	console.log(err);
	    		  	}
	    	  	});
	      	}
		});
   		calendar.render();
	});
	// form 하위 요소객체에서 사용할 데이터를 json 형식을 만들어 준다.
	function callSch(){
		var sch={};
		sch.id=$("[name=id]").val();
		sch.title=$("[name=title]").val();
		sch.content=$("[name=content]").val();
		// Date 타입은 화면에서 사용되는 형식으로 설정하여야 한다.
		// 전역변수에 할당한 date.start// date.end의 ISO형태로 속성 할당
		// calendar api에서 사용되는 날짜 처리 방식이 ISO문자열 형식이기 때문이다.
		// ex) Date ==> toISOString() 형식
		sch.start=date.start.toISOString();
		sch.end=date.end.toISOString();
		// alert("등록할 시작일:"+sch.start)
		// sch.allDay : calendar로 처리할 데이터 boolean 형식으로 true/false
		// 으로 처리되어야 하는데, 화면에 보이는 내용은 문자열로 되어 있다.
		// <option value="true"> 이 선택되어 졌을 때는
		// == 비교 연산을 통해서 true로 boolean값을 넘기고,
		// 그 외는 false를 boolean값으로 전달.
		sch.allDay=$("[name=allDay]").val()=="true"; 
		// 문자열이 "true"일 때, 그 외는 false
		sch.backgroundColor=$("[name=backgroundColor]").val(); // 배경색상
		sch.textColor=$("[name=textColor]").val();
		sch.borderColor=$("[name=borderColor]").val();
		sch.u_no=${sesMem.getU_no()};
		return sch;
	}
	function detail(event){
		// event안에 기본 속성값이 초기에 데이터 로딩시, 가지고 있음
		// 상세한 내용을 event의 속성값으로 form 객체 하위에 표현하기 위하여 사용한다.
		// form 하위 객체에 할당
		$("[name=id]").val(event.id);
		$("[name=title]").val(event.title);
		// calendar에서 추가된 속성들
		// ex) event.extendtedProps
		//	calendar api 자체에서 지원되는 기본적인 속성이 아니고,
		//  사용자에 의해서 DB 관리가 필요한 속성을 처리할 떄, 사용된다.
		var exProps = event.extendedProps;
		$("[name=content]").val(exProps.content);
		$("[name=start]").val(event.start.toLocaleString());
		$("[name=end]").val(event.end.toLocaleString());
		$("[name=allDay]").val(""+event.allDay);
		$("[name=backgroundColor]").val(event.backgroundColor);
		$("[name=textColor]").val(event.textColor);
		$("[name=borderColor]").val(event.borderColor);
	}
	// 수정 처리 ajax
	function updateCall(sch){
		// callSch() 입력된 수정된 데이터를 요청값으로 전달.
		$.ajax({
			type:"post",
			url:"calendar.do?method=update",
			data:sch,
			dataType:"json",
			success:function(data){
				// data.모델명
				if(data.success=="Y"){
					console.log("성공");
					alert("수정완료");
				}else{
					console.log("실패");
				}
			},
			error:function(err){
				alert("에러발생:"+err);	
				console.log(err);
			}
		});
	}
	function eventUpt(event){
		var sch={};
		sch.id=event.id;
		sch.title=event.title;
		sch.start=event.start.toISOString();
		sch.end=event.end.toISOString();
		sch.content=event.extendedProps.content;
		sch.textColor=event.textColor;
		sch.backgroundColor=event.backgroundColor;
		sch.borderColor=event.borderColor;
		sch.allDay=event.allDay;
		console.log("# 이벤트에 의한 수정 #");
		console.log(sch);
		updateCall(sch);
	}
	
</script>
</head>
<body class="sidebar-mini">
	<div class="wrapper">
	
    <%@ include file="../a01_main/sidebar.jsp" %>
    <div class="main-panel">
 	   <c:set var="fileName" value="${pageContext.request.servletPath}"/>
		<nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
			<div class="container-fluid">
				<div class="navbar-wrapper">
					<div class="navbar-minimize d-inline">
						<button class="minimize-sidebar btn btn-link btn-just-icon"
							rel="tooltip" data-original-title="Sidebar toggle"
							data-placement="right">
							<i class="tim-icons icon-align-center visible-on-sidebar-regular"></i>
							<i class="tim-icons icon-bullet-list-67 visible-on-sidebar-mini"></i>
						</button>
					</div>
					<div class="navbar-toggle d-inline">
						<button type="button" class="navbar-toggler">
							<span class="navbar-toggler-bar bar1"></span>
							<span class="navbar-toggler-bar bar2"></span>
							<span class="navbar-toggler-bar bar3"></span>
						</button>
					</div>
					
					<a class="navbar-brand title" href="javascript:void(0)">
						<c:choose>
							<c:when test="${fileName == '/WEB-INF/views/a01_admin/a01_dept_management.jsp'}">
								부서 관리
							</c:when>
							<c:when test="${fileName == '/WEB-INF/views/a01_admin/a02_user_management.jsp'}">
								임직원 관리
							</c:when>
						</c:choose>
					</a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navigation" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-bar navbar-kebab"></span>
					<span class="navbar-toggler-bar navbar-kebab"></span>
					<span class="navbar-toggler-bar navbar-kebab"></span>
				</button>
				<div class="collapse navbar-collapse" id="navigation">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item d-flex align-items-center">
							<div>
							 	<strong>${sesMem.u_name}</strong>
								<span id="pos">(${sesMem.pos_name})</span>
							</div>
						</li>
						<li class="dropdown nav-item">
							<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
								<div class="photo">
									<img src="${path}/${sesMem.u_img}" alt="Profile Photo"
										onerror="this.src='${path}/z04_img/defailtProfile.png';">
								</div>
								
								<p class="d-lg-none">Log out</p>
							</a>
							<ul class="dropdown-menu dropdown-navbar">
								<li class="nav-link"><a href="${path}/profile.do"
									class="nav-item dropdown-item">프로필</a></li>
								<li class="dropdown-divider"></li>
								<li class="nav-link"><a href="${path}/zenkit.do?method=login"
									class="nav-item dropdown-item">로그아웃</a></li>
							</ul>
						</li>
						<li class="separator d-lg-none"></li>
					</ul>
				</div>
			</div>
		</nav>

		<script>
			var session = "${sesMem.u_name}";
			if(session == "" || session == null){
				alert("로그인 시간이 만료되었습니다. 로그인 페이지로 이동합니다.");
				location.href="${path}/zenkit.do?method=login";
			}
		</script>
      
	    <!-- Your content here -->
		<div class="content">
	     	<div class="row">
	        	<div class="col-md-10 ml-auto mr-auto">
	            	<div class="card card-calendar">
	  					<div class="card-body">
							<div id="calendar"></div>
								<div id="schDialog" title="일정">
									<form id="frm">
										<input name="id" type="hidden" value="0"/>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">제목</span>
											</div>
											<input class="form-control" name="title" type="text"/>
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">내용</span>
											</div>
											<textarea  rows="5" class="form-control" cols="20"
												name="content"></textarea>
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">종일여부</span>
											</div>
											<select name="allDay" class="form-control">
												<option value="true"> 종 일 </option>
												<option value="false"> 시 간 </option>
											</select>
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">시작일</span>
											</div>
											<input class="form-control" name="start" type="text"/>
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">종료일</span>
											</div>
											<input class="form-control" name="end" type="text"/>
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">배경색상</span>
											</div>
											<input class="form-control" name="backgroundColor" 
												type="color" value="#0099cc"/>
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">보드색상</span>
											</div>
											<input class="form-control" name="borderColor" 
												type="color" value="#0099cc"/>
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">글자색상</span>
											</div>
											<input class="form-control" name="textColor" 
												type="color" value="#ccffff"/>
										</div>
									</form>
								</div>
							</div>
	           			</div>
	         		</div>
	       		</div>
	       	</div>
	    </div>
    </div>
  	<%@include file="../a01_main/plugin.jsp" %>
  	<script>
		var path="${path}";
		$('.navbar-brand').text('일정 관리');
		function goPage(page) {
			$("[name=curPage]").val(page);
			$("form").submit();
		}
	</script>













  <!--   Core JS Files   -->
  <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <script src="${path}/assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="${path}/assets/js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="${path}/assets/js/plugins/sweetalert2.min.js"></script>
  <!--  Plugin for Sorting Tables -->
  <script src="${path}/assets/js/plugins/jquery.tablesorter.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="${path}/assets/js/plugins/jquery.validate.min.js"></script>
  <!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="${path}/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="${path}/assets/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="${path}/assets/js/plugins/bootstrap-datetimepicker.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
  <script src="${path}/assets/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="${path}/assets/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="${path}/assets/js/plugins/jasny-bootstrap.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="${path}/assets/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="${path}/assets/js/plugins/nouislider.min.js"></script>
  <!-- Chart JS -->
  <script src="${path}/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${path}/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${path}/assets/js/black-dashboard.min.js?v=1.1.1"></script>
  <!-- Black Dashboard DEMO methods, don't include it in your project! -->
  <script src="${path}/assets/demo/demo.js"></script>
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