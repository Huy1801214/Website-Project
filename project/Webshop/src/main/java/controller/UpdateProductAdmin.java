package controller;

import dao.database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Products;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

@WebServlet(name = "UpdateProductAdmin", value = "/UpdateProductAdmin")
public class UpdateProductAdmin extends HttpServlet {
    ProductDAO dao = new ProductDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_product = Integer.parseInt(request.getParameter("id_product"));

        Products p = dao.selectById(id_product);

        dao.update(p);
        response.sendRedirect("Products_admin.jsp");
    }
}