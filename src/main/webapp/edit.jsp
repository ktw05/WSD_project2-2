<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- Header 포함 --%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="글 수정"/>
</jsp:include>

<h2 class="text-warning border-bottom pb-2 mb-4">게시글 수정</h2>

<form action="edit_ok.jsp" method="POST">
    <input type="hidden" name="id" value="1"> <!-- 실제 DB 데이터로 대체 필요 -->

    <div class="mb-3">
        <label for="title" class="form-label fw-bold">제목 (1)</label>
        <input type="text" id="title" name="title" value="JSP Bootstrap 스타일 적용 테스트 (수정 중)" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="author" class="form-label fw-bold">작성자 (2)</label>
        <input type="text" id="author" name="author" value="김태우" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="password" class="form-label fw-bold">새 비밀번호 (3)</label>
        <input type="password" id="password" name="password" placeholder="변경하려면 입력하세요" class="form-control">
    </div>

    <div class="mb-3">
        <label for="category" class="form-label fw-bold">카테고리 (4)</label>
        <select id="category" name="category" class="form-select" required>
            <option value="자유">자유</option>
            <option value="질문">질문</option>
            <option value="정보">정보</option>
            <option value="공지" selected>공지</option>
        </select>
    </div>

    <div class="mb-4">
        <label for="content" class="form-label fw-bold">내용 (5)</label>
        <textarea id="content" name="content" rows="10" class="form-control" required>
                수정할 내용 작성</textarea>
    </div>

    <div class="text-center">
        <button type="submit" class="btn btn-warning me-2">수정 완료</button>
        <a href="view.jsp?id=1" class="btn btn-secondary">취소</a>
    </div>
</form>

<%-- Footer 포함 --%>
<jsp:include page="footer.jsp"/>