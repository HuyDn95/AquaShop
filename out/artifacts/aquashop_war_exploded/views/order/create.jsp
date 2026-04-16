<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="title" value="Thêm đơn hàng mới" scope="request"/>
<%@ include file="/views/layout/header.jsp" %>

<div class="container-fluid px-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h3 mb-0 text-gray-800">Tạo Đơn Hàng Mới</h1>
        <a href="${pageContext.request.contextPath}/orders" class="btn btn-secondary shadow-sm">
            <i class="fas fa-arrow-left fa-sm text-white-50"></i> Quay lại
        </a>
    </div>

    <form action="${pageContext.request.contextPath}/orders?action=create" method="post" id="orderForm">
        <div class="row">
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Thông tin khách hàng</h6>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="customerId" class="form-label fw-bold">Chọn khách hàng <span class="text-danger">*</span></label>
                            <select class="form-select" id="customerId" name="customerId" required>
                                <option value="" selected disabled>-- Chọn khách hàng --</option>
                                <c:forEach var="customer" items="${customers}">
                                    <option value="${customer.id}">${customer.fullName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Tổng tiền thanh toán</label>
                            <div class="h3 text-success" id="displayTotal">0 ₫</div>
                        </div>
                        <hr>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="fas fa-save me-2"></i> Lưu đơn hàng
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-8 col-lg-7">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex justify-content-between align-items-center">
                        <h6 class="m-0 font-weight-bold text-primary">Sản phẩm chọn mua</h6>
                        <button type="button" class="btn btn-sm btn-success" id="btnAddProduct">
                            <i class="fas fa-plus"></i> Thêm sản phẩm
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="productTable">
                                <thead class="table-light">
                                <tr>
                                    <th style="width: 45%">Sản phẩm</th>
                                    <th style="width: 20%">Đơn giá</th>
                                    <th style="width: 15%">Số lượng</th>
                                    <th style="width: 15%">Thành tiền</th>
                                    <th style="width: 5%"></th>
                                </tr>
                                </thead>
                                <tbody id="orderItems">
                                    <!-- Các hàng sản phẩm sẽ được thêm ở đây -->
                                </tbody>
                            </table>
                        </div>
                        <div id="emptyMessage" class="text-center py-4 text-muted">
                            <i class="fas fa-shopping-cart fa-3x mb-3 opacity-25"></i>
                            <p>Chưa có sản phẩm nào được chọn</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Template cho một hàng sản phẩm -->
<template id="itemTemplate">
    <tr class="product-row">
        <td>
            <select class="form-select product-select" name="productIds[]" required>
                <option value="" selected disabled>-- Chọn sản phẩm --</option>
                <c:forEach var="p" items="${products}">
                    <option value="${p.id}" data-price="${p.price}">${p.name}</option>
                </c:forEach>
            </select>
        </td>
        <td>
            <input type="number" class="form-control price-input" name="prices[]" readonly step="0.01">
        </td>
        <td>
            <input type="number" class="form-control quantity-input" name="quantities[]" value="1" min="1" required>
        </td>
        <td class="subtotal-cell text-end fw-bold">0 ₫</td>
        <td class="text-center">
            <button type="button" class="btn btn-outline-danger btn-sm btn-remove">
                <i class="fas fa-times"></i>
            </button>
        </td>
    </tr>
</template>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const btnAddProduct = document.getElementById('btnAddProduct');
        const orderItems = document.getElementById('orderItems');
        const itemTemplate = document.getElementById('itemTemplate');
        const emptyMessage = document.getElementById('emptyMessage');
        const displayTotal = document.getElementById('displayTotal');
        const orderForm = document.getElementById('orderForm');

        function updateTotal() {
            let total = 0;
            const rows = orderItems.querySelectorAll('.product-row');
            
            if (rows.length === 0) {
                emptyMessage.classList.remove('d-none');
            } else {
                emptyMessage.classList.add('d-none');
            }

            rows.forEach(row => {
                const price = parseFloat(row.querySelector('.price-input').value) || 0;
                const quantity = parseInt(row.querySelector('.quantity-input').value) || 0;
                const subtotal = price * quantity;
                
                row.querySelector('.subtotal-cell').textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(subtotal);
                total += subtotal;
            });

            displayTotal.textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(total);
        }

        btnAddProduct.addEventListener('click', function() {
            const clone = itemTemplate.content.cloneNode(true);
            orderItems.appendChild(clone);
            updateTotal();
        });

        orderItems.addEventListener('click', function(e) {
            if (e.target.closest('.btn-remove')) {
                e.target.closest('.product-row').remove();
                updateTotal();
            }
        });

        orderItems.addEventListener('change', function(e) {
            const row = e.target.closest('.product-row');
            if (e.target.classList.contains('product-select')) {
                const selectedOption = e.target.options[e.target.selectedIndex];
                const price = selectedOption.dataset.price;
                row.querySelector('.price-input').value = price;
            }
            updateTotal();
        });

        orderItems.addEventListener('input', function(e) {
            if (e.target.classList.contains('quantity-input')) {
                updateTotal();
            }
        });

        orderForm.addEventListener('submit', function(e) {
            const rows = orderItems.querySelectorAll('.product-row');
            if (rows.length === 0) {
                alert('Vui lòng chọn ít nhất một sản phẩm!');
                e.preventDefault();
            }
        });
        
        // Thêm hàng đầu tiên mặc định
        btnAddProduct.click();
    });
</script>

<%@ include file="/views/layout/footer.jsp" %>
