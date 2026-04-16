<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp">
    <jsp:param name="title" value="Thêm sản phẩm mới" />
</jsp:include>

<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-3">
                <div class="card-header bg-white border-0 py-3">
                    <h3 class="fw-bold text-primary mb-0"><i class="fas fa-plus-circle me-2"></i>Thêm sản phẩm mới</h3>
                </div>
                <div class="card-body p-4">
                    <form action="product-create" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label fw-medium">Tên sản phẩm</label>
                            <input type="text" class="form-control" id="name" name="name" required placeholder="Nhập tên sản phẩm">
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="price" class="form-label fw-medium">Giá ($)</label>
                                <input type="number" step="0.01" class="form-control" id="price" name="price" required placeholder="0.00">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="stock" class="form-label fw-medium">Số lượng tồn kho</label>
                                <input type="number" class="form-control" id="stock" name="stock" required placeholder="0">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="categoryId" class="form-label fw-medium">Danh mục</label>
                            <select class="form-select" id="categoryId" name="categoryId" required>
                                <option value="" selected disabled>Chọn danh mục</option>
                                <c:forEach items="${listCategories}" var="c">
                                    <option value="${c.cid}">${c.cname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="image" class="form-label fw-medium">URL Hình ảnh</label>
                            <input type="text" class="form-control" id="image" name="image" placeholder="https://example.com/image.jpg">
                        </div>
                        <div class="mb-4">
                            <label for="description" class="form-label fw-medium">Mô tả</label>
                            <textarea class="form-control" id="description" name="description" rows="4" placeholder="Nhập mô tả sản phẩm"></textarea>
                        </div>
                        <div class="d-flex justify-content-end gap-2">
                            <a href="products" class="btn btn-light px-4">Hủy</a>
                            <button type="submit" class="btn btn-primary px-4">Lưu sản phẩm</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/layout/footer.jsp" />
