package controller;

import dao.database.Ct_userDAO;
import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Ct_user;
import model.User;
import util.Encrypt;

import java.io.IOException;
import java.sql.Date;
import java.util.Random;

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
        password = Encrypt.encrypt(password);

        if (ct_userDAO.isEmailExist(email)) {
            request.setAttribute("errorMessage", "Email đã tồn tại. Vui lòng nhập lại email khác.");
            request.getRequestDispatcher("view/jsp/Register.jsp").forward(request, response);
            return;
        }
        Random rd = new Random();
        int id_user = rd.nextInt(1000);
        User user = new User(id_user, email, password, 1);
        int isInsert = userDAO.insert(user);

        if (isInsert != -1) {
            Ct_user ct_user = new Ct_user(id_user, surname, lastname, username, gender, phone_num, email, date_of_birth, address, password);
            if (ct_userDAO.insert(ct_user) != -1) {
                response.sendRedirect("view/jsp/Login.jsp");
            } else {
                response.sendRedirect("view/jsp/Register.jsp");
            }
        } else {
            response.sendRedirect("view/jsp/Register.jsp");
        }
    }
}