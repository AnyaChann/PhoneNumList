<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.phonenumlist.model.Phone" %>
<%@ page import="com.example.phonenumlist.service.PhoneService" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    String message = (String) request.getAttribute("message");
    if (message == null) {
        message = "";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Phone</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container">
<h2 class="mt-5">Add Phone</h2>
<% if (!message.isEmpty()) { %>
    <p class="text-danger"><%= message %></p>
<% } %>
<form action="phone-servlet" method="post" class="mt-3">
    <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" class="form-control">
    </div>
    <div class="form-group">
        <label for="brand">Brand:</label>
        <select id="brand" name="brand" class="form-control">
            <option value="">Select Brand</option>
            <option value="Apple">Apple</option>
            <option value="Samsung">Samsung</option>
            <option value="Nokia">Nokia</option>
            <option value="Others">Others</option>
        </select>
    </div>
    <div class="form-group">
        <label for="price">Price:</label>
        <input type="text" id="price" name="price" class="form-control">
    </div>
    <div class="form-group">
        <label for="description">Description:</label>
        <textarea id="description" name="description" class="form-control"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <button type="reset" class="btn btn-secondary" onclick="clearForm()">Reset</button>
</form>

<script>
    function clearForm() {
        document.getElementById("name").value = "";
        document.getElementById("brand").selectedIndex = 0;
        document.getElementById("price").value = "";
        document.getElementById("description").value = "";
    }
</script>
</body>
</html>