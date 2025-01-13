package model;

import java.math.BigDecimal;

public class CartItem {
    private int id_item;
    private int id_cart;
    private int id_product;
    private int product_op_id;
    private int quantity;
    private BigDecimal total_price;

    public CartItem() {}

    public CartItem(int id_item, int id_cart, int id_product, int product_op_id, int quantity, BigDecimal total_price) {
        this.id_item = id_item;
        this.id_cart = id_cart;
        this.id_product = id_product;
        this.product_op_id = product_op_id;
        this.quantity = quantity;
        this.total_price = total_price;
    }

    public int getId_item() {
        return id_item;
    }

    public void setId_item(int id_item) {
        this.id_item = id_item;
    }

    public int getId_cart() {
        return id_cart;
    }

    public void setId_cart(int id_cart) {
        this.id_cart = id_cart;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public int getProduct_op_id() {
        return product_op_id;
    }

    public void setProduct_op_id(int product_op_id) {
        this.product_op_id = product_op_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getTotal_price() {
        return total_price;
    }

    public void setTotal_price(BigDecimal total_price) {
        this.total_price = total_price;
    }
}
