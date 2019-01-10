package com.github.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CookieServlet")
public class CookieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (isUnauthorized(req.getCookies()))
            resp.sendRedirect("login.jsp");
    }

    private boolean isUnauthorized(Cookie[] cookies) {
        return true;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String un = request.getParameter("username");
        String pw = request.getParameter("password");

        Cookie ck = new Cookie("mycookie", un);
        response.addCookie(ck);

        response.sendRedirect("home.jsp");

    }

}
