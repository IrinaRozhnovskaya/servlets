package com.github.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/")
public class CookieServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String un = request.getParameter("username");
        String pw = request.getParameter("password");

        Cookie ck = new Cookie("mycookie", un);
        response.addCookie(ck);

        response.sendRedirect("home.jsp");

    }

}
