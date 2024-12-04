package controller;

import dao.database.Ct_userDAO;
import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Ct_user;
import model.User;

import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    Ct_userDAO ct_userDAO = new Ct_userDAO();
    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String surname = request.getParameter("surname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String gender = request.getParameter("gender");
        String phone_num = request.getParameter("phone_num");
        String email = request.getParameter("email");
        Date date_of_birth = Date.valueOf(request.getParameter("date_of_birth"));
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        if (ct_userDAO.isEmailExist(email)) {
            response.sendRedirect("error.jsp");
        }

        User user = new User(username, password, 1);
        int id_user = userDAO.insert(user);

        if (id_user != -1) {
            Ct_user ct_user = new Ct_user(id_user, surname, lastname, username, gender, phone_num, email, date_of_birth, address, password);
            if (ct_userDAO.insert(ct_user) != -1) {
                response.sendRedirect("Login.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}