package model;

public class CartItem {
    private ShoppingCart cart;
    private Products product;
    private int quantity;

    public CartItem() {
    }

    public CartItem(ShoppingCart cart, Products product, int quantity) {
        this.cart = cart;
        this.product = product;
        this.quantity = quantity;
    }

    public ShoppingCart getCart() {
        return cart;
    }

    public void setCart(ShoppingCart cart) {
        this.cart = cart;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
