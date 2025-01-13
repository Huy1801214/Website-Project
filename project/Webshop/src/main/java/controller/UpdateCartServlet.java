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

import model.CartItem;
import model.Products;
import model.ProductOptions;
import model.ShoppingCart;
import model.User;

@WebServlet(name = "UpdateCartServlet", value = "/update-cart")
public class UpdateCartServlet extends HttpServlet {

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

        int itemId = Integer.parseInt(request.getParameter("id_item"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            // 1.  Check item ownership
            CartItem cartItem = cartItemDAO.selectById(itemId);
            if (cartItem == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                PrintWriter out = response.getWriter();
                out.print("Cart item not found");
                out.flush();
                return;
            }
            ShoppingCart shoppingCart = shoppingCartDAO.selectById(user.getId_user());
            if (shoppingCart == null || shoppingCart.getId_cart() != cartItem.getId_cart()) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                PrintWriter out = response.getWriter();
                out.print("You do not have permission to update this item.");
                out.flush();
                return;
            }

            // 2. Retrieve product data
            Products product = productDAO.selectById(cartItem.getId_product());
            if (product == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                PrintWriter out = response.getWriter();
                out.print("Product not found");
                out.flush();
                return;
            }

            ProductOptions productOption = productOptionDAO.selectById(cartItem.getProduct_op_id());
            if (productOption == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                PrintWriter out = response.getWriter();
                out.print("Product option not found");
                out.flush();
                return;
            }


            BigDecimal outPrice = product.getOut_price();
            BigDecimal totalPrice = outPrice.multiply(BigDecimal.valueOf(quantity));
            int quantityDiff = quantity - cartItem.getQuantity();

            // Update product quantity and total price
            cartItem.setQuantity(quantity);
            cartItem.setTotal_price(totalPrice);
            cartItemDAO.update(cartItem);

            int newQuantity = productOption.getQuantity() - quantityDiff;
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
            out.print("Update cart successfully");
            out.flush();

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = response.getWriter();
            out.print("Invalid input format");
            out.flush();
        } catch (Exception e){
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