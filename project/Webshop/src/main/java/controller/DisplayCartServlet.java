package controller;
import dao.database.CartItemDAO;
import dao.database.ProductDAO;
import dao.database.ProductOptionDAO;
import dao.database.ShoppingCartDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import model.CartItem;
import model.Products;
import model.ProductOptions;
import model.ShoppingCart;
import model.User;


@WebServlet(name = "DisplayCartServlet", value = "/display-cart")
public class DisplayCartServlet extends HttpServlet {

    private final ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
    private final CartItemDAO cartItemDAO = new CartItemDAO();
    private final ProductDAO productDAO = new ProductDAO();
    private final ProductOptionDAO productOptionDAO = new ProductOptionDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            PrintWriter out = response.getWriter();
            out.print("User not logged in");
            out.flush();
            return;
        }
        try {

            ShoppingCart shoppingCart = shoppingCartDAO.selectById(user.getId_user());

            if (shoppingCart == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                PrintWriter out = response.getWriter();
                out.print("Shopping cart not found");
                out.flush();
                return;
            }

            int cartId = shoppingCart.getId_cart();
            List<CartItem> cartItems =  cartItemDAO.getCartItemsByCartId(cartId);
            StringBuilder cartItemList = new StringBuilder("[");
            BigDecimal total = new BigDecimal(0);
            boolean firstItem = true;

            if(cartItems != null) {
                for(CartItem cartItem : cartItems) {
                    Products product = productDAO.selectById(cartItem.getId_product());
                    if (product == null){
                        continue;
                    }
                    if (!firstItem) {
                        cartItemList.append(",");
                    } else {
                        firstItem = false;
                    }
                    cartItemList.append("{");
                    cartItemList.append("\"id_item\":").append(cartItem.getId_cart()).append(",");
                    cartItemList.append("\"product_id\":").append(product.getId_product()).append(",");
                    cartItemList.append("\"product_name\":\"").append(product.getProduct_name()).append("\",");
                    cartItemList.append("\"img\":\"").append(product.getImg()).append("\",");
                    cartItemList.append("\"description\":\"").append(product.getDescription()).append("\",");
                    cartItemList.append("\"quantity\":").append(cartItem.getQuantity()).append(",");
                    cartItemList.append("\"total_price\":").append(cartItem.getTotal_price().doubleValue());
                    cartItemList.append("}");
                    total = total.add(cartItem.getTotal_price());
                }
            }
            cartItemList.append("]");

            String cartData = "{ \"items\":" + cartItemList.toString() + ", \"total\":" + total.doubleValue() + "}";
            PrintWriter out = response.getWriter();
            out.print(cartData);
            out.flush();
        }
        catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("Error during database operation: " + e.getMessage());
            out.flush();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("POST method not allowed");
        out.flush();
    }
}