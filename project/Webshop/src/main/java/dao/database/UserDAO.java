package dao.database;

import dao.db.DBConnect;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO implements DAOInterface<User> {

    public static boolean isEmailExist(String email) {
        String query = "select 1 from users where email = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            assert preparedStatement != null;
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return false;
    }

    @Override
    public ArrayList<User> selectAll() {
        ArrayList<User> users = new ArrayList<>();
        String query = "select * from users";
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
                String surname = resultSet.getString("surname");
                String lastname = resultSet.getString("lastname");
                String email = resultSet.getString("email");
                String phone_num = resultSet.getString("phone_num");
                String address = resultSet.getString("address");
                String gender = resultSet.getString("gender");

                users.add(new User(id_user, id_role, surname, lastname, username, gender, phone_num, address, email, password));

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
        String query = "insert into users (id_role, surname, lastname, username, gender, phone_num, address, email, password) values(?,?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, user.getId_role());
            preparedStatement.setString(2, user.getSurname());
            preparedStatement.setString(3, user.getLastname());
            preparedStatement.setString(4, user.getUsername());
            preparedStatement.setString(5, user.getGender());
            preparedStatement.setString(6, user.getPhone_num());
            preparedStatement.setString(7, user.getAddress());
            preparedStatement.setString(8, user.getEmail());
            preparedStatement.setString(9, user.getPassword());


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
        String query = "select * from users where email=? and password=?";
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
                user.setId_role(resultSet.getInt("id_role"));
                user.setSurname(resultSet.getString("surname"));
                user.setLastname(resultSet.getString("lastname"));
                user.setUsername(resultSet.getString("username"));
                user.setGender(resultSet.getString("gender"));
                user.setPhone_num(resultSet.getString("phone_num"));
                user.setAddress(resultSet.getString("address"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));

                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return null;
    }

    public User selectByEmail(String email) {
        User user = new User();
        String query = "select * from users where email=?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet;

        try {
            assert preparedStatement != null;
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user.setId_user(resultSet.getInt("id_user"));
                user.setId_role(resultSet.getInt("id_role"));
                user.setSurname(resultSet.getString("surname"));
                user.setLastname(resultSet.getString("lastname"));
                user.setGender(resultSet.getString("gender"));
                user.setPhone_num(resultSet.getString("phone_num"));
                user.setAddress(resultSet.getString("address"));
                user.setPassword(resultSet.getString("password"));
                user.setUsername(resultSet.getString("username"));
                user.setEmail(email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        System.out.println(user.getId_user());
        return user;
    }

    // viet them ham update cho ct_user
    public boolean updatePassword(int userId, String password) throws SQLException {
        String query = "update users set password=? where id_user=?";
        try (PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query)) {
            preparedStatement.setString(1, password);
            preparedStatement.setInt(2, userId);
            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        }
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        User user = dao.selectByEmail("vyvy@gmail.com");
        System.out.println(user.getEmail());
    }
}
