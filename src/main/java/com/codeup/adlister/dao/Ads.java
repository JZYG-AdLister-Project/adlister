package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    List<Ad> all();
    Long insert(Ad ad);
    Ad findById(long id); // Add this line
}
