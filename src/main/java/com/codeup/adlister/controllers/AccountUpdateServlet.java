package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AccountUpdateServlet", urlPatterns = "/account-update")
public class AccountUpdateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current user from the session
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            // Redirect the user to the login page if not logged in
            response.sendRedirect("/login");
            return;
        }

        // Set the user object as an attribute to access it in the JSP
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/accountUpdate.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get the current user from the session
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            // Redirect the user to the login page if not logged in
            response.sendRedirect("/login");
            return;
        }

        // Get the updated account details from the request parameters
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        // Validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty();


        if (inputHasErrors) {
            response.sendRedirect("/account-update");
            return;
        }

        // Update the user's account details
        user.setUsername(username);
        user.setEmail(email);


        // Update the user in the database
        DaoFactory.getUsersDao().update(user);

        // Redirect the user to the profile page
        response.sendRedirect("/profile");
    }
}
