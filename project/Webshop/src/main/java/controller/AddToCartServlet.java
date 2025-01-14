package controller;

import dao.database.ShoppingCartDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ShoppingCart;
import model.User;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "AddToCartServlet", value = "/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_product = Integer.parseInt(request.getParameter("id_product"));
        int quantity = 1;

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");


        if (user == null) {
            response.sendRedirect("/Login");
        }
        int id_user = user.getId_user();

        ShoppingCart existingCart = shoppingCartDAO.selectById(id_user);
        if (existingCart == null) {
            ShoppingCart cart = new ShoppingCart();
            cart.setIdUser(id_user);
            cart.setCreatedAt(LocalDateTime.now());
            cart.setIdProduct(id_product);
            cart.setQuantity(quantity);
            shoppingCartDAO.insert(cart);
        } else {
            existingCart.setIdProduct(id_product);
            existingCart.setQuantity(quantity);
            shoppingCartDAO.update(existingCart);
        }
        response.sendRedirect(request.getContextPath() + "/Ct_product?id_product=" + id_product);
    }
}