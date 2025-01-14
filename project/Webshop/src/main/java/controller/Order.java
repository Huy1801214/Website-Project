package controller;

import dao.database.OrderDAO;
import dao.database.ProductDAO;
import dao.database.ShoppingCartDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Products;
import model.ShoppingCart;
import model.User;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@WebServlet(name = "Order ", value = "/OrderSer")
public class Order extends HttpServlet {
    OrderDAO orderDAO = new OrderDAO();
    ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
    ProductDAO productDAO = new ProductDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        int id_user = user.getId_user();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        byte payMethod = 1;

        ShoppingCart cart = shoppingCartDAO.selectById(id_user);

        if(cart != null && cart.getIdProduct() != null){
            model.Order order = new model.Order();
            order.setIdUser(id_user);
            order.setIdCart(cart.getIdCart());
            order.setOrderDate(LocalDateTime.now());

            // lay ra gia tri sp nhan so luong sp
            int productId = cart.getIdProduct();
            Products product = productDAO.selectById(productId);
            BigDecimal outPrice = product.getOut_price();
            int soLuongSp = cart.getQuantity();
            BigDecimal quantityBigDecimal = BigDecimal.valueOf(soLuongSp);
            BigDecimal totalPrice = outPrice.multiply(quantityBigDecimal);
            order.setTotalPrice(totalPrice);

            order.setNote("No note");
            order.setPayMethod(payMethod);
            order.setStatus("Pending");
            order.setIdAddress(0);
            order.setIdProduct(cart.getIdProduct());
            order.setQuantity(cart.getQuantity());
            order.setPrice(productDAO.selectById(cart.getIdProduct()).getOut_price());
            orderDAO.insert(order);

            // cap nhat so luong san pham ban duoc sau khi thanh toan
            Products p = productDAO.selectById(cart.getIdProduct());
            int selled_quantityBanDau = p.getSelled_quantity();
            int selled_quantity = selled_quantityBanDau + cart.getQuantity();

            productDAO.updateSelledQuantity(cart.getIdProduct(),selled_quantity );

            shoppingCartDAO.delete(cart);
        }
        System.out.println("thanh toan thanh cong");
        response.sendRedirect(request.getContextPath() + "/LoadProduct");
    }
}