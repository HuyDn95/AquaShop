<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ include file="/views/layout/header.jsp" %>--%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AquaShop - <c:out value="${title}" default="Hệ Thống Quản Lý" /></title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>
<body>
<div class="login-bg mx-n3 mt-n4">
    <div class="row g-0 justify-content-center w-100">
        <div class="col-12 col-md-6 col-lg-4">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-header text-center">
                    <h3 class="my-2">Đăng Nhập</h3>
                </div>
                <div class="card-body p-4">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="login" method="post">
                        <div class="form-floating mb-3">
                            <input class="form-control" id="inputUsername" name="username" type="text"
                                   placeholder="Tên đăng nhập" required/>
                            <label for="inputUsername"><i class="fas fa-user me-2"></i>Tên đăng nhập</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="inputPassword" name="password" type="password"
                                   placeholder="Mật khẩu" required/>
                            <label for="inputPassword"><i class="fas fa-lock me-2"></i>Mật khẩu</label>
                        </div>
                        <div class="d-grid gap-2 mt-4">
                            <button class="btn btn-primary btn-lg" type="submit">Đăng nhập</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="/views/layout/footer.jsp" %>