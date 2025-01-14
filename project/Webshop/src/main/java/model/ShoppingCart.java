package model;

import java.time.LocalDateTime;

public class ShoppingCart {
    private int idCart;
    private int idUser;
    private LocalDateTime createdAt;
    private Integer idProduct;
    private Integer quantity;

    public ShoppingCart() {
    }

    public ShoppingCart(int idCart, int idUser, LocalDateTime createdAt, Integer idProduct, Integer quantity) {
        this.idCart = idCart;
        this.idUser = idUser;
        this.createdAt = createdAt;
        this.idProduct = idProduct;
        this.quantity = quantity;
    }

    public int getIdCart() {
        return idCart;
    }

    public void setIdCart(int idCart) {
        this.idCart = idCart;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Integer idProduct) {
        this.idProduct = idProduct;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}