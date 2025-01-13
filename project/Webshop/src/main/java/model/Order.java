package model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Order {
    int id_order, id_user, id_cart;
    LocalDateTime order_date;
    int id_voucher;
    BigDecimal total_price;
    int id_address;
    String note;
    int pay_method;
    String status;

    public Order() {
    }

    public Order(int id_order, int id_user, int id_cart, LocalDateTime order_date, int id_voucher, BigDecimal total_price,
                 int id_address, String note, int pay_method, String status) {
        this.id_order = id_order;
        this.id_user = id_user;
        this.id_cart = id_cart;
        this.order_date = order_date;
        this.id_voucher = id_voucher;
        this.total_price = total_price;
        this.id_address = id_address;
        this.note = note;
        this.pay_method = pay_method;
        this.status = status;
    }

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getId_cart() {
        return id_cart;
    }

    public void setId_cart(int id_cart) {
        this.id_cart = id_cart;
    }

    public LocalDateTime getOrder_date() {
        return order_date;
    }

    public void setOrder_date(LocalDateTime order_date) {
        this.order_date = order_date;
    }

    public int getId_voucher() {
        return id_voucher;
    }

    public void setId_voucher(int id_voucher) {
        this.id_voucher = id_voucher;
    }

    public BigDecimal getTotal_price() {
        return total_price;
    }

    public void setTotal_price(BigDecimal total_price) {
        this.total_price = total_price;
    }

    public int getId_address() {
        return id_address;
    }

    public void setId_address(int id_address) {
        this.id_address = id_address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getPay_method() {
        return pay_method;
    }

    public void setPay_method(int pay_method) {
        this.pay_method = pay_method;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
