package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import util.Encrypt;

import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = userDAO.getUserIfLogin(email, Encrypt.encrypt(password));

        if(user != null) {
            // thong tin hop le thi tra ve 1 session
            HttpSession session = request.getSession(true); // true la tao session neu chưa có, lấy session nếu có
            session.setAttribute("user", user);

            //Kiểm tra cookie consent người dùng có accept kh (giong header trong raf)
            boolean useCookie = true;
            String cookieConsent = request.getHeader("cookieConsent");
            if(cookieConsent != null && cookieConsent.equals("false")) {
                useCookie = false;
            }

            // neu dong y thi dùng cookie de quan ly session
            if(useCookie) {
                String sessionId = session.getId();
                Cookie cookie = new Cookie("sessionId", sessionId);
                cookie.setHttpOnly(true);
                cookie.setSecure(request.isSecure());
                cookie.setPath("/");
                response.addCookie(cookie);
                response.sendRedirect("/Webshop/sessionLogin");
            } else {
                // neu khong dong y dung url rewriting
                String redirectUrl = response.encodeRedirectURL("/Webshop/sessionLogin");
                response.sendRedirect(redirectUrl);
            }

        } else {
            request.setAttribute("error", "Tên đăng nhập và mật khẩu không khả dụng");
            request.getRequestDispatcher("view/jsp/Login.jsp").forward(request, response);
        }
    }
}