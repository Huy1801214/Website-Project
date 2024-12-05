package dao.database;

import dao.db.DBConnect;
import model.Ct_user;

import java.sql.*;
import java.util.ArrayList;

public class Ct_userDAO implements DAOInterface<Ct_user> {
    @Override
    public ArrayList<Ct_user> selectAll() {
        ArrayList<Ct_user> ct_users = new ArrayList<>();
        String query = "select * from ct_user";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;
        try {
            assert preparedStatement != null;
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id_user = resultSet.getInt("id_user");
                String surname = resultSet.getString("surname");
                String lastname = resultSet.getString("lastname");
                String username = resultSet.getString("username");
                String gender = resultSet.getString("gender");
                String phone_num = resultSet.getString("phone_num");
                String email = resultSet.getString("email");
                Date date_of_birth = resultSet.getDate("date_of_birth");
                String address = resultSet.getString("address");
                String password = resultSet.getString("password");

                Ct_user ct_user = new Ct_user(id_user, surname, lastname, username, gender, phone_num, email, date_of_birth, address, password);
                ct_users.add(ct_user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return ct_users;
    }

    @Override
    public Ct_user selectById(Ct_user ct) {
        Ct_user ct_user = null;
        String query = "select * from ct_user where id_user = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, ct.getId_user());
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id_user = resultSet.getInt("id_user");
                String surname = resultSet.getString("surname");
                String lastname = resultSet.getString("lastname");
                String username = resultSet.getString("username");
                String gender = resultSet.getString("gender");
                String phone_num = resultSet.getString("phone_num");
                String email = resultSet.getString("email");
                Date date_of_birth = resultSet.getDate("date_of_birth");
                String address = resultSet.getString("address");
                String password = resultSet.getString("password");

                ct_user = new Ct_user(id_user, surname, lastname, username, gender, phone_num, email, date_of_birth, address, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }

        return ct_user;
    }

    @Override
    public int insert(Ct_user ctUser) {
        int rs = 0;
        String query = "insert into ct_user values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, ctUser.getId_user());
            preparedStatement.setString(2, ctUser.getSurname());
            preparedStatement.setString(3, ctUser.getLastname());
            preparedStatement.setString(4, ctUser.getUsername());
            preparedStatement.setString(5, ctUser.getGender());
            preparedStatement.setString(6, ctUser.getPhone_num());
            preparedStatement.setString(7, ctUser.getEmail());
            preparedStatement.setDate(8, ctUser.getDate_of_birth());
            preparedStatement.setString(9, ctUser.getAddress());
            preparedStatement.setString(10, ctUser.getPassword());

            rs = preparedStatement.executeUpdate();

            System.out.println("Có " + rs + "dong bi thay doi");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public int insertAll(ArrayList<Ct_user> arr) {
        int rs = 0;
        for (Ct_user ctUser : arr) {
            rs += insert(ctUser);
        }
        return rs;
    }

    @Override
    public int delete(Ct_user ctUser) {
        int rs = 0;
        String query = "delete from ct_user where id_user = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, ctUser.getId_user());

            rs = preparedStatement.executeUpdate();

            System.out.println("co " + rs + " dong bi xoa");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public int deleteAll(ArrayList<Ct_user> arr) {
        int rs = 0;
        for (Ct_user ctUser : arr) {
            rs += delete(ctUser);
        }
        return rs;
    }

    @Override
    public int update(Ct_user ctUser) {
        int rs = 0;
        String query = "update ct_user set surname = ?, lastname = ?, username = ?, gender = ?, phone_num = ?, " +
                "email = ?, date_of_birth = ?, address = ?, password = ? WHERE id_user = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        try {
            assert preparedStatement != null;
            preparedStatement.setString(1, ctUser.getSurname());
            preparedStatement.setString(2, ctUser.getLastname());
            preparedStatement.setString(3, ctUser.getUsername());
            preparedStatement.setString(4, ctUser.getGender());
            preparedStatement.setString(5, ctUser.getPhone_num());
            preparedStatement.setString(6, ctUser.getEmail());
            preparedStatement.setDate(7, ctUser.getDate_of_birth());
            preparedStatement.setString(8, ctUser.getAddress());
            preparedStatement.setString(9, ctUser.getPassword());
            preparedStatement.setInt(10, ctUser.getId_user());

            rs = preparedStatement.executeUpdate();

            System.out.println("co " + rs + " dong bi xoa");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    public boolean isEmailExist(String email) {
        String query = "select * from ct_user where email = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return false;
    }
}
