package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import util.Encrypt;

import java.io.IOException;


@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
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
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        if (UserDAO.isEmailExist(email)) {
            request.setAttribute("errorMessage", "Email đã tồn tại. Vui lòng nhập lại email khác.");
            request.getRequestDispatcher("view/jsp/Register.jsp").forward(request, response);
            return;
        }

        User user = new User();
        user.setId_role(1);
        user.setSurname(surname);
        user.setLastname(lastname);
        user.setGender(gender);
        user.setPhone_num(phone_num);
        user.setAddress(address);
        user.setEmail(email);
        user.setPassword(Encrypt.encrypt(password));
        user.setUsername(username);
        int isInsert = userDAO.insert(user);

        if (isInsert != -1) {
            response.sendRedirect("view/jsp/Login.jsp");
        } else {
            response.sendRedirect("view/jsp/Register.jsp");
        }

    }
}