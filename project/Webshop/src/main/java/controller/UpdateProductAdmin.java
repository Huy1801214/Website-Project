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
        String product_name = request.getParameter("product_name");
        String img = request.getParameter("img");
        String description = request.getParameter("description");
        String in = request.getParameter("in_price");
        BigDecimal in_price = new BigDecimal(in);
        String out = request.getParameter("out_price");
        BigDecimal out_price = new BigDecimal(out);
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Date created_date = Date.valueOf(request.getParameter("creadted_date"));
        int id_category = Integer.parseInt(request.getParameter("id_category"));

        Products products = new Products();
        products.setId_product(id_product);
        products.setProduct_name(product_name);
        products.setImg(img);
        products.setDescription(description);
        products.setIn_price(in_price);
        products.setOut_price(out_price);
        products.setQuantity(quantity);
        products.setCreadted_date(created_date);
        products.setId_category(id_category);

        Products p = dao.selectById(products.getId_product());

        dao.update(p);
        response.sendRedirect("Products_admin.jsp");
    }
}