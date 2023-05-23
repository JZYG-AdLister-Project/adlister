package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name="controllers.EditAdServlet", urlPatterns = "/ads/edit")
public class EditAdServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/profile").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Ads adsDao = DaoFactory.getAdsDao();
		User loggedInUser = (User) req.getSession().getAttribute("user");
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String id = req.getParameter("id");
		String[] selectedCategories = req.getParameterValues("category");

		Ad ad = new Ad(
			Long.parseLong(id),
			loggedInUser.getId(),
			title,
			description
		);

		List<Ad> ad2 = adsDao.searchNoCategory(req.getParameter("title"));
		Ad ad3 = ad2.get(0);

		if (selectedCategories != null) {
			adsDao.removeCategory(ad3.getId());
			adsDao.insertCategory(ad3.getId(), selectedCategories);
		}

		adsDao.update(ad);

		resp.sendRedirect("/profile");
	}
}
