package model;

import java.math.BigDecimal;

public class OrderItem {
    int id_items, id_order, id_product, quantity;
    BigDecimal price;

    public OrderItem() {
    }

    public OrderItem(int id_items, int id_order, int id_product, int quantity, BigDecimal price) {
        this.id_items = id_items;
        this.id_order = id_order;
        this.id_product = id_product;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId_items() {
        return id_items;
    }

    public void setId_items(int id_items) {
        this.id_items = id_items;
    }

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
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
