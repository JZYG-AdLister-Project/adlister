package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;
import config.Config;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    Config.getUrl(),
                    Config.getUser(),
                    Config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> allFromUser(long userId) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE user_id = ?");
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            // removed category from INSERT INTO after description, and third ?
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
//            stmt.setString(4, ad.getCategory());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public List<Ad> searchAds(String search, String category) {
        try {
            // refactor to where it searches the title and description
            // removed category after first query
            // before: LIKE ? OR category LIKE ?
            String insertQuery = "SELECT * FROM ads WHERE title LIKE ?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, "%" + search + "%");
//            stmt.setString(2, "%" + category + "%");
            ResultSet resultSet = stmt.executeQuery();
            return createAdsFromResults(resultSet);
        } catch (SQLException e) {
            throw new RuntimeException("Error searching for ad(s).", e);
        }
    }

    // maybe delete? was yelling at me?
    @Override
    public List<Ad> searchAds(String search) {
        try {
            // refactor to where it searches the title and description
            String insertQuery = "SELECT * FROM ads WHERE title LIKE ?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, "%" + search + "%");
            ResultSet resultSet = stmt.executeQuery();
            return createAdsFromResults(resultSet);
        } catch (SQLException e) {
            throw new RuntimeException("Error searching for ad(s).", e);
        }
    }

    @Override

    public void update(Ad ad) {
        try {
            String updateQuery = "UPDATE ads SET title = ?, description = ? WHERE user_id = ? AND id = ? LIMIT 1";
            PreparedStatement stmt = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setLong(3, ad.getUserId());
            stmt.setLong(4, ad.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating ad.", e);
        }
    }

    @Override
    public void delete(Ad ad) {
        try {
            String deleteQuery = "DELETE FROM ads WHERE user_id = ? AND title = ? AND description = ? limit 1";
            PreparedStatement stmt = connection.prepareStatement(deleteQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description")
//                rs.getString("category")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    public Ad findById(long id) {
       PreparedStatement stmt = null;
       try {
           stmt = connection.prepareStatement("SELECT * FROM ads WHERE id = ?");
           stmt.setLong(1, id);
           ResultSet rs = stmt.executeQuery();
           if (rs.next()) {
               return extractAd(rs);
           } else {
               return null;
           }
       } catch (SQLException e) {
           throw new RuntimeException("Error retrieving ad by ID.", e);
       }
    }
}