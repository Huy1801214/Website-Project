package model;

import java.math.BigDecimal;
import java.sql.Date;

public class Products {
    private int id_product;
    private String product_name;
    private String img;
    private String description;
    private BigDecimal in_price;
    private BigDecimal out_price;
    private int quantity;
    private int selled_quantity;
    private Date creadted_date;
    private int id_category;


    public Products(int id_product, String product_name, String img, String description, BigDecimal in_price, BigDecimal out_price, int quantity, int selled_quantity, Date creadted_date, int id_category) {
        this.id_product = id_product;
        this.product_name = product_name;
        this.img = img;
        this.description = description;
        this.in_price = in_price;
        this.out_price = out_price;
        this.quantity = quantity;
        this.selled_quantity = selled_quantity;
        this.creadted_date = creadted_date;
        this.id_category = id_category;
    }

    public Products() {
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getIn_price() {
        return in_price;
    }

    public void setIn_price(BigDecimal in_price) {
        this.in_price = in_price;
    }

    public BigDecimal getOut_price() {
        return out_price;
    }

    public void setOut_price(BigDecimal out_price) {
        this.out_price = out_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSelled_quantity() {
        return selled_quantity;
    }

    public void setSelled_quantity(int selled_quantity) {
        this.selled_quantity = selled_quantity;
    }

    public Date getCreadted_date() {
        return creadted_date;
    }

    public void setCreadted_date(Date creadted_date) {
        this.creadted_date = creadted_date;
    }

    public int getId_category() {
        return id_category;
    }

    public void setId_category(int id_category) {
        this.id_category = id_category;
    }
}
