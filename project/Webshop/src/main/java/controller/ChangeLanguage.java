package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Locale;

@WebServlet(name = "ChangeLanguage", value = "/ChangeLanguage")
public class ChangeLanguage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lang = request.getParameter("lang");

        HttpSession session = request.getSession();

        if (lang != null) {
            if (lang.equals("en")) {
                session.setAttribute("lang", "en");
                session.setAttribute("locale", new Locale("en"));
            } else if (lang.equals("vi")) {
                session.setAttribute("lang", "vi");
                session.setAttribute("locale", new Locale("vi"));
            }
        }
        if (session.getAttribute("locale") == null) {
            session.setAttribute("locale", new Locale("vi"));
        }

        String referer = request.getHeader("referer");
        if (referer == null || referer.trim().isEmpty()) {
            referer = request.getContextPath() + "/LoadProduct";
        }
        response.sendRedirect(referer);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}