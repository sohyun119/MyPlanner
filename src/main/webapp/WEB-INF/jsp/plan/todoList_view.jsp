<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>To do List</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">	

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
			
			<!-- todo list -->		
			<div class="col-6">
				<c:forEach var="todoList" items="${todoList }">
					<div>${todoList.title }</div>
				</c:forEach>
				
				<!-- 일정 추가 -->
				<div class="d-flex justify-content-center">
					<input type="text" id="addTodo" class="form-control" placeholder="+ 일정추가">
					<button type="button" id="addTodoBtn" class="btn btn-secondary btn-sm ml-2">추가</button>
				</div>
			</div>
			
			<!-- 달력 (날짜 선택을 위한) -->
			<div class="ml-3" id="calender"></div>
			
		</div>
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

</body>

	<script>
		
		$(document).ready(function(){
			
			$("#calender").datepicker({
				dateFormat: 'yy-mm-dd',
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				dayNames: ['일','월','화','수','목','금','토'],
				dayNamesMin : ['일','월','화','수','목','금','토']
			});
			
			
			$("#addTodoBtn").on("click", function(){

				let date = $("#calender").datepicker().val();
				
				let title = $("#addTodo").val();
				let color = 'black';
			 	alert(date);
			 	
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
			
			
			
		});
		
	
	</script>











</html>