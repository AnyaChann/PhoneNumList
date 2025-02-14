package com.example.phonenumlist.service;

import java.util.List;

import com.example.phonenumlist.dao.PhoneDAO;
import com.example.phonenumlist.model.Phone;

public class PhoneService {
    private PhoneDAO phoneDAO;

    public PhoneService() {
        this.phoneDAO = new PhoneDAO();
    }

    public void addPhone(Phone phone) {
        phoneDAO.savePhone(phone);
    }

    public List<Phone> getAllPhones() {
        return phoneDAO.getAllPhones();
    }
}