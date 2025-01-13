package controller;

import dao.database.CartItemDAO;
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


import model.CartItem;
import model.ProductOptions;
import model.ShoppingCart;
import model.User;


@WebServlet(name = "DeleteCartItemServlet", value = "/delete-cart-item")
public class DeleteCartItemServlet extends HttpServlet {

    private final ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
    private final CartItemDAO cartItemDAO = new CartItemDAO();
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

        try{
            CartItem cartItem = cartItemDAO.selectById(itemId);
            if(cartItem == null){
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                PrintWriter out = response.getWriter();
                out.print("Cart item not found");
                out.flush();
                return;
            }
            ShoppingCart shoppingCart = shoppingCartDAO.selectById(user.getId_user());
            if (shoppingCart == null || shoppingCart.getId_cart() != cartItem.getId_cart()){
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                PrintWriter out = response.getWriter();
                out.print("You do not have permission to update this item.");
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

            productOption.setQuantity(productOption.getQuantity() + cartItem.getQuantity());
            productOptionDAO.update(productOption);

            cartItemDAO.deleteCartItemById(itemId);

            PrintWriter out = response.getWriter();
            out.print("Delete cart item successfully");
            out.flush();
        }  catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = response.getWriter();
            out.print("Invalid input format");
            out.flush();
        } catch (Exception e) {
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