<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Handong Post Time</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">

<header class="p-3 mb-4 border-bottom shadow-sm bg-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="index.jsp" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                <span class="fs-4 fw-bold text-success">한동포스트타임</span>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 ms-4">
                <li><a href="list.jsp" class="nav-link px-2 link-secondary">게시판 목록</a></li>
                <li><a href="write.jsp" class="nav-link px-2 link-dark">글 작성</a></li>
            </ul>

            <div class="text-end">
                <span class="text-muted me-3">환영합니다!</span>
                <button type="button" class="btn btn-outline-success me-2">로그인</button>
            </div>
        </div>
    </div>
</header>

<div class="container-fluid my-5 py-4 px-5 bg-white shadow-lg rounded">