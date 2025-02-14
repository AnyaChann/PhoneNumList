<%@ page import="java.util.List" %>
<%@ page import="com.example.phonenumlist.model.Phone" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    PhoneService phoneService = new PhoneService();
    List<Phone> phoneList = null;
    try {
        phoneList = phoneService.getAllPhones();
        request.setAttribute("phoneList", phoneList);
    } catch (Exception e) {
        e.printStackTrace(out);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Phone List</title>
</head>
<body>
    <h1>List of Phones</h1>
    <c:choose>
        <c:when test="${empty phoneList}">
            <p>Phone List is empty!</p>
        </c:when>
        <c:otherwise>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Brand</th>
                    <th>Price</th>
                    <th>Description</th>
                </tr>
                <c:forEach var="phone" items="${phoneList}">
                    <tr>
                        <td>${phone.id}</td>
                        <td>${phone.name}</td>
                        <td>${phone.brand}</td>
                        <td>${phone.price}</td>
                        <td>${phone.description}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
    <br>
    <a href="addphone.jsp">Add New Phone</a>
</body>
</html>