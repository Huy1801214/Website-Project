package dao.database;

import dao.db.DBConnect;
import model.ShoppingCart;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class ShoppingCartDAO implements DAOInterface<ShoppingCart> {

    private static final Logger logger = LoggerFactory.getLogger(ShoppingCartDAO.class);
    @Override
    public int insert(ShoppingCart shoppingCart) {
        String query = "insert into shopping_cart (id_cart, id_user, date) value(?, ?, ?)";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;

            preparedStatement.setInt(1, shoppingCart.getId_cart());
            preparedStatement.setInt(2, shoppingCart.getId_user());
            // Convert LocalDateTime to Timestamp and then to SQL Date
            LocalDateTime localDateTime = shoppingCart.getDate();
            if (localDateTime != null) {
                Timestamp timestamp = Timestamp.valueOf(localDateTime);
                preparedStatement.setTimestamp(3,timestamp);
            } else{
                preparedStatement.setTimestamp(3,null);
            }


            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.error("Lỗi khi thêm giỏ hàng", e);
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public ShoppingCart selectById(int id) {
        String query = "select * from shopping_cart where id_user = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                ShoppingCart shoppingCart = new ShoppingCart();
                shoppingCart.setId_cart(resultSet.getInt("id_cart"));
                shoppingCart.setId_user(resultSet.getInt("id_user"));

                // Convert SQL Date to LocalDateTime
                Timestamp timestamp = resultSet.getTimestamp("date");
                if (timestamp != null) {
                    LocalDateTime localDateTime = timestamp.toLocalDateTime();
                    shoppingCart.setDate(localDateTime);
                }
                return shoppingCart;
            }
        } catch (SQLException e) {
            logger.error("Lỗi khi chọn giỏ hàng theo id", e);
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return null;
    }

    @Override
    public ArrayList<ShoppingCart> selectAll() {
        return null;
    }

    @Override
    public int insertAll(ArrayList<ShoppingCart> arr) {
        return 0;
    }

    @Override
    public int delete(ShoppingCart shoppingCart) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<ShoppingCart> arr) {
        return 0;
    }

    @Override
    public int update(ShoppingCart shoppingCart) {
        return 0;
    }
}