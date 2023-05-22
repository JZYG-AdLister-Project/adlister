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

@WebServlet(name="controllers.EditAdServlet", urlPatterns = "/ads/edit")
public class EditAdServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/profile").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User loggedInUser = (User) req.getSession().getAttribute("user");
		System.out.println("user id =" + loggedInUser.getId());
		String title = req.getParameter("title");
		System.out.println("title =" + req.getParameter("title"));
		String description = req.getParameter("description");
		String id = req.getParameter("id");
		System.out.println("id=" + req.getParameter("id"));
//		String category = req.getParameter("category");

		Ad ad = new Ad(
			Long.parseLong(id),
			loggedInUser.getId(),
			title,
			description
//			category
		);

		DaoFactory.getAdsDao().update(ad);

		resp.sendRedirect("/profile");
	}
}
