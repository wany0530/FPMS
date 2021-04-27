<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<title>Basic initialization</title>
<script src="/zenkit/a00_com/a02_project/codebase/sources/dhtmlxgantt.js"></script>
<link rel="stylesheet" href="/zenkit/a00_com/a02_project/codebase/sources/dhtmlxgantt.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<!-- icons -->
<link href="${path}/Admin/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css?v=5.2.0">
<style>
html, body {
	height: 100%;
	padding: 0px;
	margin: 0px;
	overflow: hidden;
}

.fa {
	cursor: pointer;
	font-size: 14px;
	text-align: center;
	opacity: 0.2;
	padding: 5px;
}

.fa:hover {
	opacity: 1;
}

.fa-pencil {
	color: #ffa011;
}

.fa-plus {
	color: #328EA0;
}

.fa-times {
	color: red;
}
</style>
</head>
<body>

	<div id="gantt_here" style='width: 100%; height: 90%;'></div>

	<script>
	document.addEventListener("DOMContentLoaded",function(){
		// json데이터를 받아 ajax처리로 차트 출력
		getGantt();
		function getGantt(){
			$.ajax({
				type:"post",
				url:"${path}/job.do?method=data",
				dataType:"json",
				success:function(data){
					var project = data.project;
					var people = data.people;
					var data = data.job;
					gantt.init("gantt_here");
					gantt.parse({
						data
					});
				},
				error:function(err){
					alert("에러발생");
					console.log(err);
				}
			});
		}
		gantt.config.scales = [
		    {unit: "month", step: 1, format: "%F, %Y"},
		    {unit: "day", step: 1, format: "%j, %D"}
		];
		

		// Gantt차트 속성 정의
		var colHeader = '<div class="gantt_grid_head_cell gantt_grid_head_add" onclick="gantt.createTask()"></div>';
		gantt.config.columns = [
			{ name: "text", tree: true, width: 250, resize: true }, // 작업명
            { name: "start_date", align: "center", resize: true ,width: 100}, // 시작일
            { name: "end_date", align: "center", resize: true ,width: 100}, // 종료일
            { name: "progress", align: "center" ,width: 100}, // 완료율
	        { name: "buttons", label:"관리", width: 75, template: function(task) { // CRUD 
	            return (
	               '<i class="fa fa-pencil" align="center" data-action="edit"></i>' +
	               '<i class="fa fa-plus" align="center" data-action="add"></i>' +
	               '<i class="fa fa-times" align="center" data-action="delete"></i>'
	               );
	         }}
	      ];
		
		/* 간트영역 작업 더블클릭시 상세정보 막아둠 */
		gantt.attachEvent("onTaskDblClick", function(id,e){
		    return false;
		});
		
		/* 간트 영역 드래그 PM제외 기능 제한*/
		gantt.attachEvent("onBeforeTaskDrag", function(id, mode, e){
			var pm = "${project.p_pm}";
    		var user = "${sesMem.u_id}";
    		if(pm != user){
    			alert("작업 수정 권한이 없습니다.");
    			return false;
    		}else{
    			return true;	
    		}
		});
		
		
		
		/* 간트영역 수정/생성/삭제 클릭시 기능별 정의 */
		gantt.attachEvent("onTaskClick", function(id, e){
	        var button = e.target.closest("[data-action]")
	        if(button){
	            var action = button.getAttribute("data-action");
	            switch (action) {
	                case "edit":
	                	var pm = "${project.p_pm}";
	            		var user = "${sesMem.u_id}";
	            		if(pm != user){
	            			alert("작업 수정 권한이 없습니다.");
	            		}else{
	            			gantt.showLightbox(id);	
	            		}
	                    break;
	                case "add":
	                	var pm = "${project.p_pm}";
	            		var user = "${sesMem.u_id}";
	            		if(pm != user){
	            			alert("작업 등록 권한이 없습니다.");
	            		}else{
	            			alert("작업 등록시 완료율 0% 고정입니다.")
	            			gantt.createTask(null, id);
	                        break;
	            			/* location.href="${path}/job.do?method=insertForm"; */
	            		}
	                    break;
	                case "delete":
	                	var pm = "${project.p_pm}";
	            		var user = "${sesMem.u_id}";
	            		if(pm != user){
	            			alert("작업 삭제 권한이 없습니다.");
	            		}else{
	            			gantt.locale.labels.confirm_deleting= "하위 작업도 삭제됩니다. <br>삭제 하시겠습니까?";
		                    gantt.confirm({
		                        title: gantt.locale.labels.confirm_deleting_title,
		                        text: gantt.locale.labels.confirm_deleting,
		                        callback: function (res) {
		                            if (res)
		                                gantt.deleteTask(id);
		                        }
		                    });	
	            		}
	                    break;
	            }
	            return false;

	        }
	        return true;
	    });
		
		 // lightbox 내부 속성 영역 추가
	    gantt.config.lightbox.sections = [
	          {name:"description", height:30, map_to:"text", type:"textarea", focus:true},
	          {name:"centent", height:30, map_to:"jcontent", type:"textarea"},
	          {name:"time", height:30, map_to:"start_date", type:"duration"},
	          {name:"endtime", height:30, map_to:"end_date", type:"duration"},
	          {name:"progress", height:30, map_to:"progress", type:"textarea"}
	    ];
	    // (lightbox에 속성 이름 정의)
	    gantt.locale.labels.section_endtime="종료날짜";
	    gantt.locale.labels.section_centent="작업설명";
	    gantt.locale.labels.section_progress="완료율";
	    
	    
	    // lightbox 내 버튼들 재정의
	    gantt.attachEvent("onGanttReady", function(){
	    	gantt.config.buttons_left = ["gantt_cancel_btn"];   
	    	gantt.config.buttons_right = ["gantt_save_btn"];
	    	gantt.locale.labels["gantt_save_btn"] = "저장";
	   	    gantt.locale.labels["gantt_cancel_btn"] = "취소";
	    });
	    
	    
	    
	    
		gantt.attachEvent("onAfterTaskAdd", function(id,item){
			if(item.progress > 1 || item.progress < 0){
				alert("완료율 0.0(0%) ~ 1.0(100%)범위로 입력해주세요. ");
				gantt.deleteTask(id);
				gantt.hideLightbox();
			}else if(item.text != "" && item.jcontent != "" && item.end_date > item.start_date){
				insertCall(id,item);
			}else{
				alert("데이터를 확인해 주세요 \n 완료율 0.0(0%) ~ 1.0(100%)범위로 입력해주세요. ");
				gantt.deleteTask(id);
				gantt.hideLightbox();
			}
		});
		
		gantt.attachEvent("onAfterTaskUpdate", function(id,item){
			if(item.progress > 1 || item.progress < 0){
				alert("완료율 0.0(0%) ~ 1.0(100%)범위로 입력해주세요. ");
				getGantt();
			}else if(item.text != "" && item.jcontent != "" && item.end_date > item.start_date){
				updateCall(id,item);
			}else{
				alert("데이터를 확인해주세요. \n 완료율 0.0(0%) ~ 1.0(100%)범위로 입력해주세요. ");
				getGantt();
			}
		});
		  
		gantt.attachEvent("onAfterTaskDelete", function(id,item){
			deleteTask(id);
		});
	});
	// 업데이트 처리
	function updateCall(id, item){
		if(item.progress == ""){
			item.progress = 0.0;
		}
		$.ajax({
			type:"post",
			url:"${path}/job.do?method=update2",
			data:item,
			dataType:"json",
			 success:function(data){
				  if(data.success=="Y"){
					  alert("수정 완료");  
					  console.log(data.gantt);
				  }
			  },
			  error:function(err){
				  console.log("에러발생: " + err);
				  console.log(err);
			  }
		});
	}
	// insert 처리
	function insertCall(id,item){
		var sch = newSch(item);
		sch.progress = 0;
		$.ajax({
			type:"post",
			url:"${path}/job.do?method=insert2",
			data:sch,
			dataType:"json",
			 success:function(data){
				  if(data.success=="Y"){
					  alert("등록 완료");  
					  console.log(data.gantt);
				  }
			  },
			  error:function(err){
				  alert("에러발생: " + err);
				  console.log(err);
			  }
		})
	}
	
	gantt.message({type:"error", text:""});
	
	function deleteTask(id){
		$.ajax({
			type:"post",
			url:"${path}/job.do?method=delete2",
			data:{id:id},
			dataType:"json",
			 success:function(data){
				  if(data.success=="Y"){
					  alert("삭제 완료");  
					  console.log(data.gantt);
				  }
			  },
			  error:function(err){
				  console.log(err);
			  }
		});
	}
	function callSch(gantt){
		console.log("###callSch###");
		console.log(gantt);
	  var sch = {};
	  sch.text = gantt.text; 
	  sch.jcontent = gantt.jcontent;	
	  sch.text = gantt.text;
	  sch.start_date = gantt.start_date;
	  sch.end_date = gantt.end_date;
	  sch.progress = gantt.progress; 
	  return sch;
	};
	
	function newSch(gantt){
		console.log("###newSch###");
		console.log(gantt);
	  var sch = {};
	  sch.parent = gantt.parent; 
	  sch.jcontent = gantt.jcontent;	
	  sch.text = gantt.text;
	  sch.start_date = gantt.start_date;
	  sch.end_date = gantt.end_date;
	  sch.progress = gantt.progress; 
	  return sch;
	};
	
	/* 삭제 처리 기능 */
	function getFormatDate(date){
	    var year2 = date.substring(0,4);
	    var month2 = date.substring(5,7);
	    var day2 = date.substring(8,10);        
	    var limit = new Date(year2,month2,day2);
	    return limit;
	}
	
	</script>

</body>