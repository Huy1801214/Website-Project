package controller;

import dao.database.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Products;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;


@WebServlet(name = "AddProductAdmin", value = "/AddProductAdmin")
public class AddProductAdmin extends HttpServlet {
    ProductDAO dao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_name = request.getParameter("product_name");
        String img = request.getParameter("img");
        String description = request.getParameter("description");
        String in_priceStr = request.getParameter("in_price");
        String out_priceStr = request.getParameter("out_price");

        String quantityStr = request.getParameter("quantity");
        String date = request.getParameter("creadted_date");
        String id_categoryStr = request.getParameter("id_category");

        if (product_name == null || product_name.trim().isEmpty() ||
                img == null || img.trim().isEmpty() ||
                description == null || description.trim().isEmpty() ||
                quantityStr == null || quantityStr.trim().isEmpty()||
                id_categoryStr == null || id_categoryStr.trim().isEmpty() ||
                date == null || date.trim().isEmpty() ||
                in_priceStr == null || in_priceStr.trim().isEmpty() ||
                out_priceStr == null || out_priceStr.trim().isEmpty()
        )
        {
            System.out.println("du lieu thieu");
            request.getRequestDispatcher("view/jsp/admin/products_admin.jsp").forward(request, response);
            return;
        }

        BigDecimal in_price ;
        BigDecimal out_price;
        int id_category;
        int quantity;
        Date created_date;
        try{
            in_price = new BigDecimal(in_priceStr);
            out_price = new BigDecimal(out_priceStr);
            quantity = Integer.parseInt(quantityStr);
            id_category = Integer.parseInt(id_categoryStr);
            // xu ly ngay
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(date);
            created_date = new java.sql.Date(parsedDate.getTime());

        } catch (NumberFormatException e)
        {
            request.setAttribute("errorMessage", "Giá và số lượng phải là số hợp lệ.");
            request.getRequestDispatcher("view/jsp/admin/products_admin.jsp").forward(request, response);
            return;
        } catch (ParseException e) {
            request.setAttribute("errorMessage", "Ngày không hợp lệ, vui lòng nhập đúng định dạng yyyy-MM-dd.");
            request.getRequestDispatcher("view/jsp/admin/products_admin.jsp").forward(request, response);
            return;
        }


        Products p = new Products();
        p.setProduct_name(product_name);
        p.setImg(img);
        p.setDescription(description);
        p.setIn_price(in_price);
        p.setOut_price(out_price);
        p.setQuantity(quantity);
        p.setCreadted_date(created_date);
        p.setId_category(id_category);

        int rs = dao.insert(p);

        if (rs > 0) {
            System.out.println("them san pham thanh cong");
            response.sendRedirect(request.getContextPath() + "/LoadProductAdmin");
        } else {
            System.out.println("them san pham that bai");
        }
    }
}