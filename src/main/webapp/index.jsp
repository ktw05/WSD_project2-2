<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 리다이렉트를 유지하며 Header/Footer 테스트 용도로 사용 --%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="환영합니다!"/>
</jsp:include>

<div class="alert alert-info text-center mt-5 p-4">
    <h4 class="alert-heading">환영합니다!</h4>
    <p>게시판 프로젝트를 시작합니다. 잠시 후 목록 페이지로 이동합니다.</p>
</div>

<script>
    setTimeout(function() {
        window.location.href = 'list.jsp';
    }, 1500); // 1.5초 후 이동
</script>

<%-- Footer 포함 --%>
<jsp:include page="footer.jsp"/>