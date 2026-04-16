<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="title" value="Chi tiết đơn hàng" scope="request"/>
<%@ include file="/views/layout/header.jsp" %>

<div class="container-fluid px-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h3 mb-0 text-gray-800">Chi tiết đơn hàng #${order.id}</h1>
        <a href="${pageContext.request.contextPath}/orders" class="btn btn-secondary shadow-sm">
            <i class="fas fa-arrow-left fa-sm text-white-50"></i> Quay lại
        </a>
    </div>

    <div class="row">
        <!-- Thông tin đơn hàng -->
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Thông tin chung</h6>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label class="small mb-1 fw-bold">Mã khách hàng:</label>
                        <div class="h5">#${order.customerId}</div>
                    </div>
                    <div class="mb-3">
                        <label class="small mb-1 fw-bold">Ngày đặt hàng:</label>
                        <div><fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm:ss"/></div>
                    </div>
                    <div class="mb-3">
                        <label class="small mb-1 fw-bold">Tổng tiền:</label>
                        <div class="h4 text-success"><fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫"/></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Danh sách sản phẩm -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Sản phẩm trong đơn hàng</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="table-light">
                            <tr>
                                <th>Sản phẩm</th>
                                <th class="text-center">Số lượng</th>
                                <th class="text-end">Đơn giá</th>
                                <th class="text-end">Thành tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${order.orderItems}">
                                <tr>
                                    <td>${item.productName}</td>
                                    <td class="text-center">${item.quantity}</td>
                                    <td class="text-end"><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="₫"/></td>
                                    <td class="text-end fw-bold">
                                        <fmt:formatNumber value="${item.price * item.quantity}" type="currency" currencySymbol="₫"/>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot class="table-light">
                            <tr>
                                <th colspan="3" class="text-end">TỔNG CỘNG:</th>
                                <th class="text-end text-danger h5">
                                    <fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫"/>
                                </th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/views/layout/footer.jsp" %>
