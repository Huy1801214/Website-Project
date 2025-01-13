package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoadCustomerAdmin", value = "/LoadCustomerAdmin")
public class LoadCustomerAdmin extends HttpServlet {
    UserDAO dao = new UserDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = dao.selectAll();
        List<User> customerList = new ArrayList<>();

        for (User user : userList) {
            if(user.getId_user() == 1) {
                customerList.add(user);
            }
        }
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("view/jsp/admin/CustomerAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}