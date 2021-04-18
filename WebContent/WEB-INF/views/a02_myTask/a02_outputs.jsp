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
<title>zenkit</title>
<%@ include file="../a01_main/bootstrapTop.jsp"%> 
</head>
<body class="sidebar-mini ">
	<div class="wrapper">

		<%@ include file="../a01_main/sidebar.jsp"%>

		<div class="main-panel">
			
			<%@ include file="../a01_main/header.jsp"%>

			<!-- Start Content -->
			<div class="content">
				<%@ include file="my_task_header.jsp"%>
			 	
				<div class="row align-items-center">
				
					<!-- 프로젝트로 검색 -->
					<div class="col-md-3 ">
						<select class="selectpicker" data-size="5" data-style="btn btn-primary"
							title="Single Select" id="modalProList">
							<option selected>전체</option>
						</select>
					</div>
					
					<!-- 검색 -->
					<div class="col-sm-4 text-right">
						<div class="input-group m-0">
							<div class="input-group-prepend">
								<div class="input-group-text mb-1">
									<i class="tim-icons icon-zoom-split"></i>
                        </div>
							</div>
							<input type="text" name="firstname" style="height: 40px;"
                      	class="form-control mb-1" placeholder="Search.." />
						</div>
					</div>
					
					<!-- 등록 버튼 -->
					<div class="col-sm-2 text-right mb-1 ml-auto">
						<button class="btn btn-primary" data-toggle="modal" data-target="#regModal">
							산출물 등록
						</button>
					</div>
				
				</div>
			 	
			 	
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<table id="simple-table" class="table text-center">
									<colgroup>
										<col width="25%">
										<col width="25%">
										<col width="20%">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<thead>
										<tr>
											<th>산출물 명</th>
											<th>작업 명</th>
											<th>프로젝트 명</th>
											<th>파일 명</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
									
										<c:forEach var="output" items="${outputList}">
										<tr>
											<input type="hidden" value="${output.o_no}"/>
											<input type="hidden" value="${output.o_path}"/>
											<td class="text-left pl-5">${output.o_name}</td>
											<td class="text-left pl-5">${output.j_name}</td>
											<td class="text-center">${output.p_name}</td>
											<td class="text-center">${output.f_name}</td>
											<td class="text-right">
												<button class="btn btn-icon btn-info download ml-3"
													${(empty output.o_path)? 'disabled' : ''}>
													<i class="fas fa-download"></i>
												</button>
												<button class="btn btn-icon btn-danger delete ml-3">
													<i class="tim-icons icon-simple-remove"></i>
												</button>
											</td>
										</tr>
										</c:forEach>

									</tbody>
								</table>
								<ul class="pagination justify-content-center">
									<li class="page-item"><a class="page-link" href="#link"
										aria-label="Previous"> <span aria-hidden="true"><i
												class="tim-icons icon-double-left" aria-hidden="true"></i></span>
									</a></li>
									<li class="page-item"><a class="page-link" href="#link">1</a>
									</li>
									<li class="page-item active"><a class="page-link"
										href="#link">2</a></li>
									<li class="page-item"><a class="page-link" href="#link">3</a>
									</li>
									<li class="page-item"><a class="page-link" href="#link"
										aria-label="Next"> <span aria-hidden="true"><i
												class="tim-icons icon-double-right" aria-hidden="true"></i></span>
									</a></li>
								</ul>
							</div>
							<!-- end card-body-->
						</div>
						<!--  end card  -->
					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->

				<div class="row">
				
					<!-- notice modal -->
					<div class="modal fade" id="regModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-notice">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">
										<i class="tim-icons icon-simple-remove"></i>
									</button>
									<h4 class="modal-title" id="myModalLabel">산출물 등록</h4>
								</div>
								
								<form method="post" id="regForm" enctype="multipart/form-data"
									action="${path}/output.do?method=reg">
								<div class="modal-body">
								
									<!-- 산출물 정보 -->
									<div class="row mb-2 text-right">
										<label class="col-sm-3 col-form-label title">
											산출물 명 :
										</label>
										<div class="col-sm-9">
											<div class="form-group pr-4">
												<input type="text" class="form-control" name="o_name"
			                        		value="" style="color: black;">
											</div>
										</div>
									</div>
										
									<!-- 프로젝트 선택 -->
									<div class="row mb-2 text-right">
										<label class="col-sm-3 col-form-label title">
											프로젝트 :
										</label>
										<div class="col-sm-9">
											<div class="form-group pr-4">
												<select class="form-control" style="color: black;"
													name="p_no">
													<option disabled selected>프로젝트 선택</option>
												</select>
											</div>
										</div>
									</div>
									
									<!-- 작업 선택 -->
									<div class="row mb-2 text-right">
										<label class="col-sm-3 col-form-label title">
											작업 :
										</label>
										<div class="col-sm-9">
											<div class="form-group pr-4">
												<select class="form-control" style="color: black;"
													id="j_no" name="j_no">
												<option disabled selected>작업 선택</option>
											</select>
											</div>
										</div>
									</div>
										
									<!-- 산출물 내용 -->
									<div class="row mb-3 text-right">
										<label class="col-sm-3 col-form-label title">
											내용 :
										</label>
										<div class="col-sm-9">
											<div class="form-group pr-4">
												<textarea rows="10" cols="" class="form-control"
													style="color: black;" name="o_content"></textarea>
											</div>
										</div>
									</div>
										
									<!-- 산출물 첨부 -->
									<div class="row mb-3 text-right">
										<label class="col-sm-3 col-form-label title">
											첨부 :
										</label>
										<div class="col-sm-9">
											<div class="pr-4">
												<input type="file" name="o_file"/>
											</div>
										</div>
									</div>
									
									<!-- button group -->
									<div class="row">
										<div class="col-12 text-right">
											<button type="button" class="btn btn-primary"
												id="regBtn">
												등록
											</button>
											<button type="button" class="btn"
												data-dismiss="modal" id="closeBtn">
												취소
											</button>
										</div>
									</div>
								</div>
								</form>
								
							</div>
						</div>
					</div>
				</div>
				<!-- end notice modal -->
				
			</div>
			<!-- End Content -->

		</div>
	</div>
	
	<script src="${path}/assets/js/core/jquery.min.js"></script>
	<script>
		function ajaxInit(){
			$.ajax({
				type:"post",
				url:"${path}/project.do?method=data",
				dataType:"json",
				success:function(data){
					console.log(data);
					var proejctList = data.projectList;
					
					var show = "";
					$.each(proejctList, function(idx, pro){
						show += "<option value='"+pro.p_no+"'>"+pro.p_name+"</option>";
					});
					$('[name=p_no]').append(show);
					$('#proList').append(show);
					
				},
				error:function(err){
					console.log(err);
				}
			});
		}
		ajaxInit();
	</script>
	<%@ include file="../a01_main/plugin.jsp"%>
	<%@ include file="../a01_main/bootstrapBottom.jsp"%>
	<script>
	
		// 프로젝트 클릭 시, 작업 내역 가져오기
		$('[name=p_no]').change(function(){
			$(this).val();
			$.ajax({
				type:"post",
				url:"${path}/project.do?method=userJob",
				data:$('#regForm').serialize(),
				dataType:"json",
				success:function(data){
					var jobList = data.jobList;
					
					
					var show = "<option disabled selected>작업 선택</option>";
					$.each(jobList, function(idx, job){
						show += "<option value='"+job.j_no+"'>"+job.j_name+"</option>";
					});
					$('#j_no').html(show);
				},
				error:function(err){
					console.log(err);
				}
			});
		})
		
		// 산출물 등록
		$('#regBtn').on("click",function(){
			var o_name = $('[name=o_name]').val();
			var p_no = $('[name=p_no] option:selected').val();
			var j_no = $('[name=j_no] option:selected').val();
			
			console.log(o_name);
			console.log(p_no);
			console.log(j_no);
			
			if(o_name.trim() == "" || o_name.trim() == null){
				Swal.fire({
					position: 'center',
					type: 'warning',
					title: '산출물 명을 입력하세요.',
					showConfirmButton: false,
					timer: 1500
		      })
		      $('[name=o_name]').val("").focus();
			} else if(p_no == '프로젝트 선택'){
				Swal.fire({
					position: 'center',
					type: 'warning',
					title: '프로젝트를 선택하세요.',
					showConfirmButton: false,
					timer: 1500
		      })
			} else if(j_no == '작업 선택'){
				Swal.fire({
					position: 'center',
					type: 'warning',
					title: '프로젝트를 선택하세요.',
					showConfirmButton: false,
					timer: 1500
		      })
			} else {
				$('#regForm').submit();
			}
		});
		
		// 산출물 삭제
		$('.delete').on("click", function(){
			// 산출물 번호 선택
			var o_no = $(this).parent().prevAll().eq(5).val();
			console.log(o_no);
			const swalWithBootstrapButtons = Swal.mixin({
				customClass: {
					confirmButton: 'btn btn-success',
					cancelButton: 'btn btn-danger'
				},
				buttonsStyling: false
				})
		      swalWithBootstrapButtons.fire({
					title: '정말 삭제하시겠습니까?',
					type: 'warning',
					showCancelButton: true,
					confirmButtonText: '삭제',
					cancelButtonText: '취소',
					reverseButtons: true
		      }).then((result) => {
				if (result.value) {
					location.href="${path}/output.do?method=del&o_no="+o_no;
				} 
			})
		})
		
		// 산출물 다운로드
		$('.download').on("click", function(){
			var o_path = $(this).parent().prevAll().eq(4).val();
			var realpath = "${path}/z03_upload"+o_path;
			
			// 파일 유뮤 테스트
			$.ajax({
				url: realpath,
				type: 'HEAD',
				success: function () {
					const swalWithBootstrapButtons = Swal.mixin({
						customClass: {
							confirmButton: 'btn btn-success',
							cancelButton: 'btn btn-danger'
						},
						buttonsStyling: false
						})
				      swalWithBootstrapButtons.fire({
							title: '다운로드 하시겠습니까',
							type: 'warning',
							showCancelButton: true,
							confirmButtonText: '다운로드',
							cancelButtonText: '취소',
							reverseButtons: true
				      }).then((result) => {
						if (result.value) {
							location.href="${path}/output.do?method=down&fname="+o_path;
						} 
					}) 
				},
				error: function () {
					Swal.fire({
						position: 'center',
						type: 'error',
						title: '파일을 다운로드 할 수 없습니다.',
						showConfirmButton: false,
						timer: 1500
					})
				}
			});
		})
	</script>
	
</body>
</html>