package model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Order {
    private int idOrder;
    private int idUser;
    private int idCart;
    private LocalDateTime orderDate;
    private Integer idVoucher;
    private BigDecimal totalPrice;
    private int idAddress;
    private String note;
    private byte payMethod;
    private String status;
    private int idProduct;
    private int quantity;
    private BigDecimal price;


    public Order() {
    }

    public Order(int idOrder, int idUser, int idCart, LocalDateTime orderDate, Integer idVoucher, BigDecimal totalPrice,
                 int idAddress, String note, byte payMethod, String status, int idProduct, int quantity, BigDecimal price) {
        this.idOrder = idOrder;
        this.idUser = idUser;
        this.idCart = idCart;
        this.orderDate = orderDate;
        this.idVoucher = idVoucher;
        this.totalPrice = totalPrice;
        this.idAddress = idAddress;
        this.note = note;
        this.payMethod = payMethod;
        this.status = status;
        this.idProduct = idProduct;
        this.quantity = quantity;
        this.price = price;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdCart() {
        return idCart;
    }

    public void setIdCart(int idCart) {
        this.idCart = idCart;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getIdVoucher() {
        return idVoucher;
    }

    public void setIdVoucher(Integer idVoucher) {
        this.idVoucher = idVoucher;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public byte getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(byte payMethod) {
        this.payMethod = payMethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}