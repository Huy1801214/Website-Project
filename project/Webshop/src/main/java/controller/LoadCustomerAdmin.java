package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadCustomerAdmin", value = "/LoadCustomerAdmin")
public class LoadCustomerAdmin extends HttpServlet {
    UserDAO dao = new UserDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = dao.selectAll();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("view/jsp/CustomerAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}