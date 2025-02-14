<%@ page import="java.util.List" %>
<%@ page import="com.example.phonenumlist.model.Phone" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Phone List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function confirmDelete(id) {
            document.getElementById('deleteModal').setAttribute('data-id', id);
            $('#deleteModal').modal('show');
        }

        function deletePhone() {
            var id = document.getElementById('deleteModal').getAttribute('data-id');
            window.location.href = 'phone-servlet?action=delete&id=' + id;
        }

        function editPhone(id) {
            window.location.href = 'phone-servlet?action=edit&id=' + id;
        }
    </script>
</head>
<body class="container">
    <h1 class="mt-5">List of Phones</h1>
    <c:choose>
        <c:when test="${empty phoneList}">
            <p class="text-warning">Phone List is empty!</p>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered mt-3">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="phone" items="${phoneList}">
                        <tr>
                            <td>${phone.id}</td>
                            <td>${phone.name}</td>
                            <td>${phone.brand}</td>
                            <td>${phone.price}</td>
                            <td>${phone.description}</td>
                            <td>
                                <button class="btn btn-warning btn-sm" onclick="editPhone(${phone.id})">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="confirmDelete(${phone.id})">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
    <a href="addphone.jsp" class="btn btn-primary mt-3">Add New Phone</a>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this phone?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" onclick="deletePhone()">Delete</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>