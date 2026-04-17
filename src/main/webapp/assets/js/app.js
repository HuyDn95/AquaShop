// Form validation for Bootstrap 5
(function () {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
})()


jQuery(document).ready(function ($) {
    $(document).ready(function () {
        $('#productTable').DataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.13.4/i18n/vi.json"
            },
            "columnDefs": [
                {"orderable": false, "targets": [4]}
            ],
            "order": [[0, "desc"]],
            "pageLength": 10,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
        });

        $('#customerTable').DataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.13.4/i18n/vi.json"
            },
            "columnDefs": [
                {"orderable": false, "targets": [4]}
            ],
            "order": [[0, "desc"]],
            "pageLength": 10,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
        });

        $('#categoryTable').DataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.13.4/i18n/vi.json",

            },
            "columnDefs": [
                {orderable: false, targets: [2]}
            ],
            "order": [[0, "desc"]],
            "pageLength": 10,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
        });

        $('#orderTable').DataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.13.4/i18n/vi.json"
            },
            "columnDefs": [
                {"orderable": false, "targets": [4]}
            ],
            "order": [[0, "desc"]],
            "pageLength": 10,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
        });
    });


});


