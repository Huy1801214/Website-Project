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
        String email = request.getParameter("recovery-email");
        System.out.println("request lay email " + email);

        User user = userDAO.selectByEmail(email);
        System.out.println(user.getEmail() + " id " + user.getId_user());
        if (user != null) {
            HttpSession session = request.getSession();
            System.out.println( "forget " + session.getId());
            session.setAttribute("userQMK", user);
            session.setMaxInactiveInterval(90);
            response.sendRedirect("view/jsp/ResetPassword.jsp");
        } else {
            request.setAttribute("errorMessage", "Email không tồn tại. Vui lòng nhập lại email khác.");
            System.out.println("loi");
            request.getRequestDispatcher("view/jsp/Login.jsp").forward(request, response);
        }
    }
}