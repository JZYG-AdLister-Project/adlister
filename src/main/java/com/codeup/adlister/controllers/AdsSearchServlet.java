package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.AdsSearchServlet", urlPatterns = "/ads/search")
public class AdsSearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String category = request.getParameter("category");
        List<Ad> ads = DaoFactory.getAdsDao().searchAds(search);
        List<Ad> adsCategory = DaoFactory.getAdsDao().searchAdsCategory(category);
        request.setAttribute("ads", ads);
        request.setAttribute("adsCategory", adsCategory);
        request.setAttribute("search", search);
        request.setAttribute("category", category);
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
        System.out.println("Category: " + category);
    }

}
