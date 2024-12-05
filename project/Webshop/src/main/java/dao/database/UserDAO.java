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
            preparedStatement.setInt(1,user.getId_user());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getPassword());
            // id_role mặc định la 1
            preparedStatement.setInt(4, 1);

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
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
}
