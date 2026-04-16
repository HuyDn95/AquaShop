<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp"/>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
                <div class="card-header bg-gradient-primary py-4 border-0">
                    <div class="d-flex align-items-center justify-content-between px-3">
                        <div>
                            <h4 class="text-white fw-bold mb-0">
                                <i class="fas fa-user-edit me-2"></i>Chỉnh Sửa Khách Hàng
                            </h4>
                            <p class="text-white-50 small mb-0">Cập nhật thông tin chi tiết của khách hàng #${customer.id}</p>
                        </div>
                        <a href="customer" class="btn btn-light btn-sm rounded-circle shadow-sm" style="width: 32px; height: 32px; display: flex; align-items: center; justify-content: center;">
                            <i class="fas fa-times text-primary"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-5 bg-white">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger border-0 shadow-sm rounded-3 alert-dismissible fade show mb-4" role="alert">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-exclamation-circle me-2"></i>
                                <div>${error}</div>
                            </div>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="customer?action=update" method="post" class="needs-validation" novalidate>
                        <input type="hidden" name="id" value="${customer.id}">
                        <div class="row g-4">
                            <!-- Section: Tài khoản -->
                            <div class="col-12">
                                <h6 class="text-uppercase fw-bold text-primary small mb-0 pb-2 border-bottom">
                                    <i class="fas fa-id-card me-2"></i>Thông tin đăng nhập
                                </h6>
                            </div>
                            <div class="col-md-6">
                                <label for="username" class="form-label fw-semibold text-secondary small mb-2">Tên tài khoản <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-0"><i class="fas fa-user text-muted"></i></span>
                                    <input type="text" class="form-control form-control-lg bg-light border-0 py-3 shadow-none" 
                                           id="username" name="username" value="${customer.username}" placeholder="Nhập tên đăng nhập" required
                                           style="border-top-right-radius: 12px; border-bottom-right-radius: 12px;">
                                    <div class="invalid-feedback ps-2">Vui lòng nhập tên tài khoản</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="password" class="form-label fw-semibold text-secondary small mb-2">Mật khẩu mới <span class="text-muted fw-normal">(Để trống nếu không đổi)</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-0"><i class="fas fa-lock text-muted"></i></span>
                                    <input type="password" class="form-control form-control-lg bg-light border-0 py-3 shadow-none" 
                                           id="password" name="password" placeholder="Nhập mật khẩu mới"
                                           style="border-top-right-radius: 12px; border-bottom-right-radius: 12px;">
                                </div>
                            </div>

                            <!-- Section: Cá nhân -->
                            <div class="col-12 mt-5">
                                <h6 class="text-uppercase fw-bold text-primary small mb-0 pb-2 border-bottom">
                                    <i class="fas fa-info-circle me-2"></i>Thông tin cá nhân
                                </h6>
                            </div>
                            <div class="col-md-12">
                                <label for="fullName" class="form-label fw-semibold text-secondary small mb-2">Họ và tên <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-0"><i class="fas fa-signature text-muted"></i></span>
                                    <input type="text" class="form-control form-control-lg bg-light border-0 py-3 shadow-none" 
                                           id="fullName" name="fullName" value="${customer.fullName}" placeholder="Nhập họ và tên đầy đủ" required
                                           style="border-top-right-radius: 12px; border-bottom-right-radius: 12px;">
                                    <div class="invalid-feedback ps-2">Vui lòng nhập họ và tên</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label fw-semibold text-secondary small mb-2">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-0"><i class="fas fa-envelope text-muted"></i></span>
                                    <input type="email" class="form-control form-control-lg bg-light border-0 py-3 shadow-none" 
                                           id="email" name="email" value="${customer.email}" placeholder="example@mail.com"
                                           style="border-top-right-radius: 12px; border-bottom-right-radius: 12px;">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="phone" class="form-label fw-semibold text-secondary small mb-2">Số điện thoại</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-0"><i class="fas fa-phone text-muted"></i></span>
                                    <input type="text" class="form-control form-control-lg bg-light border-0 py-3 shadow-none" 
                                           id="phone" name="phone" value="${customer.phone}" placeholder="Nhập số điện thoại"
                                           style="border-top-right-radius: 12px; border-bottom-right-radius: 12px;">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label for="address" class="form-label fw-semibold text-secondary small mb-2">Địa chỉ</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-0"><i class="fas fa-map-marker-alt text-muted"></i></span>
                                    <input type="text" class="form-control form-control-lg bg-light border-0 py-3 shadow-none" 
                                           id="address" name="address" value="${customer.address}" placeholder="Số nhà, tên đường, phường/xã, quận/huyện..."
                                           style="border-top-right-radius: 12px; border-bottom-right-radius: 12px;">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="role" class="form-label fw-semibold text-secondary small mb-2">Quyền hạn</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-0"><i class="fas fa-user-tag text-muted"></i></span>
                                    <select class="form-select form-select-lg bg-light border-0 py-3 shadow-none" 
                                            id="role" name="role"
                                            style="border-top-right-radius: 12px; border-bottom-right-radius: 12px;">
                                        <option value="user" ${customer.role == 'user' ? 'selected' : ''}>Khách hàng</option>
                                        <option value="admin" ${customer.role == 'admin' ? 'selected' : ''}>Quản trị viên (Admin)</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12 mt-5 border-top pt-4">
                                <div class="d-flex justify-content-end gap-3">
                                    <a href="customer" class="btn btn-outline-secondary px-4 py-2 fw-bold border-2" style="border-radius: 10px;">
                                        Hủy bỏ
                                    </a>
                                    <button type="submit" class="btn btn-primary px-5 py-2 fw-bold shadow-sm"
                                            style="border-radius: 10px; background: linear-gradient(135deg, #4e73df 0%, #224abe 100%); border: none;">
                                        <i class="fas fa-save me-2"></i>Cập nhật thông tin
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .bg-gradient-primary {
        background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
    }

    .form-control:focus, .form-select:focus {
        background-color: #fff !important;
        box-shadow: 0 0 0 4px rgba(78, 115, 223, 0.1) !important;
        border: 1px solid #4e73df !important;
    }
    
    .input-group-text {
        border-top-left-radius: 12px !important;
        border-bottom-left-radius: 12px !important;
    }

    .card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    
    .card:hover {
        transform: translateY(-5px);
    }

    /* Bootstrap Validation Custom Styles */
    .needs-validation .form-control:invalid, .needs-validation .form-select:invalid {
        border: 1px solid #e74a3b !important;
    }
</style>

<script>
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>

<jsp:include page="/views/layout/footer.jsp"/>
