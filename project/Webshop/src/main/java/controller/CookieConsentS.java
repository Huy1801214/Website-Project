package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "CookieConsentS", value = "/CookieConsentS")
public class CookieConsentS extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String consent = request.getParameter("consent");

        // luu lai lua chon nguoi dung
        if (consent != null) {
            HttpSession session = request.getSession(true);

            if (consent.equals("true")) {
                Cookie cookie = new Cookie("cookieT", "true");
                cookie.setHttpOnly(true);
                cookie.setSecure(request.isSecure());
                cookie.setPath("/");
                response.addCookie(cookie);
                System.out.println("nguoi dung acp cookie");
                session.setAttribute("cookieConsent", true);
            } else {
                Cookie cookie = new Cookie("cookieT", "false");
                cookie.setHttpOnly(true);
                cookie.setSecure(request.isSecure());
                cookie.setPath("/");
                response.addCookie(cookie);
                session.setAttribute("cookieConsent", false);
                System.out.println("nguoi dung tu choi cookie");
            }
            response.sendRedirect("/Webshop/LoadProduct");
        } else {
            System.out.println("nguoi dung kh nhan gi het");
            response.sendRedirect("/Webshop/LoadProduct");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}