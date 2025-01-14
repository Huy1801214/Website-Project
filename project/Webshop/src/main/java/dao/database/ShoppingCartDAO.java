package dao.database;

import dao.db.DBConnect;
import model.ShoppingCart;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class ShoppingCartDAO implements DAOInterface<ShoppingCart> {

    private static final Logger logger = LoggerFactory.getLogger(ShoppingCartDAO.class);

    @Override
    public int insert(ShoppingCart shoppingCart) {
        String query = "INSERT INTO shopping_cart (id_user, created_at, id_product, quantity) VALUES (?, ?, ?, ?)";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, shoppingCart.getIdUser());

            LocalDateTime localDateTime = shoppingCart.getCreatedAt();
            if (localDateTime != null) {
                Timestamp timestamp = Timestamp.valueOf(localDateTime);
                preparedStatement.setTimestamp(2, timestamp);
            } else {
                preparedStatement.setTimestamp(2, null);
            }


            Integer idProduct = shoppingCart.getIdProduct();
            if (idProduct != null) {
                preparedStatement.setInt(3, idProduct);
            } else {
                preparedStatement.setNull(3, Types.INTEGER);
            }
            Integer quantity = shoppingCart.getQuantity();
            if (quantity != null) {
                preparedStatement.setInt(4, quantity);
            } else {
                preparedStatement.setNull(4, Types.INTEGER);
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
        String query = "SELECT * FROM shopping_cart WHERE id_user = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                ShoppingCart shoppingCart = new ShoppingCart();
                shoppingCart.setIdCart(resultSet.getInt("id_cart"));
                shoppingCart.setIdUser(resultSet.getInt("id_user"));

                // Convert SQL Date to LocalDateTime
                Timestamp timestamp = resultSet.getTimestamp("created_at");
                if (timestamp != null) {
                    LocalDateTime localDateTime = timestamp.toLocalDateTime();
                    shoppingCart.setCreatedAt(localDateTime);
                }

                int idProduct = resultSet.getInt("id_product");
                if (!resultSet.wasNull()) {
                    shoppingCart.setIdProduct(idProduct);
                }
                int quantity = resultSet.getInt("quantity");
                if (!resultSet.wasNull()) {
                    shoppingCart.setQuantity(quantity);
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
        String query = "UPDATE shopping_cart SET id_product = ?, quantity = ? WHERE id_cart = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;

            preparedStatement.setInt(1, shoppingCart.getIdProduct());
            preparedStatement.setInt(2, shoppingCart.getQuantity());
            preparedStatement.setInt(3, shoppingCart.getIdCart());


            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.error("Lỗi khi cập nhật giỏ hàng", e);
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }
}