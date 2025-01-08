package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;

@WebServlet(name = "sessionLogin", value = "/sessionLogin")
public class sessionLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = getSessionFromCookie(request, response);

        // kiem tra co accept cookie khong
        boolean useCookie = true;
        if (session == null) { // kiem tra bang url rewriting neu khong co session
            String sessionIdFromUrl = request.getRequestedSessionId();
            if (sessionIdFromUrl != null) {
                session = request.getSession(false);
                if (session != null && !sessionIdFromUrl.equals(session.getId())) {
                    session = null;
                }
                useCookie = false;
            }
        }

        // lay cookie consent
        if(session == null) {
            String cookieConsent = request.getHeader("cookieConsent");
            if (cookieConsent == null) { // neu cookie consent null thi quay ve trang index de tiep tuc hoi cookie
                response.sendRedirect("/Webshop/LoadProduct");
                return;
            }
            if(cookieConsent.equals("false")) {
                useCookie = false;
            }
        } else {
            User user = (User) session.getAttribute("user"); // lấy đối tượng user từ session
            if(user != null) {
                if(user.getId_role() == 1) { // user role là 1
                    System.out.println("dăng nhập thành công, cookie thành công, " + session.getId());
                    response.sendRedirect("/Webshop/LoadProduct"); // chuyển hướng tới trang chủ
                } else if(user.getId_role() == 0) { // user role là 0
                    response.sendRedirect("view/jsp/Overview_admin.jsp"); // chuyển hướng tới trang admin
                }
            } else {
                response.sendRedirect("/Webshop/LoadProduct"); // nếu không có user ở session thì chuyển về trang chủ
            }
        }
    }

    private HttpSession getSessionFromCookie(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("sessionId")) {
                    String sessionId = cookie.getValue();
                    session = request.getSession(false);
                    if (session == null || !session.getId().equals(sessionId)) {
                        session = null;
                    }
                    break;
                }
            }
        }
        return session;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}