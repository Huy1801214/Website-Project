package controller;

import dao.database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Products;
import model.User;

import java.io.IOException;

@WebServlet(name = "ShowDetailPro", value = "/ShowDetailPro")
public class ShowDetailPro extends HttpServlet {
    ProductDAO dao = new ProductDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_product = Integer.parseInt(request.getParameter("id_product"));

        if (id_product != 0) {
            try {
                Products pro = dao.selectById(id_product);
                request.setAttribute("product", pro);
                request.getRequestDispatcher("view/jsp/admin/ProductsDetail.jsp").forward(request, response);
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