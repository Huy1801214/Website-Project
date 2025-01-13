package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;

@WebServlet(name = "UpdateCustomerAdmin", value = "/UpdateCustomerAdmin")
public class UpdateCustomerAdmin extends HttpServlet {
    UserDAO dao = new UserDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_user = Integer.parseInt(request.getParameter("id_user"));
        String surname = request.getParameter("surname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone_num = request.getParameter("phone_num");
        String address = request.getParameter("address");

        User user = dao.selectById(id_user);
        user.setSurname(surname);
        user.setLastname(lastname);
        user.setUsername(username);
        user.setGender(gender);
        user.setEmail(email);
        user.setPhone_num(phone_num);
        user.setAddress(address);

        int rs = dao.update(user);
        if(rs > 0) {
            System.out.println("cap nhat cus thanh cong");
            response.sendRedirect( request.getContextPath() + "/LoadCustomerAdmin");
        } else {
            System.out.println("cap nhat cus that bai");
        }


    }
}