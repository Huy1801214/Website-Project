package dao.database;

import dao.db.DBConnect;
import model.CartItem;
import model.ShoppingCart;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartItemDAO implements DAOInterface<CartItem> {
    @Override
    public ArrayList<CartItem> selectAll() {
        return null;
    }

    @Override
    public CartItem selectById(int id) {
        return null;
    }

    @Override
    public int insert(CartItem cartItem) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<CartItem> arr) {
        return 0;
    }

    @Override
    public int delete(CartItem cartItem) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<CartItem> arr) {
        return 0;
    }

    @Override
    public int update(CartItem cartItem) {
        return 0;
    }

    public List<CartItem> selectCartItemById(int idCart) {
        String query = "select * from cart_items where id_cart = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;
        List<CartItem> list = new ArrayList<>();

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, idCart);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id_item = resultSet.getInt("id_item");
                int id_product = resultSet.getInt("id_product");
                int product_op_id = resultSet.getInt("product_op_id");
                int quantity = resultSet.getInt("quantity");
                BigDecimal total_price = resultSet.getBigDecimal("total_price");

                list.add(new CartItem(id_item, idCart, id_product, product_op_id, quantity, total_price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return list;
    }
}
