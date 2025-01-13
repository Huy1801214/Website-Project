package controller;

import dao.database.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "Payment", value = "/Payment")
public class Payment extends HttpServlet {
    ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
    CartItemDAO cartItemDAO = new CartItemDAO();
    OrderDAO orderDAO = new OrderDAO();
    ProductDAO productDAO = new ProductDAO();
    OrderItemDAO orderItemDAO = new OrderItemDAO();
    OrderStatusDAO orderStatusDAO = new OrderStatusDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id_user = Integer.parseInt(request.getParameter("id_user"));
        int id_address = Integer.parseInt(request.getParameter("id_address"));
        int id_voucher =  0;
        String voucherIdParam = request.getParameter("id_voucher");
        if (voucherIdParam != null && !voucherIdParam.isEmpty()) {
            id_voucher = Integer.parseInt(voucherIdParam);
        }
        int payMethod = Integer.parseInt(request.getParameter("pay_method"));
        String note = request.getParameter("note");


        ShoppingCart cart = shoppingCartDAO.selectById(id_user);
        if(cart == null) {
            System.out.println("cart null");
        }
        int id_cart = cart.getId_cart();

        // lay ra cac san pham trong gio hang cho vao list
        List<CartItem> listCartItem = cartItemDAO.selectCartItemById(id_cart);

        // tao don hang
        BigDecimal total_price = BigDecimal.ZERO;
        for(CartItem cartItem : listCartItem) {
            total_price = total_price.add(cartItem.getTotal_price());
        }

        Order order = new Order();
        order.setId_user(id_user);
        order.setId_cart(id_cart);
        order.setOrder_date(LocalDateTime.now());
        order.setId_voucher(id_voucher);
        order.setTotal_price(total_price);
        order.setPay_method(payMethod);
        order.setNote(note);
        order.setStatus("Đang xử lý");
        int id_order = orderDAO.insert(order); // gan thanh id

        for (CartItem item : listCartItem) {
            OrderItem orderItem = new OrderItem();
            orderItem.setId_order(id_order);
            orderItem.setId_product(item.getId_product());
            orderItem.setQuantity(item.getQuantity());
            orderItem.setPrice(item.getTotal_price().divide(new BigDecimal(item.getQuantity()), 2, BigDecimal.ROUND_HALF_UP));
            orderItemDAO.insert(orderItem);
            //Cập nhật số lượng sản phẩm
            productDAO.updateQuantity(item.getId_product(), item.getQuantity());
        }

        // phai xoa gio hang di
        shoppingCartDAO.delete(cart);

        // tao bang status cho don hang
        OrderStatus orderStatus = new OrderStatus();
        orderStatus.setId_order(id_order);
        orderStatus.setStatus("Đang xử lý");
        orderStatus.setUpdate_at(LocalDateTime.now());
        orderStatusDAO.insert(orderStatus);

        response.sendRedirect("/LoadProduct");

    }
}