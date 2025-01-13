package model;

import java.time.LocalDateTime;

public class OrderStatus {
    int id_status, id_order;
    String status;
    LocalDateTime update_at;

    public OrderStatus() {
    }

    public OrderStatus(int id_status, int id_order, String status, LocalDateTime update_at) {
        this.id_status = id_status;
        this.id_order = id_order;
        this.status = status;
        this.update_at = update_at;
    }

    public int getId_status() {
        return id_status;
    }

    public void setId_status(int id_status) {
        this.id_status = id_status;
    }

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(LocalDateTime update_at) {
        this.update_at = update_at;
    }
}
