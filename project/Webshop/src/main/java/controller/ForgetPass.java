package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;

@WebServlet(name = "ForgetPass", value = "/ForgetPass")
public class ForgetPass extends HttpServlet {
    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        User user = userDAO.selectByEmail(email);
        try {
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("userQMK", user);
                session.setMaxInactiveInterval(90);
                response.sendRedirect("view/jsp/ResetPassword.jsp");
            } else {
                request.setAttribute("errorMessage", "Email không tồn tại. Vui lòng nhập lại email khác.");
                request.getRequestDispatcher("view/jsp/Login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}