<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.wsd_hw3.BoardDAO" %>
<%@ page import="org.example.wsd_hw3.BoardVO" %>

<%-- 1. POST 요청 파라미터 받기 --%>
<%
    request.setCharacterEncoding("UTF-8"); // POST 요청 한글 깨짐 방지

    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String passwordStr = request.getParameter("password"); // String으로 먼저 받음
    String category = request.getParameter("category");
    String content = request.getParameter("content");

    // 2. BoardVO 객체에 데이터 설정
    BoardVO post = new BoardVO();
    post.setTitle(title);
    post.setAuthor(author);

    try {
        int passwordInt = Integer.parseInt(passwordStr);
        post.setPassword(passwordInt);
    } catch (NumberFormatException e) {
        // 숫자가 아닌 값이 들어왔을 경우 예외 처리
        System.err.println("비밀번호는 반드시 숫자여야 합니다. " + e.getMessage());
        // 사용자에게 오류 메시지를 보여줄 수도 있습니다. (현재는 DB 오류로 간주하고 실패 처리)
        // result = 0; 으로 유지되도록 아래 코드는 실행하지 않습니다.
    }

    post.setCategory(category);
    post.setContent(content);

    // 3. DAO를 사용하여 DB에 데이터 삽입
    BoardDAO dao = BoardDAO.getInstance();
    int result = dao.insertPost(post);
%>

<%-- Header 포함 --%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="새 글 작성 결과"/>
</jsp:include>

<% if (result > 0) { %>
<h2 class="text-success border-bottom pb-2 mb-4 text-center">게시글 등록 성공</h2>

<div class="alert alert-success text-center" role="alert">
    <h4 class="alert-heading">성공!</h4>
    <p>새 게시글이 성공적으로 등록되었습니다.</p>
</div>

<div class="p-3 border rounded bg-light my-4">
    <h4 class="text-primary mt-0">등록된 데이터:</h4>
    <p><strong>제목:</strong> <%= title %></p>
    <p><strong>작성자:</strong> <%= author %></p>
    <p><strong>카테고리:</strong> <%= category %></p>
</div>

<div class="text-center mt-4">
    <a href="list.jsp" class="btn btn-primary">목록으로 돌아가기</a>
</div>
<% } else { %>
<h2 class="text-danger border-bottom pb-2 mb-4 text-center">게시글 등록 실패</h2>

<div class="alert alert-danger text-center" role="alert">
    <h4 class="alert-heading">실패!</h4>
    <p>데이터베이스 오류로 인해 글 등록에 실패했습니다. (비밀번호가 숫자인지 확인하세요.)</p>
</div>

<div class="text-center mt-4">
    <a href="javascript:history.back()" class="btn btn-secondary">다시 작성하기</a>
    <a href="list.jsp" class="btn btn-primary">목록으로 돌아가기</a>
</div>
<% } %>

<%-- Footer 포함 --%>
<jsp:include page="footer.jsp"/>