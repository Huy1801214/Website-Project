package dao.database;

import dao.db.DBConnect;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO implements DAOInterface<User> {

    @Override
    public ArrayList<User> selectAll() {
        ArrayList<User> users = new ArrayList<>();
        String query = "select * from user";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;
        try {
            assert preparedStatement != null;
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id_user = resultSet.getInt("id_user");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                int id_role = resultSet.getInt("id_role");

                users.add(new User(id_user, username, password, id_role));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return users;
    }

    @Override
    public User selectById(User user) {
        return null;
    }

    @Override
    public int insert(User user) {
        int rs = 0;
        String query = "insert into user values(?,?,?,?)";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, user.getId_user());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            // id_role mặc định la 1
            preparedStatement.setInt(4, 1);

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public int insertAll(ArrayList<User> arr) {
        return 0;
    }

    @Override
    public int delete(User user) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<User> arr) {
        return 0;
    }

    @Override
    public int update(User user) {
        return 0;
    }

    public User getUserIfLogin(String email, String password) {
        String query = "select * from user where email=? and password=?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet;

        try {
            assert preparedStatement != null;
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                User user = new User();
                user.setId_user(resultSet.getInt("id_user"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setId_role(resultSet.getInt("id_role"));

                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return null;
    }

    public User selectByEmail(String email) {
        User user = null;
        String query = "select * from user where email=?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet;

        try {
            assert preparedStatement != null;
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("id_user");
                String password = resultSet.getString("password");
                int id_role = resultSet.getInt("id_role");

                user = new User(id, email, password, id_role);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return user;
    }

    // viet them ham update cho ct_user
    public void updatePassword(int idUser, String password) {
        String query = "update user set password=? where id_user=?";
    }
}
