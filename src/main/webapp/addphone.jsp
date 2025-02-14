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
</head>
<body>
<h2>Add Phone</h2>
<% if (!message.isEmpty()) { %>
    <p style="color:red;"><%= message %></p>
<% } %>
<form action="phone-servlet" method="post">
    <label for="id">ID:</label><br>
    <input type="text" id="id" name="id"><br><br>
    
    <label for="name">Name:</label><br>
    <input type="text" id="name" name="name"><br><br>
    
    <label for="brand">Brand:</label><br>
    <select id="brand" name="brand">
        <option value="">Select Brand</option>
        <option value="Apple">Apple</option>
        <option value="Samsung">Samsung</option>
        <option value="Nokia">Nokia</option>
        <option value="Others">Others</option>
    </select><br><br>
    
    <label for="price">Price:</label><br>
    <input type="text" id="price" name="price"><br><br>
    
    <label for="description">Description:</label><br>
    <textarea id="description" name="description"></textarea><br><br>
    
    <input type="submit" value="Submit">
    <input type="reset" value="Reset" onclick="clearForm()">
</form>

<script>
    function clearForm() {
        document.getElementById("id").value = "";
        document.getElementById("name").value = "";
        document.getElementById("brand").selectedIndex = 0;
        document.getElementById("price").value = "";
        document.getElementById("description").value = "";
    }
</script>
</body>
</html>