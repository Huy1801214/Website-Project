package controller;

import dao.database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Products;

import java.io.IOException;
import java.util.List;
import java.util.Random;
import java.util.ArrayList;

@WebServlet(name = "Ct_product", value = "/Ct_product")
public class Ct_product extends HttpServlet {
    ProductDAO pDao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int product_id = Integer.parseInt(request.getParameter("id_product"));
        System.out.println(product_id);
        Products product = pDao.selectById(product_id);


        List<Products> allProducts = pDao.selectAll();

        // Chọn ngẫu nhiên 3 sản phẩm
        List<Products> randomProducts = getRandomProducts(allProducts, 3, product_id);

        request.setAttribute("product", product);
        request.setAttribute("suggestedProducts", randomProducts);
        request.getRequestDispatcher("view/jsp/Product.jsp").forward(request, response);
    }

    private List<Products> getRandomProducts(List<Products> allProducts, int count, int currentProductId) {
        List<Products> randomProducts = new ArrayList<>();
        Random random = new Random();

        while (randomProducts.size() < count) {
            int randomIndex = random.nextInt(allProducts.size());
            Products randomProduct = allProducts.get(randomIndex);

            if (randomProduct.getId_product() != currentProductId && !randomProducts.contains(randomProduct)) {
                randomProducts.add(randomProduct);
            }
        }

        return randomProducts;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}