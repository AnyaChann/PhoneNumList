package com.example.phonenumlist.servlet;

import com.example.phonenumlist.model.Phone;
import com.example.phonenumlist.service.PhoneService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "phoneServlet", value = "/phone-servlet")
public class PhoneServlet extends HttpServlet {
    private PhoneService phoneService;

    @Override
    public void init() throws ServletException {
        phoneService = new PhoneService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            updatePhone(request, response);
        } else {
            addPhone(request, response);
        }
    }

    private void addPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String price = request.getParameter("price");
        String description = request.getParameter("description");

        String message = "";
        if (name.isEmpty() || brand.isEmpty() || price.isEmpty() || description.isEmpty()) {
            message = "All fields are required.";
            request.setAttribute("message", message);
            request.getRequestDispatcher("addphone.jsp").forward(request, response);
        } else {
            Phone phone = new Phone();
            phone.setName(name);
            phone.setBrand(brand);
            phone.setPrice(Double.parseDouble(price));
            phone.setDescription(description);
            phoneService.addPhone(phone);
            response.sendRedirect("phone-servlet");
        }
    }

    private void updatePhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String price = request.getParameter("price");
        String description = request.getParameter("description");

        Phone phone = new Phone();
        phone.setId(id);
        phone.setName(name);
        phone.setBrand(brand);
        phone.setPrice(Double.parseDouble(price));
        phone.setDescription(description);
        phoneService.updatePhone(phone);
        response.sendRedirect("phone-servlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            deletePhone(request, response);
        } else if ("edit".equals(action)) {
            showEditForm(request, response);
        } else if ("reset".equals(action)) {
            resetAutoIncrement(request, response);
        } else {
            listPhones(request, response);
        }
    }

    private void deletePhone(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        phoneService.deletePhone(id);
        response.sendRedirect("phone-servlet");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Phone existingPhone = phoneService.getPhoneById(id);
        request.setAttribute("phone", existingPhone);
        request.getRequestDispatcher("editphone.jsp").forward(request, response);
    }

    private void listPhones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Phone> phoneList = phoneService.getAllPhones();
        request.setAttribute("phoneList", phoneList);
        request.getRequestDispatcher("listphone.jsp").forward(request, response);
    }

    private void resetAutoIncrement(HttpServletRequest request, HttpServletResponse response) throws IOException {
        phoneService.resetAutoIncrement();
        response.sendRedirect("phone-servlet");
    }
}