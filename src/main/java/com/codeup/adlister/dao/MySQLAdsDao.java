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
            stmt = connection.prepareStatement("SELECT ads.id, ads.user_id, ads.title, ads.description, GROUP_CONCAT(c.name SEPARATOR ', ') AS category\n" +
                    "FROM ads\n" +
                    "    JOIN ads_categories ac on ads.id = ac.ad_id\n" +
                    "    JOIN categories c on ac.category_id = c.id\n" +
                    "GROUP BY ads.id;");
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
            stmt = connection.prepareStatement("SELECT ads.id, ads.user_id, ads.title, ads.description, GROUP_CONCAT(c.name SEPARATOR ', ') AS category\n" +
                    "FROM ads\n" +
                    "         JOIN ads_categories ac ON ads.id = ac.ad_id\n" +
                    "         JOIN categories c ON ac.category_id = c.id\n" +
                    "WHERE ads.user_id = ?\n" +
                    "GROUP BY ads.id;");
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

//    @Override
//    public Long insertCategory()

    @Override
    public Long insert(Ad ad) {
        try {
            // removed category from INSERT INTO after description, and third ?
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    // for ads_categories table, to update categories
    @Override
    public List<Ad> searchAdsCategory(String category) {
        try {
            String insertQuery = "SELECT ads.id, ads.user_id, ads.title, ads.description, GROUP_CONCAT(c.name SEPARATOR ', ') AS category\n" +
                    "FROM ads\n" +
                    "    JOIN ads_categories ac on ads.id = ac.ad_id\n" +
                    "    JOIN categories c on ac.category_id = c.id\n" +
                    "WHERE name LIKE ?\n" +
                    "GROUP BY ads.id";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, "%" + category + "%");
            ResultSet resultSet = stmt.executeQuery();
            return createAdsFromResults(resultSet);
        } catch (SQLException e) {
            throw new RuntimeException("Error searching for ad(s).", e);
        }
    }

    @Override
    public List<Ad> searchAds(String search) {
        try {
            String insertQuery = "SELECT ads.id, ads.user_id, ads.title, ads.description, GROUP_CONCAT(c.name SEPARATOR ', ') AS category\n" +
                    "FROM ads\n" +
                    "    JOIN ads_categories ac on ads.id = ac.ad_id\n" +
                    "    JOIN categories c on ac.category_id = c.id\n" +
                    "WHERE title LIKE ?" +
                    "GROUP BY ads.id";
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
                rs.getString("description"),
                rs.getString("category")
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
           stmt = connection.prepareStatement("SELECT ads.id, ads.user_id, ads.title, ads.description, GROUP_CONCAT(c.name SEPARATOR ', ') AS category\n" +
                   "FROM ads\n" +
                   "    JOIN ads_categories ac on ads.id = ac.ad_id\n" +
                   "    JOIN categories c on ac.category_id = c.id\n" +
                   "WHERE ads.id = ?\n" +
                   "GROUP BY ads.id");
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