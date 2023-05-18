package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // get a list of all ads the user has posted
    List<Ad> allFromUser(long userId);
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    // update an existing ad
    void update(Ad ad);
    // delete an existing ad
    void delete(Ad ad);
}
