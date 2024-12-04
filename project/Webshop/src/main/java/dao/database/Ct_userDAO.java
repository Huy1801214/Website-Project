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
    public Ct_user selectById(int id) {
        return null;
    }

    @Override
    public int insert(Ct_user ctUser) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Ct_user> arr) {
        return 0;
    }

    @Override
    public int delete(Ct_user ctUser) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Ct_user> arr) {
        return 0;
    }

    @Override
    public int update(Ct_user ctUser) {
        return 0;
    }
}
