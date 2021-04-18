<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>Basic initialization</title>
	<script src="/zenkit/a00_com/a02_project/codebase/sources/dhtmlxgantt.js"></script>
	<script src="/zenkit/a00_com/a02_project/codebase/sources/dhtmlxgantt.css"></script>
	<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
	<script src="${path}/a00_com/jquery.min.js"></script>
	<script src="${path}/a00_com/jquery-ui.js"></script>
	<script src="${path}/a00_com/popper.min.js"></script>
	<style>
		html, body {
			height: 100%;
			padding: 0px;
			margin: 0px;
			overflow: hidden;
		}
	</style>
</head>
<body>

	<div id="gantt_here" style='width:100%; height:90%;'></div>
	
	<script>
		gantt.init("gantt_here");
		
		$.ajax({
			type:"post",
			url:"${path}/job.do?method=data",
			dataType:"json",
			success:function(data){
				var data = data.job;
				console.log(data);
				gantt.parse({
					data
				});
			},
			error:function(err){
				alert("에러발생");
				console.log(err);
			}
		})				
	</script>
</body>