package controller;

import dao.database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Products;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadProductAdmin", value = "/LoadProductAdmin")
public class LoadProductAdmin extends HttpServlet {
    ProductDAO dao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Products> productsList = dao.selectAll();
        request.setAttribute("productsList", productsList);
        request.getRequestDispatcher("/view/jsp/Products_admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}