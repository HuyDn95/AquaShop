<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp">
    <jsp:param name="title" value="Danh sách sản phẩm" />
</jsp:include>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold text-primary"><i class="fas fa-fish me-2"></i>Quản lý sản phẩm</h2>
        <a href="product-create" class="btn btn-success shadow-sm">
            <i class="fas fa-plus-circle me-1"></i>Thêm sản phẩm mới
        </a>
    </div>

    <div class="card border-0 shadow-sm rounded-3">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="px-4 py-3 border-0">ID</th>
                            <th class="py-3 border-0">Ảnh</th>
                            <th class="py-3 border-0">Tên sản phẩm</th>
                            <th class="py-3 border-0">Giá</th>
                            <th class="py-3 border-0">Số lượng</th>
                            <th class="py-3 border-0 text-end px-4">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listProducts}" var="p">
                            <tr>
                                <td class="px-4">${p.id}</td>
                                <td>
                                    <img src="${p.image}" alt="${p.name}" class="rounded" style="width: 50px; height: 50px; object-fit: cover;">
                                </td>
                                <td class="fw-medium">${p.name}</td>
                                <td class="text-danger fw-bold">${p.price} $</td>
                                <td>${p.stock}</td>
                                <td class="text-end px-4">
                                    <div class="btn-group">
                                        <a href="product-edit?id=${p.id}" class="btn btn-outline-primary btn-sm rounded-pill px-3 me-2">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </a>
                                        <a href="product-delete?id=${p.id}" class="btn btn-outline-danger btn-sm rounded-pill px-3"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');">
                                            <i class="fas fa-trash-alt me-1"></i>Xóa
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty listProducts}">
                            <tr>
                                <td colspan="6" class="text-center py-5 text-muted">
                                    <i class="fas fa-box-open fa-3x mb-3 d-block opacity-25"></i>
                                    Chưa có sản phẩm nào được tạo.
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
