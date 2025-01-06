package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import util.Encrypt;

import java.io.IOException;
import java.sql.SQLException;

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
        System.out.println( "reset " + session.getId());
        User user = (User) session.getAttribute("userQMK");

        if (user == null) {
            response.sendRedirect("view/jsp/ResetPassword.jsp");
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu không khớp, xin vui lòng thử lại");
            request.getRequestDispatcher("view/jsp/ResetPassword.jsp").forward(request, response);
            return;
        }

        System.out.println("id user " + user.getId_user());
        System.out.println("email " + user.getEmail());
        boolean bo;
        try {
            bo = userDAO.updatePassword(user.getId_user(), password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (!bo) {
            System.out.println("false");
            request.setAttribute("error", "Không thể thực hiện thao tác này, xin vui lòng thử lại");
            request.getRequestDispatcher("view/jsp/ResetPassword.jsp").forward(request, response);
        } else {
            System.out.println("true");
            session.removeAttribute("userQMK");
            response.sendRedirect("view/jsp/Login.jsp");
        }
    }
}