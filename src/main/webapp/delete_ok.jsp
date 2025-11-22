<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.wsd_hw3.BoardDAO" %>

<%-- 1. 삭제할 게시글 ID 파라미터 받기 --%>
<%
    String deleteIdParam = request.getParameter("id");
    int deleteId = 0;
    int deleteResult = 0;

    if (deleteIdParam != null && !deleteIdParam.isEmpty()) {
        try {
            // 2. ID를 정수로 변환
            deleteId = Integer.parseInt(deleteIdParam);

            // 3. DAO를 사용하여 DB에서 삭제 실행
            BoardDAO dao = BoardDAO.getInstance();
            deleteResult = dao.deletePost(deleteId);

        } catch (NumberFormatException e) {
            // ID가 숫자가 아닐 경우
            System.err.println("삭제 요청 ID가 유효하지 않습니다: " + deleteIdParam);
        }
    }
%>

<%-- Header 포함 --%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="글 삭제 결과"/>
</jsp:include>

<div class="container-fluid my-5 p-4 bg-white shadow-lg rounded">

    <% if (deleteResult > 0) { %>
    <!-- 삭제 성공 -->
    <h2 class="text-danger border-bottom pb-2 mb-4 text-center">게시글 삭제 성공</h2>
    <div class="alert alert-danger text-center" role="alert">
        <h4 class="alert-heading">성공!</h4>
        <p><strong><%= deleteId %>번 게시글</strong>이 성공적으로 삭제되었습니다.</p>
    </div>
    <% } else { %>
    <!-- 삭제 실패 -->
    <h2 class="text-warning border-bottom pb-2 mb-4 text-center">게시글 삭제 실패</h2>
    <div class="alert alert-warning text-center" role="alert">
        <h4 class="alert-heading">실패!</h4>
        <p><strong><%= deleteId %>번 게시글</strong> 삭제에 실패했습니다. (존재하지 않거나 DB 오류)</p>
    </div>
    <% } %>

    <div class="text-center mt-4">
        <a href="list.jsp" class="btn btn-primary">목록으로 돌아가기</a>
    </div>

</div>

<%-- Footer 포함 --%>
<jsp:include page="footer.jsp"/>