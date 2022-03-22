<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 기록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

		<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		<div class="d-flex justify-content-center">
			<section class="content">
				<!-- 게시물 업로드 박스 -->
				<div class="border mb-5">
					<input type="text" id="contentInput" class="border-white form-control mt-2" placeholder="오늘을 기록하세요.">
					<div class="d-flex justify-content-between mt-5 mb-2 mx-2">
						<h4 id="imgBtn"><i class="bi bi-image"></i></h4>
						<input type="file" id="fileInput" class="d-none">
						<button type="button" id="saveBtn" class="btn btn-info btn-sm">저장</button>
					</div>
				</div>
		
				<!-- 게시물 리스트 -->
				<c:forEach var="diary" items="${diaryList }">
					<div class="border d-flex mt-3">
						<div class="m-3"><img src="${diary.imagePath }" class="diaryImgBox"></div>
						<div class="m-3">
							<div class="d-flex justify-content-between">
								<h5><fmt:formatDate value="${diary.createdAt }" pattern="yyyy-MM-dd"/></h5>
								<a href="#" class="text-secondary" data-toggle="modal" data-target="#exampleModalCenter${diary.id }">
									<i class="bi bi-three-dots"></i>
								</a>
							</div>
							<hr>
							<div class="diaryContentBox">${diary.content }</div>
						</div>
					</div>
					
					<!-- Modal -->
					<div class="modal fade" id="exampleModalCenter${diary.id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
					    	<div class="modal-content">
					      		<div class="modal-body">
						  			<button type="button" class="modifyBtn btn btn-info form-control" data-id="${diary.id }">수정</button>
						  			<button type="button" class="deleteBtn btn btn-info form-control mt-3" data-id="${diary.id }">삭제</button>
						   		</div>
						  	</div>
			 			</div>
					</div>
					
				</c:forEach>
			</section>
		</div>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	
	<script>
	
		$(document).ready(function(){
			
			// 이미지 버튼 클릭시 파일업로드 버튼 클릭
			$("#imgBtn").on("click", function(){
				$("#fileInput").click();
			});
			
			// 글 저장
			$("#saveBtn").on("click", function(){
				let content = $("#contentInput").val();
				
				if(content == ""){
					alert("내용을 입력하세요.");
					return;
				}
				
				let formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post",
					url:"/diary/create",
					data:formData,
					
					enctype:"multipart/form-data",
					processData:false,
					contentType:false,
					
					success:function(data){
						if(data.result == "success"){
							alert("입력 성공");
							location.reload();
						}
						else{
							alert("입력 실패");
						}
					},
					error:function(){
						alert("글쓰기 에러 발생");
					}
				});
				
			});
			
			// 글 삭제
			$(".deleteBtn").on("click", function(){
				let diaryId = $(this).data("id");
				
				$.ajax({
					type:"get",
					url:"/diary/delete",
					data:{"diaryId":diaryId},
					success:function(data){
						if(data.result == "success"){
							alert("삭제 성공");
							location.reload();
						}else{
							alert("삭제 실패");
						}
					},
					error:function(){
						alert("글 삭제 에러 발생");
					}
				});
			});
			
			
			
		});
	
	
	
	</script>

</body>
</html>