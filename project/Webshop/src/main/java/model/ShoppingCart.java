package model;

import java.sql.Date;

public class ShoppingCart {
    private int id_cart;
    private int id_user;
    private Date date;

    public ShoppingCart() {
    }

    public ShoppingCart(int id_cart, int id_user, Date date) {
        this.id_cart = id_cart;
        this.id_user = id_user;
        this.date = date;
    }

    public int getId_cart() {
        return id_cart;
    }

    public void setId_cart(int id_cart) {
        this.id_cart = id_cart;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
