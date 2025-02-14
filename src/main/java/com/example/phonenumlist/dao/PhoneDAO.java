package com.example.phonenumlist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.phonenumlist.model.Phone;
import com.example.phonenumlist.util.DatabaseUtil;

public class PhoneDAO {

    public void savePhone(Phone phone) {
        String sql = "INSERT INTO Phone (name, brand, price, description) VALUES (?, ?, ?, ?)";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, phone.getName());
            statement.setString(2, phone.getBrand());
            statement.setDouble(3, phone.getPrice());
            statement.setString(4, phone.getDescription());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Phone> getAllPhones() {
        List<Phone> phones = new ArrayList<>();
        String sql = "SELECT * FROM Phone";
        try (Connection connection = DatabaseUtil.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Phone phone = new Phone();
                phone.setId(resultSet.getInt("id"));
                phone.setName(resultSet.getString("name"));
                phone.setBrand(resultSet.getString("brand"));
                phone.setPrice(resultSet.getDouble("price"));
                phone.setDescription(resultSet.getString("description"));
                phones.add(phone);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return phones;
    }
}