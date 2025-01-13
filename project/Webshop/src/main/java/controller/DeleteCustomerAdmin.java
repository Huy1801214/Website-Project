package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;

@WebServlet(name = "DeleteCustomerAdmin", value = "/DeleteCustomerAdmin")
public class DeleteCustomerAdmin extends HttpServlet {
    UserDAO dao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_user = Integer.parseInt(request.getParameter("id_user"));

        if (id_user != 0) {
            try {
                User user = dao.selectById(id_user);

                int rowsAffected = dao.delete(user);

                if (rowsAffected > 0) {
                    System.out.println("Xoa thanh cong");
                } else {
                    System.out.println("Ko xoa duoc");
                }
                response.sendRedirect("LoadCustomerAdmin");
            } catch (Exception e) {
                e.printStackTrace();

            }
        } else {
            System.out.println("Không tìm thấy mã sản phẩm!");

        }
    }
}