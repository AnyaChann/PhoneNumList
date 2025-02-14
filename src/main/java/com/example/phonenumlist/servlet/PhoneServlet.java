package com.example.phonenumlist.servlet;

import java.io.IOException;
import java.util.List;

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
            System.out.println("Phone added: " + phone);
            response.sendRedirect("phone-servlet");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Phone> phoneList = phoneService.getAllPhones();
        request.setAttribute("phoneList", phoneList);
        request.getRequestDispatcher("listphone.jsp").forward(request, response);
    }
}