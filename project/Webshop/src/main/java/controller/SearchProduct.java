package controller;

import dao.database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Products;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchProduct", value = "/SearchProduct")
public class SearchProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        ProductDAO dao = new ProductDAO();
        List<Products> products = dao.searchProductsByName(keyword);

        // Đưa kết quả tìm kiếm vào request
        request.setAttribute("products", products);

        // Forward đến trang tìm kiếm
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/jsp/search.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}