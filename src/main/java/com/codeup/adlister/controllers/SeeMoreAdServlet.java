package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.SeeMoreAdServlet", urlPatterns = "/ads/details")
public class SeeMoreAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic for redirecting user if they are not logged in
        if(request.getSession().getAttribute("user") == null) {
            request.getSession().setAttribute("ad_id", Long.parseLong(request.getParameter("id")));
            request.getSession().setAttribute("redirect", "/ads/details");
            response.sendRedirect("/login");
            // add a return statement to exit out of the entire method.
            return;
        }

    // Get the ad ID from the request parameter
        long adId = request.getSession().getAttribute("ad_id") == null ? Long.parseLong(request.getParameter("id")) : (long) request.getSession().getAttribute("ad_id");


        // Retrieve the ad details using the DAO
        Ad ad = DaoFactory.getAdsDao().findById(adId);
        User user = DaoFactory.getUsersDao().findById(ad.getUserId());

        // Pass the ad to the JSP for rendering
        request.setAttribute("ad", ad);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/ads/viewmoreAds.jsp").forward(request, response);
    }
}
