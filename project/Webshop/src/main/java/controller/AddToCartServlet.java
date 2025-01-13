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
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import model.*;


@WebServlet(name = "AddToCartServlet", value = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    private final ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
    private final CartItemDAO cartItemDAO = new CartItemDAO();
    private final ProductDAO productDAO = new ProductDAO();
    private final ProductOptionDAO productOptionDAO = new ProductOptionDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        int productId = Integer.parseInt(request.getParameter("id_product"));
        int productOpId = Integer.parseInt(request.getParameter("product_op_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try{
            // 1. Get or create shopping cart
            ShoppingCart shoppingCart = shoppingCartDAO.selectById(user.getId_user());
            int cartId = 0;
            if (shoppingCart == null) {
                ShoppingCart newShoppingCart = new ShoppingCart();
                newShoppingCart.setId_user(user.getId_user());
                newShoppingCart.setDate(null);
                cartId = shoppingCartDAO.insert(newShoppingCart);

            } else {
                cartId = shoppingCart.getId_cart();
            }

            // 2. Check if item exists
            List<CartItem> cartItems = cartItemDAO.selectCartItemById(cartId);

            CartItem existingCartItem = null;
            for (CartItem cartItem : cartItems) {
                if (cartItem.getId_product() == productId && cartItem.getProduct_op_id() == productOpId) {
                    existingCartItem = cartItem;
                    break;
                }
            }

            Products product = productDAO.selectById(productId);
            if (product == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                PrintWriter out = response.getWriter();
                out.print("Product not found");
                out.flush();
                return;
            }

            BigDecimal outPrice = product.getOut_price();

            // 3. Perform Insert or update item
            if (existingCartItem != null) {
                int newQuantity = existingCartItem.getQuantity() + quantity;
                BigDecimal totalPrice = outPrice.multiply(BigDecimal.valueOf(newQuantity));
                existingCartItem.setQuantity(newQuantity);
                existingCartItem.setTotal_price(totalPrice);
                cartItemDAO.update(existingCartItem);
            } else {
                BigDecimal totalPrice = outPrice.multiply(BigDecimal.valueOf(quantity));
                CartItem newCartItem = new CartItem();
                newCartItem.setId_cart(cartId);
                newCartItem.setId_product(productId);
                newCartItem.setProduct_op_id(productOpId);
                newCartItem.setQuantity(quantity);
                newCartItem.setTotal_price(totalPrice);
                cartItemDAO.insert(newCartItem);
            }

            // Update product options
            ProductOptions productOption = productOptionDAO.selectById(productOpId);
            if (productOption == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                PrintWriter out = response.getWriter();
                out.print("Product option not found");
                out.flush();
                return;
            }

            int newQuantity = productOption.getQuantity() - quantity;
            if (newQuantity < 0){
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                PrintWriter out = response.getWriter();
                out.print("Not enough product option");
                out.flush();
                return;
            }
            productOption.setQuantity(newQuantity);
            productOptionDAO.update(productOption);


            PrintWriter out = response.getWriter();
            out.print("Add to cart successfully");
            out.flush();

        } catch (NumberFormatException e){
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = response.getWriter();
            out.print("Invalid input format");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("GET method not allowed");
        out.flush();
    }
}