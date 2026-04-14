    </div> <!-- end container from header -->
    <c:if test="${not empty sessionScope.user}">
            </div> <!-- end content-wrapper -->
        </div> <!-- end main-wrapper -->
    </c:if>
    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>
</html>
