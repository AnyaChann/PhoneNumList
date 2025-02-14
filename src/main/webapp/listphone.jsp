<%@ page import="java.util.List" %>
<%@ page import="com.example.phonenumlist.model.Phone" %>
<%@ page import="com.example.phonenumlist.service.PhoneService" %>

<%
    PhoneService phoneService = new PhoneService();
    List<Phone> phoneList = null;
    try {
        phoneList = phoneService.getAllPhones();
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
    <%
        if (phoneList == null || phoneList.isEmpty()) {
    %>
        <p>Phone List is empty!</p>
    <%
        } else {
    %>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Brand</th>
                <th>Price</th>
                <th>Description</th>
            </tr>
            <%
                for (Phone phone : phoneList) {
            %>
            <tr>
                <td><%= phone.getId() %></td>
                <td><%= phone.getName() %></td>
                <td><%= phone.getBrand() %></td>
                <td><%= phone.getPrice() %></td>
                <td><%= phone.getDescription() %></td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>
    <br>
    <a href="addphone.jsp">Add New Phone</a>
</body>
</html>