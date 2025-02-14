package com.example.phonenumlist.servlet;

import java.io.IOException;

import com.example.phonenumlist.model.Phone;
import com.example.phonenumlist.service.PhoneService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "phoneServlet", value = "/phone-servlet")
public class PhoneServlet extends HttpServlet {
    private PhoneService phoneService;

    @Override
    public void init() throws ServletException {
        phoneService = new PhoneService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String price = request.getParameter("price");
        String description = request.getParameter("description");

        Phone phone = new Phone();
        phone.setId(Integer.parseInt(id));
        phone.setName(name);
        phone.setBrand(brand);
        phone.setPrice(Double.parseDouble(price));
        phone.setDescription(description);

        phoneService.addPhone(phone);

        response.sendRedirect("listphone.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests if needed
    }
}