package controller;

import dao.database.ProductDAO;
import dao.database.ProductOptionsDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ProductOptions;
import model.Products;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

@WebServlet(name = "DeleteProductAdmin", value = "/DeleteProductAdmin")
public class DeleteProductAdmin extends HttpServlet {
    ProductDAO dao = new ProductDAO();
    ProductOptionsDAO opdao = new ProductOptionsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_product = Integer.parseInt(request.getParameter("id_product"));

        if (id_product != 0) {
            try {
                Products p = dao.selectById(id_product);
                ProductOptions po = opdao.selectById(id_product);

                System.out.println(p.getProduct_name());
                int rowsOpAffected = opdao.delete(po);
                int rowsAffected = dao.delete(p);

                if (rowsAffected > 0 && rowsOpAffected > 0) {
                    System.out.println("Xoa thanh cong");
                } else {
                    System.out.println("Ko xoa duoc");
                }
                response.sendRedirect("LoadProductAdmin"); // Chuyển hướng về trang danh sách sản phẩm
            } catch (Exception e) {
                e.printStackTrace();

            }
        } else {
            System.out.println("Không tìm thấy mã sản phẩm!");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}