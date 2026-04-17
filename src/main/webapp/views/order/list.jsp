<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/views/layout/header.jsp"/>

<div class="container-fluid py-4">
    <div class="row mb-4 align-items-center">
        <div class="col-md-6">
            <h3 class="fw-bold text-dark mb-0">
                <i class="fas fa-shopping-cart text-primary me-2"></i>Quản Lý Đơn Hàng
            </h3>
            <p class="text-muted small mb-0">Theo dõi và quản lý các đơn hàng trong hệ thống</p>
        </div>
        <div class="col-md-6 text-md-end mt-3 mt-md-0">
            <a href="${pageContext.request.contextPath}/orders?action=add"
               class="btn btn-primary rounded-pill px-4 shadow-sm">
                <i class="fas fa-plus-circle me-2"></i>Thêm Đơn Hàng
            </a>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-body p-4">
            <div class="table-responsive">
                <table id="orderTable" class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                    <tr>
                        <th class="ps-4 py-3 text-uppercase fs-xs fw-bold text-muted border-0" style="width: 80px;">ID
                        </th>
                        <th class="py-3 text-uppercase fs-xs fw-bold text-muted border-0">Khách hàng</th>
                        <th class="py-3 text-uppercase fs-xs fw-bold text-muted border-0">Ngày đặt</th>
                        <th class="py-3 text-uppercase fs-xs fw-bold text-muted border-0">Tổng tiền</th>
                        <th class="pe-4 py-3 text-uppercase fs-xs fw-bold text-muted border-0 text-end">Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td class="ps-4">
                                <span class="fw-bold text-secondary">#${order.id}</span>
                            </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div>
                                        <div class="fw-bold text-dark">${order.customerName}</div>
                                        <div class="text-muted small">Mã KH: #${order.customerId}</div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <i class="far fa-calendar-alt me-2 text-muted"></i>
                                    <span><fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm"/></span>
                                </div>
                            </td>
                            <td>
                                    <span class="fw-bold text-primary">
                                        <fmt:formatNumber value="${order.totalAmount}" type="currency"
                                                          currencySymbol="₫"/>
                                    </span>
                            </td>
                            <td class="pe-4 text-end">
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="${pageContext.request.contextPath}/orders?action=view&id=${order.id}"
                                       class="btn btn-sm btn-outline-primary rounded-circle shadow-sm"
                                       title="Chi tiết">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/orders?action=delete&id=${order.id}"
                                       class="btn btn-sm btn-outline-danger rounded-circle shadow-sm"
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng này?');"
                                       title="Xóa đơn hàng">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/layout/footer.jsp"/>
