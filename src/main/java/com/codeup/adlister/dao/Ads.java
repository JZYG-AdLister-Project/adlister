package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    List<Ad> all();

    // get a list of all ads the user has posted
    List<Ad> allFromUser(long userId);

    void removeCategory(Long adId);


    void selectExistingCats(Long adId);

    void insertCategory(Long addId, String[] categories);

    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    // Search by ad and category
    List<Ad> searchAdsCategory(String category);

    // Search by ad
    List<Ad> searchAds(String search);

    List<Ad> searchNoCategory(String search);

    // update an existing ad
    void update(Ad ad);

    // delete an existing ad
    void delete(Ad ad);

    // find an ad by id
    Ad findById(long adId);
}