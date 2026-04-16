<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AquaShop - <c:out value="${title}" default="Hệ Thống Quản Lý" /></title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>
<body>
    <c:if test="${not empty sessionScope.user}">
        <div class="main-wrapper">
            <!-- Sidebar -->
            <jsp:include page="/views/layout/navbar/sidebar.jsp" />
            
            <!-- Main Content -->
            <div class="content-wrapper">
                <nav class="navbar navbar-expand-lg navbar-light bg-white mb-4 shadow-sm d-lg-none sticky-top">
                    <div class="container-fluid">
                        <button class="btn btn-dark" type="button" onclick="document.querySelector('.sidebar').classList.toggle('active')">
                            <i class="fas fa-bars"></i>
                        </button>
                        <span class="navbar-brand ms-2 fw-bold" style="background: linear-gradient(to right, #6366f1, #a855f7); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">AquaShop</span>
                    </div>
                </nav>
    </c:if>
    <div class="main ${empty sessionScope.user ? '' : 'px-0'}">
<%-- Content will be here --%>
