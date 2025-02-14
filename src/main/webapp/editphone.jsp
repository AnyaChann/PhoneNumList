<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.phonenumlist.model.Phone" %>
<%@ page import="com.example.phonenumlist.service.PhoneService" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    Phone phone = (Phone) request.getAttribute("phone");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Phone</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container">
<h2 class="mt-5">Edit Phone</h2>
<form action="phone-servlet" method="post" class="mt-3">
    <input type="hidden" name="id" value="<%= phone.getId() %>">
    <input type="hidden" name="action" value="edit">
    <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" class="form-control" value="<%= phone.getName() %>">
    </div>
    <div class="form-group">
        <label for="brand">Brand:</label>
        <select id="brand" name="brand" class="form-control">
            <option value="Apple" <%= phone.getBrand().equals("Apple") ? "selected" : "" %>>Apple</option>
            <option value="Samsung" <%= phone.getBrand().equals("Samsung") ? "selected" : "" %>>Samsung</option>
            <option value="Nokia" <%= phone.getBrand().equals("Nokia") ? "selected" : "" %>>Nokia</option>
            <option value="Others" <%= phone.getBrand().equals("Others") ? "selected" : "" %>>Others</option>
        </select>
    </div>
    <div class="form-group">
        <label for="price">Price:</label>
        <input type="text" id="price" name="price" class="form-control" value="<%= phone.getPrice() %>">
    </div>
    <div class="form-group">
        <label for="description">Description:</label>
        <textarea id="description" name="description" class="form-control"><%= phone.getDescription() %></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Update</button>
    <a href="phone-servlet" class="btn btn-secondary">Cancel</a>
</form>
</body>
</html>