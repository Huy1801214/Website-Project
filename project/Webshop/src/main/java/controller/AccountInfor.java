package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;

@WebServlet(name = "AccountInfor", value = "/AccountInfor")
public class AccountInfor extends HttpServlet {
    UserDAO dao = new UserDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        String surname = request.getParameter("surname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone_num = request.getParameter("phone_num");
        String address = request.getParameter("address");

        user.setSurname(surname);
        user.setLastname(lastname);
        user.setUsername(username);
        user.setGender(gender);
        user.setEmail(email);
        user.setPhone_num(phone_num);
        user.setAddress(address);

        int rs = dao.update(user);

        if(rs > 0) {
            System.out.println("rs: " + rs);
            request.getRequestDispatcher("view/jsp/account_infor.jsp").forward(request, response);
        } else {
            System.out.println("rs: " + rs);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}