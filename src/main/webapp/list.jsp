<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.wsd_hw3.BoardDAO" %>
<%@ page import="org.example.wsd_hw3.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 0. 검색 키워드 파라미터 받기 --%>
<%
    // URL에서 searchKeyword 파라미터를 받습니다. (GET 방식)
    String searchKeyword = request.getParameter("searchKeyword");

    // 1. DAO를 사용하여 DB에서 데이터 목록 (또는 검색 결과) 가져오기
    BoardDAO dao = BoardDAO.getInstance();
    // 🚨 getPosts 메서드에 키워드를 전달합니다. 🚨
    List<BoardVO> posts = dao.getPosts(searchKeyword);

    // JSTL 사용을 위해 request 속성에 저장
    request.setAttribute("postList", posts);
    // 검색 키워드를 JSP에 전달하여 폼에 유지
    request.setAttribute("keyword", searchKeyword);
%>

<%-- Header 포함 --%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="자유 게시판 목록"/>
</jsp:include>

<h2 class="text-success border-bottom pb-2 mb-4">자유 게시판</h2>

<%-- 2. 검색 기능 영역: 입력값 유지, 디자인 개선 및 초기화 버튼 --%>
<form action="list.jsp" method="get" class="d-flex mb-4 align-items-center">
    <input class="form-control me-2 flex-grow-1" type="search" name="searchKeyword" placeholder="제목, 작성자 검색" aria-label="Search"
           value="${keyword != null ? keyword : ''}" style="max-width: 300px;">
    <button class="btn btn-outline-success" type="submit">검색</button>

    <%-- 검색 중일 경우에만 초기화 버튼 표시 --%>
    <c:if test="${not empty keyword}">
        <a href="list.jsp" class="btn btn-outline-secondary ms-2">초기화</a>
    </c:if>
</form>

<%-- 3. 목록 출력 (테이블 반응성 wrapper 유지) --%>
<div class="table-responsive">
    <table class="table table-hover table-striped">
        <thead>
        <tr class="table-success text-center">
            <th style="width: 8%;">번호</th>
            <th style="width: 45%;" class="text-start">제목</th>
            <th style="width: 12%;">작성자</th>
            <th style="width: 10%;">카테고리</th>
            <th style="width: 15%;">작성일</th>
            <th style="width: 10%;">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="post" items="${postList}">
            <tr class="text-center">
                <td>${post.id}</td>
                <td class="text-start">
                    <a href="view.jsp?id=${post.id}" class="text-decoration-none text-dark fw-bold">${post.title}</a>
                </td>
                <td>${post.author}</td>
                <td><span class="badge bg-secondary">${post.category}</span></td>
                    <%-- 날짜 포맷팅 --%>
                <td><fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd HH:mm"/></td>
                <td>${post.views}</td>
            </tr>
        </c:forEach>

        <%-- 목록이 비어있을 경우 --%>
        <c:if test="${empty postList}">
            <tr>
                <td colspan="6" class="text-center p-5 text-muted">검색 결과가 없거나 등록된 게시글이 없습니다.</td>
            </tr>
        </c:if>

        </tbody>
    </table>
</div>

<%-- 새 글 작성 버튼 블록 --%>
<div class="text-end mt-4">
    <a href="write.jsp" class="btn btn-primary">새 글 작성</a>
</div>

<%-- Footer 포함 --%>
<jsp:include page="footer.jsp"/>