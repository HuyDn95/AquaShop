<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar d-flex flex-column flex-shrink-0 p-3 shadow-lg">
    <a href="${pageContext.request.contextPath}/dashboard" class="d-flex align-items-center mb-4 me-md-auto text-decoration-none px-2">
        <div class="bg-gradient-indigo rounded-3 d-flex align-items-center justify-content-center me-2 shadow-sm" style="width: 45px; height: 45px; background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%);">
            <i class="fas fa-fish text-white fs-4"></i>
        </div>
        <span class="sidebar-logo-text">AquaShop</span>
    </a>
    
    <div class="px-2 mb-3">
        <small class="text-uppercase text-muted fw-bold opacity-50" style="font-size: 0.7rem; letter-spacing: 1px;">Menu Chính</small>
    </div>

    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-link ${title == 'Dashboard' ? 'active' : ''}">
                <i class="fas fa-grid-2 me-3" style="width: 20px;"></i>
                <span>Tổng quan</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/product" class="nav-link ${title == 'Sản phẩm' ? 'active' : ''}">
                <i class="fas fa-box-open me-3" style="width: 20px;"></i>
                <span>Sản phẩm</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/customer" class="nav-link ${title == 'Khách hàng' ? 'active' : ''}">
                <i class="fas fa-user-friends me-3" style="width: 20px;"></i>
                <span>Khách hàng</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/order" class="nav-link ${title == 'Đơn hàng' ? 'active' : ''}">
                <i class="fas fa-shopping-bag me-3" style="width: 20px;"></i>
                <span>Đơn hàng</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/category" class="nav-link ${title == 'Danh mục' ? 'active' : ''}">
                <i class="fas fa-layer-group me-3" style="width: 20px;"></i>
                <span>Danh mục</span>
            </a>
        </li>
    </ul>

    <div class="mt-auto px-1">
        <div class="dropdown sidebar-user-card shadow-sm">
            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                <div class="position-relative me-3">
                    <img src="https://ui-avatars.com/api/?name=${sessionScope.user.username}&background=6366f1&color=fff&bold=true" alt="user" width="38" height="38" class="rounded-circle">
                    <span class="position-absolute bottom-0 end-0 p-1 bg-success border border-2 border-dark rounded-circle" style="background-color: #10b981 !important;"></span>
                </div>
                <div class="flex-grow-1 overflow-hidden">
                    <p class="mb-0 fw-bold text-white text-truncate" style="font-size: 0.9rem;">${sessionScope.user.username}</p>
                    <p class="mb-0  text-truncate" style="font-size: 0.75rem;">${sessionScope.user.role}</p>
                </div>
            </a>
            <ul class="dropdown-menu dropdown-menu-dark text-small shadow-lg border-0 mb-2" aria-labelledby="dropdownUser1" style="background-color: #2d3748;">
                <li><a class="dropdown-item py-2" href="#"><i class="fas fa-user-circle me-2 opacity-75"></i>Hồ sơ cá nhân</a></li>
                <li><a class="dropdown-item py-2" href="#"><i class="fas fa-cog me-2 opacity-75"></i>Cài đặt</a></li>
                <li><hr class="dropdown-divider opacity-10"></li>
                <li><a class="dropdown-item text-danger py-2 fw-bold" href="${pageContext.request.contextPath}/logout"><i class="fas fa-power-off me-2"></i>Đăng xuất</a></li>
            </ul>
        </div>
    </div>
</div>
