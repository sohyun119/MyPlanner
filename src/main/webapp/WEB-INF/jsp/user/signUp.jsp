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

	<div id="wrap" class="signImg">
		
		<header>
		
		</header>
		
		<section class="d-flex justify-content-center">
		
			<div id="signBox" class="border d-flex justify-content-center">
				<div id="signInnerBox" class="mt-4">
					<div class="display-4 font-italic text-center text-white">My Planner</div>
					<input type="text" id="emailInput" class="form-control mt-4" placeholder="이메일 주소">
					<input type="text" id="nameInput" class="form-control mt-3" placeholder="이름">
					<div class="mt-3 d-flex">
						<input type="text" id="loginIdInput" class="form-control" placeholder="아이디">
						<button type="button" id="duplicateBtn" class="btn btn-info btn-sm ml-1">중복확인</button>
					</div>
					<input type="password" id="passwordInput" class="form-control mt-3" placeholder="비밀번호">
					<input type="password" id="passwordCheckInput" class="form-control mt-3" placeholder="비밀번호 확인">
					
					<button type="button" id="signUpBtn" class="btn btn-info form-control mt-3">회원가입</button>
				</div>
			
			</div>
		</section>
	
	
	</div>

</body>
</html>