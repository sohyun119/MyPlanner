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
				<h4 class=" text-center" >${date } <span class="text-secondary">. Todo List</span></h4>
				<hr>
				
				<c:forEach var="data" items="${allTodoList }">
				
					<div class="d-flex justify-content-between">
						<div class="d-flex"> 
							
							<!-- 체크 박스 --> 
							<a href="#" class="checkBtn" data-id="${data.todoList.id }">
								<c:choose>
									<c:when test="${not data.check}">
										<div class="text-dark"><i class="bi bi-square"></i></div>
									</c:when>
									<c:when test="${data.check}">
										<div class="text-dark"><i class="bi bi-check-square"></i></div>
									</c:when>
								</c:choose>
							</a>
							
							<!-- todoList 내용 -->
							<c:if test="${data.todoList.color == 'red'}">
								<mark class="ml-2 text-danger">${data.todoList.title }</mark>
							</c:if>
							
							<c:if test="${data.todoList.color == 'black' or data.todoList.color == 'gray'}">
								<div class="ml-2">${data.todoList.title }</div>
							</c:if>
						</div>
						
						<!-- 삭제, 수정 등 더보기 -->
						<a href="#" class="moreBtn text-secondary ml-2" data-toggle="modal" data-target="#exampleModalCenter${data.todoList.id }">
						<i class="bi bi-three-dots"></i>
						</a>
					
						<!-- Modal -->
						<div class="modal fade" id="exampleModalCenter${data.todoList.id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-body">
						      
						      	<button type="button" class="colorChangeBtn btn btn-primary form-control" data-id="${data.todoList.id }" data-color="${data.todoList.color }">
							      	<c:if test="${data.todoList.color == 'black'}">
							      	중요 표시 하기
							      	</c:if>
							      	<c:if test="${data.todoList.color == 'red' }">
							      	중요 표시 취소
							      	</c:if>
						      	</button>
		
						      
						        <button type="button" class="todoCancleBtn btn btn-primary form-control mt-3" data-id="${data.todoList.id }">삭제</button>
						      </div>
						    </div>
						  </div>
						</div>
					
					</div>				
				</c:forEach>
				
				<!-- 간편입력 todo 에서 불러온 예비 리스트 -->
				<c:forEach var = "simpleTodo" items="${simpleTodoList }">
					<!--connected == null (empty) 이면 main todo로 올라간게 없으므로 그냥 다 보여주고, 하나라도 있다면 아래와 같이 조건을 통해 보여준다.-->
					<c:choose>
						<c:when test="${empty connectedTodoList}">
							<div class="d-flex">
								<div class="text-secondary"><i class="bi bi-plus"></i></div>
								<a href="#" class="preTodoBtn"  data-id="${simpleTodo.id }" data-title="${simpleTodo.title }">
									<span class="ml-2 text-secondary">${simpleTodo.title }</span>
								</a>
							</div>
						</c:when>
						
						<c:otherwise>
							<c:forEach var = "connectedTodo" items="${connectedTodoList }">
								<c:if test="${simpleTodo.id != connectedTodo.connectedTodoId }">
									<div class="d-flex">
										<div class="text-secondary"><i class="bi bi-plus"></i></div>
										<a href="#" class="preTodoBtn"  data-id="${simpleTodo.id }" data-title="${simpleTodo.title }">
											<span class="ml-2 text-secondary">${simpleTodo.title }</span>
										</a>
									</div>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				
				<!-- 일정 추가 -->
				<div class="d-flex justify-content-center mt-4">
					<input type="text" id="addTodo" class="form-control" placeholder="+ 일정추가">
					<button type="button" id="addTodoBtn" class="btn btn-secondary btn-sm ml-2">추가</button>
				</div>
			</div>
			
			
		</div>
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>



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
			
			
			
			// 투두리스트 삭제 기능
			$(".todoCancleBtn").on("click",function(e){
				e.preventDefault();
				
				let todoListId = $(this).data("id");
				
				$.ajax({
					type:"get",
					url:"/plan/todo/delete",
					data:{"todoListId":todoListId},
					success:function(data){
						if(data.result == "success"){
							alert("삭제 성공");
							location.reload();
						}else{
							alert("삭제 실패");
						}
					},
					error:function(){
						alert("투두 삭제 에러");
					}
				});
			});
			
			// 특정 todo 중요표시 (하기 or 취소 하기)
			$(".colorChangeBtn").on("click", function(){
				let todoListId = $(this).data("id");
				let color = $(this).data("color");
				
				$.ajax({
					type:"get",
					url:"/plan/todo/colorChange",
					data:{"todoListId":todoListId, "color":color},
					success:function(data){
						if(data.result == "success"){
							location.reload();
						}else{
							alert("중요표시 실패");
						}
					},
					error:function(){
						alert("to do color change Error");
					}
				});
			});
			
			// 간편 todo 기본 todo로 이동
			$(".preTodoBtn").on("click", function(){
				
				let todoListId = $(this).data("id");
				let date = "${date}";
				let title = $(this).data("title");
				
				$.ajax({
					type:"post",
					url:"/plan/preTodo/pick",
					data:{"todoListId":todoListId, "date":date, "title":title},
					success:function(data){
						if(data.result == "success"){
							location.reload();
						}else{
							alert("to do List로 변경 실패");
						}
					},
					error:function(){
						
					}
				});
				
				
			});
			
			
			
			
		});
		
	
	</script>




</body>

</html>

