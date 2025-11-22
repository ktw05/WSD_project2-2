<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- Header 포함 --%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="새 글 작성"/>
</jsp:include>

<h2 class="text-success border-bottom pb-2 mb-4">새 글 작성</h2>

<form action="write_ok.jsp" method="POST">
    <div class="mb-3">
        <label for="title" class="form-label fw-bold">제목 (1)</label>
        <input type="text" id="title" name="title" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="author" class="form-label fw-bold">작성자 (2)</label>
        <input type="text" id="author" name="author" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="password" class="form-label fw-bold">비밀번호 (3)</label>
        <input type="password" id="password" name="password" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="category" class="form-label fw-bold">카테고리 (4)</label>
        <select id="category" name="category" class="form-select" required>
            <option value="">선택하세요</option>
            <option value="자유">자유</option>
            <option value="질문">질문</option>
            <option value="정보">정보</option>
            <option value="공지">공지</option>
        </select>
    </div>

    <div class="mb-4">
        <label for="content" class="form-label fw-bold">내용 (5)</label>
        <textarea id="content" name="content" rows="10" class="form-control" required></textarea>
    </div>

    <div class="text-center">
        <button type="submit" class="btn btn-success me-2">등록하기</button>
        <a href="list.jsp" class="btn btn-secondary">취소</a>
    </div>
</form>

<%-- Footer 포함 --%>
<jsp:include page="footer.jsp"/>