<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.phonenumlist.model.Phone" %>
<%@ page import="com.example.phonenumlist.service.PhoneService" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    PhoneService phoneService = new PhoneService();
    String message = "";
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String price = request.getParameter("price");
        String description = request.getParameter("description");

        if (id.isEmpty() || name.isEmpty() || brand.isEmpty() || price.isEmpty() || description.isEmpty()) {
            message = "All fields are required.";
        } else {
            Phone phone = new Phone();
            phone.setId(Integer.parseInt(id));
            phone.setName(name);
            phone.setBrand(brand);
            phone.setPrice(Double.parseDouble(price));
            phone.setDescription(description);
            phoneService.savePhone(phone);
            response.sendRedirect("listphone.jsp");
        }
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
<form action="addphone.jsp" method="post">
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