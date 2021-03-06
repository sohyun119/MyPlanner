<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
		<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="d-flex justify-content-center">
			<div id="signInBox" class="border d-flex justify-content-center">
				<div id="signInnerBox" class="mt-4">
					<form id="loginForm">
						<h1 class="font-italic text-center">My Planner</h1>
						<div class="mt-3 text-secondary text-center">계획과 기록을 보려면 로그인 하세요!</div>
						<input type="text" id="loginIdInput" class="form-control mt-3" placeholder="아이디">
						<input type="password" id="passwordInput" class="form-control mt-3" placeholder="비밀번호">
						<button type="submit" class="btn btn-info form-control mt-3">로그인</button>
					</form>
					<hr>
					<div class="text-center">계정이 없으신가요? <a href="/user/signup_view">회원가입</a></div>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
	
		$(document).ready(function(){
			
			
			$("#loginForm").on("submit", function(e){
				e.preventDefault();
				
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				
				if(loginId == ""){
					alert("아이디를 입력해주세요.");
					return;
				}
				if(password == ""){
					alert("비밀번호를 입력해주세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId,"password":password},
					success:function(data){
						if(data.result == "success"){
							location.href="/plan/todoList_view";
						}else{
							alert("아이디 또는 비밀번호를 확인해주세요.");
						}
					},
					error:function(){
						alert("로그인 에러 발생");
					}
				});
			});	
			
			
		});
	
	
	
	
	
	</script>
	
	

</body>
</html>