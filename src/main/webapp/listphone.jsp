<%@ page import="java.util.List" %>
<%@ page import="com.example.phonenumlist.model.Phone" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Phone List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
    <a href="addphone.jsp" class="btn btn-primary mt-3">Add New Phone</a>
</body>
</html>