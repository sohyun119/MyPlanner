<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<header>
		<c:choose>
			<c:when test="${empty userId}"></c:when>
			
			<c:when test="${not empty userId }">
				<div class="d-flex justify-content-center">
					<div class="w-50 border">
						<h3>To do List</h3>
						<a href="/user/sign_out">로그아웃</a>
					</div>
				</div>
			</c:when>
		</c:choose>
	</header>