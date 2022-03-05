<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
		<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center">
		
			<div id="signUpBox" class="border d-flex justify-content-center">
				<div id="signInnerBox" class="mt-3">
					<div class="display-4 font-italic text-center">My Planner</div>
					<div class="mt-4 text-secondary">투두 리스트와 캘린더, 다이어리를 한 번에 관리하세요!</div>
					<input type="text" id="emailInput" class="form-control mt-2" placeholder="이메일 주소">
					<input type="text" id="nameInput" class="form-control mt-3" placeholder="이름">
					<div class="mt-3 d-flex">
						<input type="text" id="loginIdInput" class="form-control" placeholder="아이디">
						<button type="button" id="duplicateBtn" class="btn btn-info btn-sm ml-1">중복확인</button>
					</div>
					<input type="password" id="passwordInput" class="form-control mt-3" placeholder="비밀번호">
					<input type="password" id="passwordCheckInput" class="form-control mt-3" placeholder="비밀번호 확인">
					
					<button type="button" id="signUpBtn" class="btn btn-info form-control my-3">회원가입</button>
					
					<hr>
					<div class="text-center">아이디가 있으신가요? <a href="/user/signin_view">로그인</a></div>
				</div>
			
			</div>
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
	
		$(document).ready(function(){
			var is_duplicate = true;
			
			$("#duplicateBtn").on("click",function(){
				let loginId = $("#loginIdInput").val();
				if(loginId == ""){
					alert("아이디를 입력해 주세요.");
					return;
				}
				
				$.ajax({
					type:"get",
					url:"/user/is_duplicate_id",
					data:{"loginId":loginId},
					success:function(data){
						if(data.duplicate == "true"){
							alert("아이디가 중복되었습니다.");
							is_duplicate = true;
						}else{
							alert("사용가능한 아이디 입니다.");
							is_duplicate = false;
						}
					},
					error:function(){
						alert("에러 발생");
					}
				});
			});
			
			$("#loginIdInput").on("input",function(){ // *** 아이디를 다시 수정하는 순간 다시 중복검사를 하게 만든다!!!!!!!
				is_duplicate = true;
			});
			
			$("#signUpBtn").on("click", function(){
				let email = $("#emailInput").val();
				let name = $("#nameInput").val();
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				let passwordCheck = $("#passwordCheckInput").val();
				
				if(email == ""){
					alert("이메일을 입력해 주세요.");
					return;
				}
				if(name == ""){
					alert("이름을 입력해 주세요.");
					return;
				}
				if(loginId == ""){
					alert("아이디를 입력해 주세요.");
					return;
				}
				if(is_duplicate == true){
					alert("아이디 중복확인을 해주세요.");
					return;
				}
				if(password == ""){
					alert("비밀번호를 입력해 주세요.");
					return;
				}
				if(password != passwordCheck){
					alert("비밀번호가 같지 않습니다.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"email":email,"name":name,"loginId":loginId,"password":password},
					success:function(data){
						if(data.result == "success"){
							alert("회원가입 완료!");
							location.href = "/user/signin_view";
						}else{
							alert("회원가입 오류");
						}
					},
					error:function(){
						alert("에러 발생");
					}
				});
				
			});
			
		});
	
	
	
	
	</script>

</body>
</html>