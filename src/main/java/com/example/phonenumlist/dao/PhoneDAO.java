package com.example.phonenumlist.dao;

import com.example.phonenumlist.model.Phone;
import com.example.phonenumlist.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PhoneDAO {

    public void savePhone(Phone phone) {
        String sql = "INSERT INTO Phone (id, name, brand, price, description) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, phone.getId());
            statement.setString(2, phone.getName());
            statement.setString(3, phone.getBrand());
            statement.setDouble(4, phone.getPrice());
            statement.setString(5, phone.getDescription());
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