package model;

public class ProductOptions {
    private int product_op_id, id_product;
    private String size, color;
    private int quantity;
    private String ma_dinh_danh;

    public ProductOptions() {
    }

    public ProductOptions(int product_op_id, int id_product, String size, String color, int quantity, String ma_dinh_danh) {
        this.product_op_id = product_op_id;
        this.id_product = id_product;
        this.size = size;
        this.color = color;
        this.quantity = quantity;
        this.ma_dinh_danh = ma_dinh_danh;
    }

    public int getProduct_op_id() {
        return product_op_id;
    }

    public void setProduct_op_id(int product_op_id) {
        this.product_op_id = product_op_id;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getMa_dinh_danh() {
        return ma_dinh_danh;
    }

    public void setMa_dinh_danh(String ma_dinh_danh) {
        this.ma_dinh_danh = ma_dinh_danh;
    }
}
