<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../a01_main/bootstrapTop.jsp"%>
	<style>
	.project-item:hover {
		background: #1E1E28;
		cursor: pointer;
	}
	#nextBtn:focus {
		outline: 0;
		background: #fff;
	}
	.cnt {
		display: inline-block;
		width: 50px;
		height: 20px;
		border-radius: 5px;
		font-weight: 600;
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
			<div class="content">
				
				<div class="row mb-3">
				
					<!-- 보기 -->
					<label class="col-sm-1 col-form-label text-right">
						<p class="mt-2">페이지 크기</p>
					</label>
					<div class="col-12 col-md-1 pl-0">
						<select class="selectpicker" data-size="7" data-style="btn btn-primary"
							title="Single Select" id="pageSize">
							<option selected>3</option>
							<option>5</option>
							<option>10</option>
							<option>20</option>
						</select>
					</div>
					
					<!-- 검색 -->
					<div class="col-12 col-md-3 pr-0">
						<div class="input-group m-0" style="top: 5px;">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<i class="tim-icons icon-zoom-split"></i>
								</div>
							</div>
							<input type="text" name="schWord" value="${schObject.schWord}"
								class="form-control" placeholder="Search.."/>
						</div>
					</div>
					<div class="col-12 col-md-3 text-left p-0">
						<button class="btn" id="schBtn">검 색</button>
					</div>
					
					<!-- 등록 -->
					<c:if test="${sesMem.pos_no == 3}">
					<div class="col-12 col-md-2 ml-auto text-right">
						<button class="btn btn-primary"
							onclick="location.href='${path}/project.do?method=regForm'">
							프로젝트 등록
						</button>
					</div>
					</c:if>
					
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<form id="proForm" method="post">
								<input type="hidden" name="p_no" value=""/>
								<table id="simple-table" class="table text-center">
									<colgroup>
										<col width="30%">
										<col width="20%">
										<col width="15%">
										<col width="15%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th>프로젝트</th>
											<th>프로젝트 코드</th>
											<th>시작일</th>
											<th>완료일</th>
											<th>산출물</th>
											<th>리스크</th>
										</tr>
									</thead>
									
									<tbody id="project-list">
									</tbody>
									
								</table>
								</form>
								
								<!-- 페이징 -->
								<ul class="pagination justify-content-center">
									<!-- 이전 버튼 -->
									<li class="page-item" id="preBtn">
										<button class="page-link" aria-label="Previous" style="background: none;">
											<span aria-hidden="true">
												<i class="tim-icons icon-double-left" aria-hidden="true"></i>
											</span>
										</button>
									</li>
									
									<ul class="pagination justify-content-center" id="pageList">
									</ul>
									
									<!-- 다음 버튼 -->									
									<li class="page-item" id="nextBtn">
										<button class="page-link" aria-label="Next" style="background: none;">
											<span aria-hidden="true">
												<i class="tim-icons icon-double-right" aria-hidden="true"></i>
											</span>
										</button>
									</li>
									
								</ul>
								
							</div>
							<!-- end content-->
						</div>
						<!--  end card  -->
					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->
      	</div>
			<!-- End Content -->

		</div>
	</div>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
	
	<script>
	 jQuery(function($){
		 
		/****** init ******/
		var page = 1;
		var startPage = 1;
		var endPage = 1;
		var lastPage = 1;
		var sch = "";
		var size = $('#pageSize').children("option:selected").text();
		$('.dropdown-toggle').css("margin","0px").css("top","5px").css("height","38px");
		
		getProList(page, sch, size); // pro 리스트 출력
		/****** End of Init ******/
		
		// pageSize 변경
		$('#pageSize').change(function(){
			size = $(this).children("option:selected").text();
			
			getProList(1, sch, size); // pro 리스트 출력
		});
		
		// 페이지 버튼 클릭
		$(document).on("click", ".pageBtn",function(){
			page = $(this).text(); // 클릭된 번호 얻기
			sch = $('[name=schWord]').val(); // 검색어 얻기 
			
			getProList(page, sch, size); // pro 리스트 출력
		});
		
		// 이전 버튼
		$(document).on("click", "#preBtn",function(){
			page = startPage-5; // 이전 페이지 구하기
			sch = $('[name=schWord]').val(); // 검색어 얻기
			
			getProList(page, sch, size); // pro 리스트 출력
		});
		// 다음 버튼
		$(document).on("click", "#nextBtn",function(){
			page = (endPage+1 > lastPage)? lastPage : endPage+1; // 다음 페이지 구하기
			sch = $('[name=schWord]').val(); // 검색어 얻기
			
			getProList(page, sch, size); // pro 리스트 출력
		});
		
		// 검색
		$('#schBtn').on('click', function(){
			sch = $('[name=schWord]').val(); // 검색어 얻기
			
			getProList(1, sch, size); // 리스트 출력
		})
		
		// 프로젝트 상세 클릭
		$(document).on("click",".project-item",function(){
			var p_no = $(this).children().eq(1).text();
			$('[name=p_no]').val(p_no);
			$('#proForm').submit();
		});
		
		// 함수 : 프로젝트 리스트
		function getProList(page, sch, size){
			// 클래스 삭제
			$('.page-item').removeClass("active");
			
			// query String 생성
			var address = "${path}/project.do?method=data";
			address += "&u_no=${sesMem.u_no}";
			address += "&currPage="+page;
			address += "&schWord="+sch;
			address += "&pageSize="+size;
			
			$.ajax({
				type: "post",
				url: address,
				dataType: "json",
				success:function(data){
					var projectList = data.projectList;
					var schProject = data.schProject;
					startPage = schProject.startPage;
					endPage = schProject.endPage;
					lastPage = schProject.lastPage;
					console.log(data);
					
					// 프로젝트 리스트
					var show = "";
					$.each(projectList, function(idx, pro){
						show += "<tr class='project-item'><td>"+pro.p_name+"</td>";
						show += "<td>"+pro.p_no+"</td>";
						show += "<td>"+pro.p_startD_s+"</td>";
						show += "<td>"+pro.p_endD_s+"</td>";
						show += "<td><span class='cnt badge-info'>"+pro.outputCnt+"</span></td>";
						show += "<td><span class='cnt badge-danger'>"+pro.riskCnt+"</span></td></tr>";
					});
					$('#project-list').html(show);
					
					// 페이지 구성
					show = "";
					for(i=startPage; i<=endPage; i++){
						show += "<li class='page-item'>";
						show += "<button class='page-link pageBtn'>";
						show += i
						show += "</button></li>";
					}
					$('#pageList').html(show);
					$('#pageList li').eq(schProject.currPage%5-1).addClass("active");
					
					// 이전 페이지 없을때 조건 처리
					if(startPage <= 1)
						$('#preBtn').css("display", "none");
					else {
						$('#preBtn').css("display", "inline-block");
					}
					// 다음 페이지 없을때 조건 처리
					if(endPage >= lastPage)
						$('#nextBtn').css("display", "none");
					else {
						$('#nextBtn').css("display", "inline-block");
					}
					
				},
				error:function(err){
					console.log(err);
				}
			});		
		}
	});
	 
	</script>
	
</body>
</html>