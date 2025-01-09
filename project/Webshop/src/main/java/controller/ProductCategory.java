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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        String action = request.getParameter("action");
        List<Products> products = null;

        if ("all".equals(action)) {
            // Gọi hàm selectAll
            products = dao.selectAll();
        } else if ("category".equals(action)) {
            // Lấy id_category từ request
            String idCategoryStr = request.getParameter("id_category");
            try {
                int idCategory = Integer.parseInt(idCategoryStr);
                products = dao.selectByIdCategory(idCategory);
            } catch (NumberFormatException e) {
                // Xử lý lỗi nếu id_category không phải là số
                request.setAttribute("error", "Invalid category ID");
            }
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("view/jsp/product_All.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}