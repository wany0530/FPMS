<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<%@ include file="../a01_main/bootstrapTop.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		var u_name = "${sesMem.u_name}";
		var p_name = "${project.p_name}";
		
		$("[name=u_name]").on("keyup", function(){
			if($("[name=u_name]").val() == u_name){
				$("#enterBtn").attr("type", "button");
			}else{
				$("#enterBtn").attr("type", "hidden");
			}
		});
				
		// 1. 전역변수 웹소켓 통신 처리한 변수 선언.
		var wsocket;
		// 2. 접속시, 처리내용
		$("#enterBtn").on("click",function(){
			if(confirm("채팅서버에 접속하시겠습니까??")){
					$(".card-body").attr("style","height:100%;");
					wsocket = new WebSocket("ws://localhost:7080//${path}//chat-ws.do");
					// 1. 접속시.
					wsocket.onopen = function(evt){
						//채팅 서버에 접속되었을 때, 처리할 내용..
						console.log(evt);
						// 접속 메세지 전송.. : 그룹명 : 아이디명 : 메세지
						wsocket.send($("[name=pname]").val()+":"+$("[name=u_name]").val()+":연결 접속했습니다!");
					}
					// 2. 서버에서 메세지 받기.
					wsocket.onmessage=function(evt){
						var data = evt.data;
						var user = data.split(":");
						console.log(user);
						if(user[0] == $("[name=pname]").val()){
							// 메세지만 전달 처리..
							revMsg(user[1]+":"+user[2]);
						}
					}
					// 3. 서버에 종료 처리.
					wsocket.onclose=function(){
						alert("접속을 종료합니다!!");
						$("#chatMessageArea").text("");
						$("[name=u_name]").val("").focus();//??이거 안될거같은데..
					}
				}else{
					location.href("${path}/chatt.do?method=chatt");
				}
			
		});
		// .send()는 서버의 handleTextMessage와 연동
		$("#sendBtn").click(function(){
			sendMsg();	
		});
		
		$("#msg").keyup(function(e){
			if(e.keyCode==13){
				sendMsg();
			}
		});
		$("#exitBtn").click(function(){
			wsocket.send($("#group").val()+":"+$("#id").val()+":연결 종료합니다.");
			wsocket.close();
			$("form").submit();
		});
		
		function sendMsg(){
			var id = $("[name=u_name]").val();
			var msg = $("#msg").val();
			wsocket.send($("[name=pname]").val()+":"+id+":"+msg);
			$("#msg").val("");
		}
		function revMsg(msg){
			$("#chatMessageArea").append(msg+"<br>");
			//자동 스크롤링처리..(메세지 내용)
			var mx = parseInt($("#chatMessageArea").height());
			$("#chatArea").scrollTop(mx);
		}
	});
</script>
<style>
html, body {
	/* height: 100%;
	padding: 0px;
	margin: 0px;
	overflow: hidden; */
	
}
</style>
</head>
<body class="sidebar-mini ">
	<div class="wrapper">

		<%@ include file="../a01_main/sidebar.jsp"%>

		<div class="main-panel">

			<%@ include file="../a01_main/header.jsp"%>

			<!-- Start Content -->
			<div class="content" style="width: 100%; height: 100%;">

				<%@ include file="project_header.jsp"%>
				<div class="content">
					<div class="col-md-10 mr-auto ml-auto">
						<!--      Wizard container        -->
						<div class="wizard-container">
							<div class="card card-wizard" data-color="primary"
								id="wizardProfile">
								<form method="post">
									<div class="card-header text-center">
										<h3 class="card-title">${project.p_name} 채팅</h3>
										<div class="wizard-navigation">
											<div class="progress-with-circle">
												<div class="progress-bar" role="progressbar"
													aria-valuenow="1" aria-valuemin="1" aria-valuemax="3"
													style="width: 21%;"></div>
											</div>
											<ul>
												<li class="nav-item"><a class="nav-link active"
													href="#about" data-toggle="tab"> <i
														class="tim-icons icon-single-02"></i>
														<p>login</p>
												</a></li>
												
												<li class="nav-item"><a class="nav-link"
													href="#address" data-toggle="tab"> <i
														class="tim-icons icon-delivery-fast"></i>
														<p>Chatting</p>
												</a></li>
											</ul>
										</div>
									</div>
									<div class="card-body" style="height:250px;">
										<div class="tab-content">
											<div class="tab-pane show active" id="about">
												<h5 class="info-text">로그인</h5>
												<div class="row justify-content-center mt-5">
													<div class="col-sm-5">
														<div class="input-group">
															<div class="input-group-prepend">
																<div class="input-group-text">
																	<i class="tim-icons icon-single-02"></i>
																</div>
															</div>
															<input type="text" name="pname" class="form-control"
																placeholder="프로젝트명" value="${project.p_name }">
														</div>
													</div>
													<div class="col-sm-5">
														<div class="input-group">
															<div class="input-group-prepend">
																<div class="input-group-text">
																	<i class="tim-icons icon-caps-small"></i>
																</div>
															</div>
															<input type="text" name="u_name"
																placeholder="임직원명" class="form-control">
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane" id="address">
												<div class="row justify-content-center">
													<div class="col-sm-12">
														<h5 class="info-text">채팅방</h5>
													</div>
													<div class="col-sm-7">
														<div class="form-group">
															<input type="text" class="form-control" id="msg" placeholder="전송할 메세지를 입력해주세요.">
														</div>
													</div>
													<div class="col-sm-3">
														<div class="form-group" style="width:100%; display: flex;" >
															<div style="flex:1;"><input type="button" class="form-control" value="전송" style="width:90%;" id="sendBtn"></div>
															<div style="flex:1;"><input type="button" class="form-control" value="나가기" style="width:90%;" id="exitBtn"></div>
														</div>
													</div>
													<div class="col-sm-10">
														<div class="form-group" id="chatArea">
															<label>채팅창</label> <div id="chatMessageArea" class="form-control" style="height:200px;"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div style="text-align: right; margin-right: 100px;">
										<input type='hidden' class='btn btn-next btn-fill btn-primary btn-wd' value='채팅방 입장' id="enterBtn"/>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- wizard container -->
					</div>
				</div>
			</div>
			<!-- End Content -->
		</div>
	</div>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
</body>
<script>
    $(document).ready(function() {
      // Initialise the wizard
      demo.initNowUiWizard();
      setTimeout(function() {
        $('.card.card-wizard').addClass('active');
      }, 600);
    });
  </script>
</html>