<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>to do list 간편입력 (미리입력)</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

		<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div class="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
	
		<div class="d-flex justify-content-center">
			<section class="content">
				<!-- 간편입력 추가 -->
				<div class="mt-3">
					<div class="d-flex mt-2">
						<span>시작날짜 : </span>
						<input type="date" id="startDateInput" class="form-control col-4 ml-2">
						<span class="ml-2">종료날짜 : </span>
						<input type="date" id="endDateInput" class="form-control col-4 ml-2">
					</div>
					<div class="d-flex mt-2">
						<input type="text" id="titleInput" class="form-control col-10" placeholder="할 일">
						<button type="button" id="addBtn" class="btn btn-sm btn-info ml-3">추가</button>
					</div>
				</div>
			
				<!-- 간편입력 리스트 -->
				<c:forEach var="simpleTodo" items="${simpleTodoList }">
				
					<div class="border d-flex">
						<div class="mt-3 ml-2">${simpleTodo.title }</div>
						<div class="mt-3 ml-2"><fmt:formatDate value="${simpleTodo.startDate }" pattern="yyyy-MM-dd"/></div>
						<div class="mt-3 mx-2"><fmt:formatDate value="${simpleTodo.endDate }" pattern="yyyy-MM-dd"/></div>
					</div>
				
				</c:forEach>
			</section>
		</div>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>

	<script>
	
		$(document).ready(function(){
			
			$("#addBtn").on("click", function(){
				let title = $("#titleInput").val();
				let startDate = $("#startDateInput").val();
				let endDate = $("#endDateInput").val();
				
				if(title == ""){
					alert("내용을 입력해주세요.");
					return;
				}
				if(startDate == ""){
					alert("시작날짜를 선택해주세요.");
					return;
				}
				if(endDate == ""){
					alert("종료날짜를 선택해주세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/plan/todo/simple_create",
					data:{"title":title, "startDate":startDate, "endDate":endDate},
					success:function(data){
						if(data.result == "success"){
							alert("간편입력 성공");
							location.reload();
						}else{
							alert("간편입력 실패");
						}
					},
					error:function(){
						alert("간편입력 에러");
					}
				});
				
				
			});
			
			
		});
	
	
	
	
	
	</script>




</body>
</html>