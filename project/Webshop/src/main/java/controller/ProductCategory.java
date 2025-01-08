package controller;

import dao.database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Products;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductCategory", value = "/ProductCategory")
public class ProductCategory extends HttpServlet {
    ProductDAO dao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Products> products;
        products = dao.selectAll();

        if(products.isEmpty()){
            System.out.println("Loi database");
        }
        request.setAttribute("products", products);
        request.getRequestDispatcher("view/jsp/product_All.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}