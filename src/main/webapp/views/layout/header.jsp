<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AquaShop - <c:out value="${title}" default="Hệ Thống Quản Lý"/></title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="main-wrapper">
    <!-- Sidebar -->

    <%@ include file="/views/layout/navbar/sidebar.jsp" %>
    <!-- Main Content -->
    <div class="content-wrapper">
        <nav class="navbar navbar-expand-lg navbar-light bg-white mb-4 shadow-sm d-lg-none sticky-top">
            <div class="container-fluid">
                <button class="btn btn-dark" type="button"
                        onclick="document.querySelector('.sidebar').classList.toggle('active')">
                    <i class="fas fa-bars"></i>
                </button>
                <span class="navbar-brand ms-2 fw-bold"
                      style="background: linear-gradient(to right, #6366f1, #a855f7); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">AquaShop</span>
            </div>
        </nav>

        <div class="main ${empty sessionScope.user ? '' : 'px-0'}">
            <c:if test="${not empty sessionScope.message}">
                <!-- Global Toast Container -->
                <div class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 1060">
                    <div id="liveToast" class="toast border-0 shadow-lg rounded-4" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="toast-header bg-${sessionScope.messageType} text-white border-0 rounded-top-4 py-3">
                            <i class="fas ${sessionScope.messageType == 'success' ? 'fa-check-circle' : 'fa-exclamation-circle'} me-2"></i>
                            <strong class="me-auto">${sessionScope.messageType == 'success' ? 'Thành công!' : 'Thông báo'}</strong>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast" aria-label="Close"></button>
                        </div>
                        <div class="toast-body p-3">
                            <div class="d-flex align-items-center">
                                <div class="text-dark small">${sessionScope.message}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        var toastEl = document.getElementById('liveToast');
                        if (toastEl) {
                            var toast = new bootstrap.Toast(toastEl, {
                                delay: 5000
                            });
                            toast.show();
                        }
                    });
                </script>
            
                <c:remove var="message" scope="session"/>
                <c:remove var="messageType" scope="session"/>
            </c:if>

