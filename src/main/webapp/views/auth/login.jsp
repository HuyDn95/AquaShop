<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/header.jsp"/>

<div class="login-bg">
    <div class="container">
        <div class="row justify-content-center">
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
<jsp:include page="../layout/footer.jsp"/>