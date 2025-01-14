package controller;

import dao.database.ProductDAO;
import dao.database.ShoppingCartDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.CartItem;
import model.Products;
import model.ShoppingCart;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ViewCart", value = "/ViewCart")
public class ViewCart extends HttpServlet {
    ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
    ProductDAO  productDAO = new ProductDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int id_user = user.getId_user();

        if (user == null) {
            response.sendRedirect("/Login");
        }

        ShoppingCart cart = shoppingCartDAO.selectById(id_user);
        System.out.println("cart user " + cart.getIdUser());
        if(cart != null && cart.getIdProduct() != null){
            Products product = productDAO.selectById(cart.getIdProduct());
            CartItem cartItem = new CartItem();
            cartItem.setCart(cart);
            cartItem.setProduct(product);
            cartItem.setQuantity(cart.getQuantity());
            List<CartItem> cartItemList = new ArrayList<>();
            cartItemList.add(cartItem);
            request.setAttribute("cart",cartItemList);
        }

        request.getRequestDispatcher("/view/jsp/Shopping_cart.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}