package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;

@WebServlet(name = "ShowDetailCus", value = "/ShowDetailCus")
public class ShowDetailCus extends HttpServlet {
    UserDAO dao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_user = Integer.parseInt(request.getParameter("id_user"));

        if (id_user != 0) {
            try {
                User user = dao.selectById(id_user);
                request.setAttribute("customer", user);
                request.getRequestDispatcher("view/jsp/admin/CustomerDetail.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("hong tim thay ma");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}