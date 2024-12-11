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
        password = Encrypt.encrypt(password);
        User user = userDAO.getUserIfLogin(email, password);

        if(user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            // set thoi gian cho moi session
            session.setMaxInactiveInterval(1800);

            System.out.println("Session id: " + session.getId());

            if(user.getId_role() == 1) {
                response.sendRedirect("view/jsp/index.jsp");
            } else if(user.getId_role() == 0) {
                response.sendRedirect("view/jsp/Overview_admin.jsp");
            }

        } else {
            request.setAttribute("error", "Invalid username or password");
            response.sendRedirect("error.jsp");
        }
    }
}