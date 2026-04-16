<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp">
    <jsp:param name="title" value="Thêm sản phẩm mới" />
</jsp:include>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
                <div class="card-header bg-gradient-primary py-4 border-0">
                    <h4 class="text-white fw-bold mb-0 text-center">
                        <i class="fas fa-plus-circle me-2"></i>Thêm Sản Phẩm Mới
                    </h4>
                </div>
                <div class="card-body p-5 bg-white">
                    <form action="product-create" method="post" class="needs-validation" novalidate>
                        <div class="row g-4">
                            <div class="col-md-12">
                                <label for="name" class="form-label fw-semibold text-secondary mb-2">
                                    <i class="fas fa-tag me-2"></i>Tên sản phẩm
                                </label>
                                <input type="text" class="form-control form-control-lg bg-light border-0 py-3 shadow-none px-4" 
                                       id="name" name="name" required placeholder="Nhập tên sản phẩm"
                                       style="border-radius: 12px; transition: all 0.3s ease;">
                                <div class="invalid-feedback ps-2">Vui lòng nhập tên sản phẩm</div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="price" class="form-label fw-semibold text-secondary mb-2">
                                    <i class="fas fa-coins me-2"></i>Giá (VNĐ)
                                </label>
                                <input type="number" step="0.01" class="form-control form-control-lg bg-light border-0 py-3 shadow-none px-4" 
                                       id="price" name="price" required placeholder="0.00"
                                       style="border-radius: 12px; transition: all 0.3s ease;">
                                <div class="invalid-feedback ps-2">Vui lòng nhập giá sản phẩm</div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="stock" class="form-label fw-semibold text-secondary mb-2">
                                    <i class="fas fa-boxes me-2"></i>Số lượng tồn kho
                                </label>
                                <input type="number" class="form-control form-control-lg bg-light border-0 py-3 shadow-none px-4" 
                                       id="stock" name="stock" required placeholder="0"
                                       style="border-radius: 12px; transition: all 0.3s ease;">
                                <div class="invalid-feedback ps-2">Vui lòng nhập số lượng</div>
                            </div>
                            
                            <div class="col-md-12">
                                <label for="categoryId" class="form-label fw-semibold text-secondary mb-2">
                                    <i class="fas fa-list me-2"></i>Danh mục
                                </label>
                                <select class="form-select form-select-lg bg-light border-0 py-3 shadow-none px-4" 
                                        id="categoryId" name="categoryId" required
                                        style="border-radius: 12px; transition: all 0.3s ease;">
                                    <option value="" selected disabled>Chọn danh mục</option>
                                    <c:forEach items="${listCategories}" var="c">
                                        <option value="${c.cid}">${c.cname}</option>
                                    </c:forEach>
                                </select>
                                <div class="invalid-feedback ps-2">Vui lòng chọn danh mục</div>
                            </div>
                            
                            <div class="col-md-12">
                                <label for="image" class="form-label fw-semibold text-secondary mb-2">
                                    <i class="fas fa-image me-2"></i>URL Hình ảnh
                                </label>
                                <input type="text" class="form-control form-control-lg bg-light border-0 py-3 shadow-none px-4" 
                                       id="image" name="image" placeholder="https://example.com/image.jpg"
                                       style="border-radius: 12px; transition: all 0.3s ease;">
                            </div>
                            
                            <div class="col-md-12">
                                <label for="description" class="form-label fw-semibold text-secondary mb-2">
                                    <i class="fas fa-align-left me-2"></i>Mô tả
                                </label>
                                <textarea class="form-control bg-light border-0 py-3 shadow-none px-4" 
                                          id="description" name="description" rows="4" placeholder="Nhập mô tả sản phẩm"
                                          style="border-radius: 12px; transition: all 0.3s ease;"></textarea>
                            </div>
                            
                            <div class="col-12 mt-4">
                                <div class="row g-3">
                                    <div class="col-6">
                                        <a href="products" class="btn btn-outline-secondary w-100 py-3 fw-bold border-2"
                                           style="border-radius: 12px;">
                                            <i class="fas fa-times me-2"></i>Hủy bỏ
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <button type="submit" class="btn btn-primary w-100 py-3 fw-bold shadow-sm"
                                                style="border-radius: 12px; background: linear-gradient(135deg, #4e73df 0%, #224abe 100%); border: none;">
                                            <i class="fas fa-check-circle me-2"></i>Lưu Sản Phẩm
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
            <div class="text-center mt-4">
                <a href="products" class="text-decoration-none text-muted small hover-primary">
                    <i class="fas fa-arrow-left me-1"></i> Quay lại danh sách sản phẩm
                </a>
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

    .card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    
    .card:hover {
        transform: translateY(-5px);
    }

    .hover-primary:hover {
        color: #4e73df !important;
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

<jsp:include page="/views/layout/footer.jsp" />
