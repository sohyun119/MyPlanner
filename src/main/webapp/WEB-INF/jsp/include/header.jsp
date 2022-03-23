<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<header>
		<c:choose>
			<c:when test="${empty userId}"></c:when>
			
			<c:when test="${not empty userId }">
				<div class="d-flex justify-content-center mt-5">
					<div class="col-7 d-flex justify-content-between">
						<h2>My Planner</h2>
							<ul class="nav nav-fill">
								<li class="nav-item">
									<a href="/plan/todoList_view" class="nav-link text-dark"><i class="bi bi-check2-square"></i></a>
								</li>
								<li class="nav-item">
									<a href="/diary/timeline_view" class="nav-link text-dark">Diary</a>
								</li>
								<li class="nav-item">
									<a href="/plan/todo/simple_create_view" class="nav-link text-dark">todo간편입력</a>
								</li>
								<li class="nav-item">
									<a href="/user/sign_out" class="nav-link text-dark">로그아웃</a>
								</li>
							</ul>
					</div>
				</div>
				<hr>
			</c:when>
		</c:choose>
	</header>