package controller;

import dao.database.ProductDAO;
import dao.database.ProductOptionsDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ProductOptions;
import model.Products;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Ct_product", value = "/Ct_product")
public class Ct_product extends HttpServlet {
    ProductDAO pDao = new ProductDAO();
    ProductOptionsDAO pOptionDao = new ProductOptionsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_product = Integer.parseInt(request.getParameter("id_product"));
        System.out.println(id_product);
        Products product = pDao.selectById(id_product);

        List<ProductOptions> options = pOptionDao.getOptionsById(id_product);

        request.setAttribute("product", product);
        request.setAttribute("options", options);
        request.getRequestDispatcher("view/jsp/Product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}