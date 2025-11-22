<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Mock Data 정의 (DB 연동 전)
    String postId = request.getParameter("id");
    // ... 나머지 Mock Data
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 #<%= postId %> 보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- 💡 CSP 경고 해결을 위해 스크립트 분리 -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 삭제 버튼 요소 가져오기
            const deleteButton = document.getElementById('deleteButton');
            if (deleteButton) {
                deleteButton.addEventListener('click', function(e) {
                    // confirm()을 사용하여 사용자에게 확인 메시지 표시
                    if (!confirm('정말로 이 글을 삭제하시겠습니까?')) {
                        // 사용자가 취소(Cancel)를 누르면 기본 동작(링크 이동) 방지
                        e.preventDefault();
                    }
                });
            }
        });
    </script>
</head>
<body class="bg-light">

<div class="container my-5 p-4 bg-white shadow-sm rounded">
    <!-- ... 나머지 본문 내용 ... -->
    <div class="text-center mt-4">
        <a href="list.jsp" class="btn btn-secondary me-2">목록으로</a>
        <a href="edit.jsp?id=<%= postId %>" class="btn btn-warning me-2">수정</a>
        <!-- 인라인 onclick을 제거하고 ID를 부여 -->
        <a href="delete_ok.jsp?id=<%= postId %>" class="btn btn-danger" id="deleteButton">삭제</a>
    </div>
</div>
</body>
</html>