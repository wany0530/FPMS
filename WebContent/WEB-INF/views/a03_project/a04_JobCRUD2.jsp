<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="fileName" value="${pageContext.request.servletPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<%@ include file="../a01_main/bootstrapTop.jsp"%>
<style>
#tableData th {
	text-align: center;
}

#tableData td {
	text-align: center;
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

				<!--  -->
				<div class="row">
					<div class="col" style="height: 600px;">
						<div class="col-md-8 ml-auto mr-auto">
							<h2 class="text-center">작업 관리</h2>
						</div>
						<form:form modelAttribute="sch" method="post" id="getlist">
							<form:hidden path="curPage" />
							<div class="card" style="padding: 10px; display: flex;">
								<div id="jobH" class="row">
									
									<div class="col" id="count">
										<!-- ajax처리 -->
									</div>
									<div class="form-group">
										<form:select class="selectpicker" path="u_no" id="wR">
											<form:option value="">전체</form:option>
											<c:forEach var="pp" items="${people}">
												<form:option value="${pp.u_no}">${pp.u_name}</form:option>>
										</c:forEach>
										</form:select>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<form:input type="text" class="form-control" path="j_name" id="jN" placeholder="작업명을 입력해주세요." />
										</div>
									</div>
									<div class="col" align="right">
										<span style="font-size: 10pt; color: white; margin: 0px 10px;">페이지 크기</span> 
										<label> 
											<form:select path="pageSize" items="${pageO }" class="form-control" /> 
										</label>
									</div>
								</div>

								<table class="table table-striped" id="tableData">
									<thead>
										<tr>
											<th width="10%">작업번호</th>
											<th width="30%" style="text-align: left">작업명</th>
											<th width="10%">프로젝트명</th>
											<th width="15%">시작날짜</th>
											<th width="15%">종료날짜</th>
											<th width="10%">담당자</th>
											<th width="10%">완료율</th>
										</tr>
									</thead>
									<tbody id="list">
										<!-- ajax처리 -->
									</tbody>
								</table>
								<ul class="pagination justify-content-center" style="bottom: 0;" id="paging">
									<!-- ajax처리 -->
								</ul>
							</div>
						</form:form>
						<div align="right" style="margin-right: 10px;">
							<button class="btn" id="regBtn">등록</button>
							<button class="btn" id="jobBack">이전 페이지</button>
						</div>
					</div>
				</div>
				<!-- End Content -->
			</div>
		</div>
	</div>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		getlist();
		$("#jN").keyup(function(){
			getlist();
		});
		$("#wR").change(function(){
			getlist();
		})
		function getlist(){
			$.ajax({
				type:"post",
				url:"${path}/job.do?method=data2",
				data: $("#getlist").serialize(),
				dataType:"json",
				success:function(data){
					console.log(data.job);
					var joblist = data.job;
					var today = new Date().getTime()/(1000*60*60*24);
					var toFmt = parseInt(today);
					var sch = data.sch;
					var show="";
					$.each(joblist, function(idx, job){
						var crFmt = parseInt(new Date(job.j_regD).getTime()/(1000*60*60*24));
						show +="<tr class='data' id='"+job.j_no+"'>";
						show +="<td>"+job.cnt+"</td>";
						show +="<td style='text-align:left'>";
						for(var sts=1; sts<=job.level; sts++){
							if(job.j_refno > 1) show += "&nbsp;&nbsp&nbsp;&nbsp&nbsp;"
							if(job.j_refno > 1 && (sts==job.level)) show += "┗";
						}
						
						show += "&nbsp;"+job.j_name+"&nbsp;";
						if(toFmt == crFmt){
							show +="<span class='badge badge-danger'>New</span>";
						}
						show +="</td>";
						show +="<td>"+job.j_pname+"</td>";
						show +="<td>"+job.j_startD_s+"</td>";
						show +="<td>"+job.j_endD_s+"</td>";
						show +="<td>"+job.j_charger+"</td>";
						show +="<td>";
						show +="<div class='progress-container' style='padding-top:4px;'>";
						show +="<div class='progress'>";
						show +="<div class='progress-bar' role='progressbar' aria-valuenow='60' aria-valuemin='0' aria-valuemax='100' style='width:"+job.j_completeR * 100+"%;'>";
						show +="<span class='progress-value'>"+job.j_completeR*100+"%</span>";
						show +="</div></div></div></td></tr>";
					})
					$("#list").html(show);
					show2 = paging(sch);
					$("#paging").html(show2);
					var show3 = "";
					show3 += "<button class='btn btn-primary btn-round' disabled>총"+sch.count+"건</button>";
					$("#count").html(show3);
					
					
					
					$(".data").on("dblclick", function() {
						var no = $(this).attr("id");
						location.href = "${path}/job.do?method=detail&no=" + no;
					});
				},
				error:function(err){
					alert("에러발생");
					console.log(err);
				}
			});
		}
		$("#jobBack").on("click", function() {
			location.href = "${path}/job.do?method=job";
		});
		$("#regBtn").on("click", function() {
			location.href = "${path}/job.do?method=insertForm";
		});
		$("#jobBtn").attr("class", "btn btn-primary");

		$("[name=pageSize]").change(function() {
			$("[name=curPage]").val(1);
			$("#getlist").submit();
		})

		$("option").attr("style", "color:navy;");
		
		function paging(sch){
			var show2 = "";
			show2 +="<li class='page-item'>";
			show2 +="<input type='hidden' value='"+sch.startBlock+"'/>";
			show2 +="<a class='page-link' href='javascript:goPage("+(sch.curPage-1)+")'>&lt;&lt;</a>";
			show2 +="</li>";
			for(var cnt=sch.startBlock; cnt<=sch.endBlock; cnt++){				
				var result = ((sch.curPage == cnt)?'active':'');
				show2 +="<li class='page-item "+result+"'>";
				show2 +="<a class='page-link' href='javascript:goPage("+cnt+")'>"+cnt+"</a>";
				show2 +="</li>";
			}
			show2 +="<li class='page-item'>";
			show2 +="<a class='page-link' href='javascript:goPage("+(sch.curPage+1)+")'>&gt;&gt;</a>";
			show2 +="</li>";
			return show2;
		};
	});
	
	function goPage(page) {
		$("[name=curPage]").val(page);
		$("form").submit();
	};

</script>
</html>