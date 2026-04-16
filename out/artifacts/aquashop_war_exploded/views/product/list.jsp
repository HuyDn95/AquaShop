<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/views/layout/header.jsp" />

<div class="container-fluid py-4">
    <div class="row mb-4 align-items-center">
        <div class="col-md-6">
            <h3 class="fw-bold text-dark mb-0">
                <i class="fas fa-fish text-primary me-2"></i>Danh Sách Sản Phẩm
            </h3>
            <p class="text-muted small mb-0">Quản lý kho hàng và thông tin sản phẩm trong hệ thống</p>
        </div>
        <div class="col-md-6 text-md-end mt-3 mt-md-0">
            <a href="product-create" class="btn btn-primary rounded-pill px-4 shadow-sm">
                <i class="fas fa-plus-circle me-2"></i>Thêm Sản Phẩm
            </a>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="ps-4 py-3 text-uppercase fs-xs fw-bold text-muted border-0" style="width: 80px;">ID</th>
                            <th class="py-3 text-uppercase fs-xs fw-bold text-muted border-0">Sản phẩm</th>
                            <th class="py-3 text-uppercase fs-xs fw-bold text-muted border-0">Giá bán (VNĐ)</th>
                            <th class="py-3 text-uppercase fs-xs fw-bold text-muted border-0">Kho hàng</th>
                            <th class="pe-4 py-3 text-uppercase fs-xs fw-bold text-muted border-0 text-end">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listProducts}" var="p">
                            <tr>
                                <td class="ps-4">
                                    <span class="fw-bold text-secondary">#${p.id}</span>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="me-3">
                                            <c:choose>
                                                <c:when test="${not empty p.image}">
                                                    <img src="${p.image}" alt="${p.name}" class="rounded-3 shadow-sm" style="width: 50px; height: 50px; object-fit: cover;">
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="avatar-circle bg-soft-primary text-primary" style="width: 50px; height: 50px;">
                                                        <i class="fas fa-image"></i>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div>
                                            <div class="fw-bold text-dark">${p.name}</div>
                                            <div class="text-muted small">Danh mục: ${p.category.cname}</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <span class="fw-bold text-danger">
                                        <fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0" /> đ
                                    </span>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${p.stock > 10}">
                                            <span class="badge rounded-pill bg-soft-success text-success px-3">
                                                <i class="fas fa-check me-1"></i>Còn hàng (${p.stock})
                                            </span>
                                        </c:when>
                                        <c:when test="${p.stock > 0}">
                                            <span class="badge rounded-pill bg-soft-warning text-warning px-3">
                                                <i class="fas fa-exclamation-triangle me-1"></i>Sắp hết (${p.stock})
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge rounded-pill bg-soft-danger text-danger px-3">
                                                <i class="fas fa-times me-1"></i>Hết hàng
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="pe-4 text-end">
                                    <div class="d-flex justify-content-end gap-2">
                                        <a href="product-edit?id=${p.id}" 
                                           class="btn btn-sm btn-outline-primary rounded-circle shadow-sm" 
                                           title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="product-delete?id=${p.id}" 
                                           class="btn btn-sm btn-outline-danger rounded-circle shadow-sm" 
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');" 
                                           title="Xóa sản phẩm">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty listProducts}">
                            <tr>
                                <td colspan="5" class="text-center py-5">
                                    <div class="py-4">
                                        <i class="fas fa-box-open fa-4x text-light mb-3"></i>
                                        <h5 class="text-muted">Chưa có sản phẩm nào</h5>
                                        <p class="text-muted small">Bắt đầu bằng cách thêm sản phẩm đầu tiên của bạn.</p>
                                        <a href="product-create" class="btn btn-primary btn-sm rounded-pill px-4">
                                            Thêm ngay
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<style>
    .bg-soft-primary { background-color: rgba(13, 110, 253, 0.1); }
    .bg-soft-success { background-color: rgba(25, 135, 84, 0.1); }
    .bg-soft-warning { background-color: rgba(255, 193, 7, 0.1); }
    .bg-soft-danger { background-color: rgba(220, 53, 69, 0.1); }
    
    .avatar-circle {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
    }
    
    .fs-xs { font-size: 0.75rem; }
    
    .table-hover tbody tr:hover {
        background-color: rgba(0, 0, 0, 0.02);
    }
</style>

<jsp:include page="/views/layout/footer.jsp" />
