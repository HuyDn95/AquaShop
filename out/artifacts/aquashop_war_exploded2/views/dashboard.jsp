<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="title" value="Dashboard" scope="request"/>
<jsp:include page="/views/layout/header.jsp"/>

<div class="row">
    <div class="col-12">
        <h2 class="mb-4">Chào mừng, <span class="text-primary">${sessionScope.user.username}</span>!</h2>
    </div>
</div>

<div class="row g-4">
    <!-- Thống kê nhanh -->
    <div class="col-md-3">
        <div class="card stat-card bg-gradient-primary text-white h-100 border-0 shadow">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-uppercase mb-2 opacity-75 small fw-bold">Sản phẩm</h6>
                        <h2 class="mb-0 fw-bold">120</h2>
                    </div>
                    <div class="icon-circle">
                        <i class="fas fa-box fa-lg"></i>
                    </div>
                </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between small border-0 bg-transparent">
                <a class="text-white stretched-link text-decoration-none" href="${pageContext.request.contextPath}/product">Xem chi tiết</a>
                <i class="fas fa-angle-right"></i>
            </div>
        </div>
    </div>
    
    <div class="col-md-3">
        <div class="card stat-card bg-gradient-success text-white h-100 border-0 shadow">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-uppercase mb-2 opacity-75 small fw-bold">Khách hàng</h6>
                        <h2 class="mb-0 fw-bold">45</h2>
                    </div>
                    <div class="icon-circle">
                        <i class="fas fa-users fa-lg"></i>
                    </div>
                </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between small border-0 bg-transparent">
                <a class="text-white stretched-link text-decoration-none" href="${pageContext.request.contextPath}/customer">Xem chi tiết</a>
                <i class="fas fa-angle-right"></i>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card stat-card bg-gradient-warning text-white h-100 border-0 shadow">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-uppercase mb-2 opacity-75 small fw-bold">Đơn hàng mới</h6>
                        <h2 class="mb-0 fw-bold">8</h2>
                    </div>
                    <div class="icon-circle">
                        <i class="fas fa-shopping-cart fa-lg"></i>
                    </div>
                </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between small border-0 bg-transparent">
                <a class="text-white stretched-link text-decoration-none" href="${pageContext.request.contextPath}/order">Xem chi tiết</a>
                <i class="fas fa-angle-right"></i>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card stat-card bg-gradient-danger text-white h-100 border-0 shadow">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-uppercase mb-2 opacity-75 small fw-bold">Doanh thu</h6>
                        <h2 class="mb-0 fw-bold">5.2M</h2>
                    </div>
                    <div class="icon-circle">
                        <i class="fas fa-dollar-sign fa-lg"></i>
                    </div>
                </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between small border-0 bg-transparent">
                <span class="text-white-50">Trong tháng này</span>
                <i class="fas fa-chart-line text-white-50"></i>
            </div>
        </div>
    </div>
</div>

<div class="row mt-5">
    <div class="col-lg-8">
        <div class="card shadow border-0 mb-4 rounded-3">
            <div class="card-header bg-white py-3 d-flex align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-history me-2"></i>Đơn hàng gần đây</h6>
                <a href="${pageContext.request.contextPath}/order" class="btn btn-sm btn-light text-primary fw-bold">Xem tất cả</a>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover table-modern">
                        <thead>
                            <tr>
                                <th>Mã ĐH</th>
                                <th>Khách hàng</th>
                                <th>Ngày</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="fw-bold text-primary">#ORD-001</td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-sm me-2 bg-light rounded-circle d-flex align-items-center justify-content-center" style="width: 30px; height: 30px;">
                                            <i class="fas fa-user text-secondary small"></i>
                                        </div>
                                        Nguyễn Văn A
                                    </div>
                                </td>
                                <td>2026-04-14</td>
                                <td class="fw-bold">1,200,000đ</td>
                                <td><span class="badge badge-pill bg-success text-white">Hoàn thành</span></td>
                            </tr>
                            <tr>
                                <td class="fw-bold text-primary">#ORD-002</td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-sm me-2 bg-light rounded-circle d-flex align-items-center justify-content-center" style="width: 30px; height: 30px;">
                                            <i class="fas fa-user text-secondary small"></i>
                                        </div>
                                        Trần Thị B
                                    </div>
                                </td>
                                <td>2026-04-13</td>
                                <td class="fw-bold">450,000đ</td>
                                <td><span class="badge badge-pill bg-warning text-dark">Đang xử lý</span></td>
                            </tr>
                            <tr>
                                <td class="fw-bold text-primary">#ORD-003</td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-sm me-2 bg-light rounded-circle d-flex align-items-center justify-content-center" style="width: 30px; height: 30px;">
                                            <i class="fas fa-user text-secondary small"></i>
                                        </div>
                                        Lê Văn C
                                    </div>
                                </td>
                                <td>2026-04-12</td>
                                <td class="fw-bold">890,000đ</td>
                                <td><span class="badge badge-pill bg-info text-white">Đang giao</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="card shadow border-0 mb-4 rounded-3">
            <div class="card-header bg-white py-3">
                <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-bolt me-2 text-warning"></i>Thao tác nhanh</h6>
            </div>
            <div class="card-body">
                <div class="d-grid gap-3">
                    <a href="${pageContext.request.contextPath}/product?action=create" class="btn btn-outline-primary text-start p-3 border-2">
                        <i class="fas fa-plus-circle me-2"></i>Thêm sản phẩm mới
                    </a>
                    <a href="${pageContext.request.contextPath}/customer?action=create" class="btn btn-outline-success text-start p-3 border-2">
                        <i class="fas fa-user-plus me-2"></i>Thêm khách hàng mới
                    </a>
                    <a href="${pageContext.request.contextPath}/order?action=create" class="btn btn-outline-warning text-start p-3 border-2">
                        <i class="fas fa-cart-plus me-2"></i>Tạo đơn hàng mới
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/layout/footer.jsp"/>
