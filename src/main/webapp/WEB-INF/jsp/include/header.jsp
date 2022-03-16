<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<header>
		<c:choose>
			<c:when test="${empty userId}"></c:when>
			
			<c:when test="${not empty userId }">
				<div class="d-flex justify-content-center mt-5">
					<div class="w-50 d-flex justify-content-between">
						<h2>To do List</h2>
						<a href="/user/sign_out">로그아웃</a>
					</div>
				</div>
				<hr>
			</c:when>
		</c:choose>
	</header>