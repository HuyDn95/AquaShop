<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp">
    <jsp:param name="title" value="Sửa danh mục"/>
</jsp:include>


<div class="row justify-content-center">
    <div class="col-md-7 col-lg-5">
        <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
            <div class="card-header bg-gradient bg-warning py-4 border-0">
                <h4 class="text-dark fw-bold mb-0 text-center">
                    <i class="fas fa-edit me-2"></i>Cập Nhật Danh Mục
                </h4>
            </div>
            <div class="card-body p-5 bg-white">
                <form action="category" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${category.cid}">

                    <div class="mb-5">
                        <label for="name" class="form-label fw-semibold text-secondary mb-3">
                            <i class="fas fa-tag me-2"></i>Tên danh mục
                        </label>
                        <input type="text" class="form-control form-control-lg bg-light border-0 py-3 shadow-none px-4"
                               id="name" name="name"
                               value="${category.cname}"
                               placeholder="Nhập tên danh mục..."
                               style="border-radius: 12px; transition: all 0.3s ease;"
                               required>
                        <div class="invalid-feedback">Vui lòng nhập tên danh mục</div>
                    </div>

                    <div class="row g-3">
                        <div class="col-6">
                            <a href="category" class="btn btn-outline-secondary w-100 py-3 fw-bold border-2"
                               style="border-radius: 12px;">
                                <i class="fas fa-times me-2"></i>Hủy bỏ
                            </a>
                        </div>
                        <div class="col-6">
                            <button type="submit" class="btn btn-warning w-100 py-3 fw-bold shadow-sm"
                                    style="border-radius: 12px; background: linear-gradient(135deg, #f6e05e 0%, #ecc94b 100%); border: none;">
                                <i class="fas fa-save me-2"></i>Lưu Thay Đổi
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="category" class="text-decoration-none text-muted small">
                <i class="fas fa-arrow-left me-1"></i> Quay lại danh sách danh mục
            </a>
        </div>
    </div>
</div>


<style>
    .form-control:focus {
        background-color: #fff !important;
        box-shadow: 0 0 0 4px rgba(246, 224, 94, 0.1) !important;
        border: 1px solid #f6e05e !important;
    }

    .card {
        transition: transform 0.3s ease;
    }

    .bg-gradient-warning {
        background: linear-gradient(135deg, #f6e05e 0%, #ecc94b 100%);
    }
</style>

<jsp:include page="/views/layout/footer.jsp"/>
