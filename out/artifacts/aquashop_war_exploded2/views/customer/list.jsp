<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp" />
<div class="container-fluid py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold text-primary"><i class="fas fa-users me-2"></i>Quản lý khách hàng</h2>
        <a href="customer?action=add" class="btn btn-success shadow-sm">
            <i class="fas fa-plus-circle me-1"></i>Thêm khách hàng mới 1
        </a>
    </div>

    <div class="card border-0 shadow-sm rounded-3">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="px-4 py-3 border-0">ID</th>
                            <th class="py-3 border-0">Tài khoản</th>
                            <th class="py-3 border-0">Họ tên</th>
                            <th class="py-3 border-0">Email</th>
                            <th class="py-3 border-0">Quyền</th>
                            <th class="py-3 border-0 text-end px-4">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listCust}" var="c">
                            <tr>
                                <td class="px-4">${c.id}</td>
                                <td class="fw-medium">${c.username}</td>
                                <td>${c.fullName}</td>
                                <td>${c.email}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${c.role == 'admin'}">
                                            <span class="badge bg-danger">Admin</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-info text-dark">Khách hàng</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-end px-4">
                                    <div class="btn-group">
                                        <a href="customer?action=edit&id=${c.id}" class="btn btn-outline-primary btn-sm rounded-pill px-3 me-2">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </a>
                                        <a href="customer?action=delete&id=${c.id}" class="btn btn-outline-danger btn-sm rounded-pill px-3"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa khách hàng này không?');">
                                            <i class="fas fa-trash-alt me-1"></i>Xóa
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty listCust}">
                            <tr>
                                <td colspan="5" class="text-center py-5 text-muted">
                                    <i class="fas fa-user-slash fa-3x mb-3 d-block opacity-25"></i>
                                    Chưa có khách hàng nào.
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
