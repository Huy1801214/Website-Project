package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;

@WebServlet(name = "ResetPass", value = "/ResetPass")
public class ResetPass extends HttpServlet {
    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userQMK");

        if(user == null) {
            response.sendRedirect("view/jsp/ResetPassword.jsp");
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu không khớp, xin vui lòng thử lại");
            request.getRequestDispatcher("view/jsp/ResetPassword.jsp").forward(request, response);
        }

        userDAO.updatePassword(user.getId_user(), password);
        session.removeAttribute("userQMK");
        response.sendRedirect("view/jsp/Login.jsp");
    }
}