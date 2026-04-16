<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp">
    <jsp:param name="title" value="Thêm khách hàng mới" />
</jsp:include>

<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card border-0 shadow-sm rounded-3">
                <div class="card-header bg-white py-3 border-0">
                    <h3 class="fw-bold text-primary mb-0"><i class="fas fa-user-plus me-2"></i>Thêm khách hàng mới</h3>
                </div>
                <div class="card-body p-4">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>
                    <form action="customer?action=insert" method="post">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="username" class="form-label fw-medium">Tên tài khoản</label>
                                <input type="text" class="form-control" id="username" name="username" value="${cust.username}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="password" class="form-label fw-medium">Mật khẩu</label>
                                <input type="password" class="form-control" id="password" name="password" value="${cust.password}" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="fullName" class="form-label fw-medium">Họ và tên</label>
                            <input type="text" class="form-control" id="fullName" name="fullName" value="${cust.fullName}" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="email" class="form-label fw-medium">Email</label>
                                <input type="email" class="form-control" id="email" name="email" value="${cust.email}">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="phone" class="form-label fw-medium">Số điện thoại</label>
                                <input type="text" class="form-control" id="phone" name="phone" value="${cust.phone}">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label fw-medium">Địa chỉ</label>
                            <textarea class="form-control" id="address" name="address" rows="2">${cust.address}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="role" class="form-label fw-medium">Quyền hạn</label>
                            <select class="form-select" id="role" name="role">
                                <option value="user" ${cust.role == 'user' ? 'selected' : ''}>Khách hàng</option>
                                <option value="admin" ${cust.role == 'admin' ? 'selected' : ''}>Admin</option>
                            </select>
                        </div>
                        <div class="d-flex justify-content-between mt-4">
                            <a href="customer" class="btn btn-outline-secondary px-4">
                                <i class="fas fa-arrow-left me-1"></i>Quay lại
                            </a>
                            <button type="submit" class="btn btn-success px-4">
                                <i class="fas fa-save me-1"></i>Lưu thông tin
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/layout/footer.jsp" />
