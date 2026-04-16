<%--
  Created by IntelliJ IDEA.
  User: huykan
  Date: 4/12/2026
  Time: 10:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/layout/header.jsp">
    <jsp:param name="title" value="Danh sách danh mục" />
</jsp:include>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold text-primary"><i class="fas fa-list-alt me-2"></i>Quản lý danh mục</h2>
        <a href="category?action=add" class="btn btn-success shadow-sm">
            <i class="fas fa-plus-circle me-1"></i>Thêm danh mục mới
        </a>
    </div>

    <div class="card border-0 shadow-sm rounded-3">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="px-4 py-3 border-0">ID</th>
                            <th class="py-3 border-0">Tên danh mục</th>
                            <th class="py-3 border-0 text-end px-4">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listC}" var="c">
                            <tr>
                                <td class="px-4">${c.cid}</td>
                                <td class="fw-medium">${c.cname}</td>
                                <td class="text-end px-4">
                                    <div class="btn-group">
                                        <a href="category?action=edit&id=${c.cid}" class="btn btn-outline-primary btn-sm rounded-pill px-3 me-2">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </a>
                                        <a href="category?action=delete&id=${c.cid}" class="btn btn-outline-danger btn-sm rounded-pill px-3"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?');">
                                            <i class="fas fa-trash-alt me-1"></i>Xóa
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty listC}">
                            <tr>
                                <td colspan="3" class="text-center py-5 text-muted">
                                    <i class="fas fa-folder-open fa-3x mb-3 d-block opacity-25"></i>
                                    Chưa có danh mục nào được tạo.
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
