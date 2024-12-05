package model;

public class User {
    String username, password;
    int id_role, id_user;

    public User(int id_user, String username, String password, int id_role) {
        this.id_user = id_user;
        this.username = username;
        this.password = password;
        this.id_role = id_role;
    }

    public User() {
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId_role() {
        return id_role;
    }

    public void setId_role(int id_role) {
        this.id_role = id_role;
    }
}
