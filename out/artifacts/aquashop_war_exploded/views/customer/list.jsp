<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp" />
<div class="container-fluid py-4">
    <div class="row mb-4 align-items-center">
        <div class="col-md-6">
            <h3 class="fw-bold text-dark mb-0">
                <i class="fas fa-users text-primary me-2"></i>Danh Sách Khách Hàng
            </h3>
            <p class="text-muted small mb-0">Quản lý và theo dõi thông tin khách hàng trong hệ thống</p>
        </div>
        <div class="col-md-6 text-md-end mt-3 mt-md-0">
            <a href="customer?action=add" class="btn btn-primary rounded-pill px-4 shadow-sm">
                <i class="fas fa-plus-circle me-2"></i>Thêm Khách Hàng
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
                            <th class="py-3 text-uppercase fs-xs fw-bold text-muted border-0">Khách hàng</th>
                            <th class="py-3 text-uppercase fs-xs fw-bold text-muted border-0">Liên hệ</th>
                            <th class="py-3 text-uppercase fs-xs fw-bold text-muted border-0">Vai trò</th>
                            <th class="pe-4 py-3 text-uppercase fs-xs fw-bold text-muted border-0 text-end">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listCust}" var="c">
                            <tr>
                                <td class="ps-4">
                                    <span class="fw-bold text-secondary">#${c.id}</span>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-circle bg-soft-primary text-primary me-3">
                                            ${c.fullName.substring(0, 1).toUpperCase()}
                                        </div>
                                        <div>
                                            <div class="fw-bold text-dark">${c.fullName}</div>
                                            <div class="text-muted small">@${c.username}</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex flex-column">
                                        <span class="small"><i class="far fa-envelope me-1 text-muted"></i>${c.email}</span>
                                        <c:if test="${not empty c.phone}">
                                            <span class="small mt-1"><i class="fas fa-phone-alt me-1 text-muted"></i>${c.phone}</span>
                                        </c:if>
                                    </div>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${c.role == 'admin'}">
                                            <span class="badge rounded-pill bg-soft-danger text-danger px-3">
                                                <i class="fas fa-user-shield me-1"></i>Quản trị
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge rounded-pill bg-soft-info text-info px-3">
                                                <i class="fas fa-user me-1"></i>Khách hàng
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="pe-4 text-end">
                                    <div class="d-flex justify-content-end gap-2">
                                        <a href="customer?action=edit&id=${c.id}" 
                                           class="btn btn-sm btn-outline-primary rounded-circle shadow-sm" 
                                           title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="customer?action=delete&id=${c.id}" 
                                           class="btn btn-sm btn-outline-danger rounded-circle shadow-sm" 
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa khách hàng này?');" 
                                           title="Xóa tài khoản">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty listCust}">
                            <tr>
                                <td colspan="5" class="text-center py-5">
                                    <div class="py-4">
                                        <i class="fas fa-users-slash fa-4x text-light mb-3"></i>
                                        <h5 class="text-muted">Chưa có khách hàng nào</h5>
                                        <p class="text-muted small">Bắt đầu bằng cách thêm khách hàng đầu tiên của bạn.</p>
                                        <a href="customer?action=add" class="btn btn-primary btn-sm rounded-pill px-4">
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


<jsp:include page="/views/layout/footer.jsp" />
