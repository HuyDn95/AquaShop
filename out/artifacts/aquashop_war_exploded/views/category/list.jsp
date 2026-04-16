
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp">
    <jsp:param name="title" value="Danh sách danh mục" />
</jsp:include>

<div class="container-fluid py-4">
    <div class="row mb-4 align-items-center">
        <div class="col-md-6">
            <h3 class="fw-bold text-dark mb-0">
                <i class="fas fa-list-alt text-primary me-2"></i>Quản lý danh mục
            </h3>
            <p class="text-muted small mb-0">Quản lý và tổ chức các danh mục sản phẩm trong hệ thống</p>
        </div>
        <div class="col-md-6 text-md-end mt-3 mt-md-0">
            <a href="category?action=add" class="btn btn-primary rounded-pill px-4 shadow-sm">
                <i class="fas fa-plus-circle me-2"></i>Thêm danh mục mới
            </a>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="ps-4 py-3 text-uppercase fs-xs fw-bold text-muted border-0" style="width: 100px;">ID</th>
                            <th class="py-3 text-uppercase fs-xs fw-bold text-muted border-0">Tên danh mục</th>
                            <th class="pe-4 py-3 text-uppercase fs-xs fw-bold text-muted border-0 text-end">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listC}" var="c">
                            <tr>
                                <td class="ps-4">
                                    <span class="fw-bold text-secondary">#${c.cid}</span>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-circle bg-soft-primary text-primary me-3">
                                            <i class="fas fa-folder"></i>
                                        </div>
                                        <div class="fw-bold text-dark">${c.cname}</div>
                                    </div>
                                </td>
                                <td class="pe-4 text-end">
                                    <div class="d-flex justify-content-end gap-2">
                                        <a href="category?action=edit&id=${c.cid}" 
                                           class="btn btn-sm btn-outline-primary rounded-circle shadow-sm" 
                                           title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="category?action=delete&id=${c.cid}" 
                                           class="btn btn-sm btn-outline-danger rounded-circle shadow-sm" 
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?');" 
                                           title="Xóa danh mục">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty listC}">
                            <tr>
                                <td colspan="3" class="text-center py-5">
                                    <div class="py-4">
                                        <i class="fas fa-folder-open fa-4x text-light mb-3 opacity-50"></i>
                                        <h5 class="text-muted">Chưa có danh mục nào</h5>
                                        <p class="text-muted small">Bắt đầu bằng cách thêm danh mục đầu tiên của bạn.</p>
                                        <a href="category?action=add" class="btn btn-primary btn-sm rounded-pill px-4">
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
