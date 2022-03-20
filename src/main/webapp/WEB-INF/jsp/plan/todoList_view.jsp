<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>To do List</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

		<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center">
		<div class="content d-flex justify-content-between">
			
			<!-- 달력 (날짜 선택을 위한) -->
			<div class="mt-3" id="calender"></div>
			
			<!-- todo list -->		
			<div class="col-6">
				<fmt:formatDate var="date" value="${checkDate }" pattern="yyyy-MM-dd" />
				<h4 class=" text-center" >${date }</h4>
				<hr>
				
				<c:forEach var="data" items="${allTodoList }">
					<div class="d-flex">
						<a href="#" class="checkBtn" data-id="${data.todoList.id }">
							<c:choose>
								<c:when test="${not data.check}">
									<div><i class="bi bi-square"></i></div>
								</c:when>
								<c:when test="${data.check}">
									<div><i class="bi bi-check-square"></i></div>
								</c:when>
							</c:choose>
						</a>
						<div class="ml-2">${data.todoList.title }</div>
					</div>
				</c:forEach>
				
				<!-- 일정 추가 -->
				<div class="d-flex justify-content-center mt-3">
					<input type="text" id="addTodo" class="form-control" placeholder="+ 일정추가">
					<button type="button" id="addTodoBtn" class="btn btn-secondary btn-sm ml-2">추가</button>
				</div>
			</div>
			
			
		</div>
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

</body>

	<script>
		
		$(document).ready(function(){
			
			// 데이트피커 기본 설정
			$("#calender").datepicker({
				dateFormat: 'yy-mm-dd',
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				dayNames: ['일','월','화','수','목','금','토'],
				dayNamesMin : ['일','월','화','수','목','금','토']
			});
			
			// 데이트피커(달력)에서 다른 날짜 클릭시 todoList_view_otherDay 로 이동 
			$("#calender").change( function(){
				let pick = $("#calender").val();
				location.href="/plan/todoList_view_otherDay?date=" + pick;
			});
			
			// 기본 투두리스트 추가
			$("#addTodoBtn").on("click", function(e){
				e.preventDefault();
				
				let date = "${date}"; // 이것 관련 해서 고민 방향 적어두기
				let title = $("#addTodo").val();
				let color = "black";
			 	
				if(title == ""){
					alert("내용을 적어주세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/plan/todo/create",
					data:{"title":title,"date":date,"color":color},
					success:function(data){
						if(data.result == "success"){
							location.reload();
						}else{
							alert("입력실패");
						}
					},
					error:function(){
						alert("입력 에러 발생");
					}
				});  
			});
			
			// 투두 체크기능 (체크하기, 체크취소)
			$(".checkBtn").on("click", function(e){
				e.preventDefault();
				
				let todoListId = $(this).data("id");
				
				$.ajax({
					type:"get",
					url:"/plan/todo/check",
					data:{"todoListId":todoListId},
					success:function(data){
						if(data.result == "success"){
							location.reload();
						}
						else{
							alert("체크 변경 실패");
						}
					},
					error:function(){
						alert("todo 체크 에러발생");
					}
				});
			});
			
			
			
			
		});
		
	
	</script>











</html>