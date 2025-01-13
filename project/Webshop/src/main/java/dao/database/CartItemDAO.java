package dao.database;

import dao.db.DBConnect;
import model.CartItem;
import model.Products;
import model.User;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartItemDAO implements DAOInterface<CartItem> {
    @Override
    public ArrayList<CartItem> selectAll() {
        return null;
    }

    @Override
    public CartItem selectById(int id) {
        String query = "select * from cart_items where id_item = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                CartItem cartItem = new CartItem();
                cartItem.setId_item(resultSet.getInt("id_item"));
                cartItem.setId_cart(resultSet.getInt("id_item"));
                cartItem.setId_product(resultSet.getInt("id_product"));
                cartItem.setProduct_op_id(resultSet.getInt("product_op_id"));
                cartItem.setQuantity(resultSet.getInt("quantity"));
                cartItem.setTotal_price(resultSet.getBigDecimal("total_price"));

                return cartItem;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return null;
    }

    public ArrayList<CartItem> getCartItemsByCartId(int id) {
        ArrayList<CartItem> cartItems = new ArrayList<>();
        String query = "select * from cart_items where id_item = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id_item = resultSet.getInt("id_item");
                int id_cart = resultSet.getInt("id_cart");
                int id_product = resultSet.getInt("id_product");
                int product_op_id = resultSet.getInt("product_op_id");
                int quantity = resultSet.getInt("quantity");
                BigDecimal total_price = resultSet.getBigDecimal("total_price");

                cartItems.add(new CartItem(id_item, id_cart, id_product, product_op_id, quantity, total_price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return cartItems;
    }

    @Override
    public int insert(CartItem cartItem) {
        String query = "insert into cart_items (id_item, id_cart, id_product, product_op_id, quantity, total_price) values(?,?,?,?,?,?)";
        int rs = 0;
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, cartItem.getId_item());
            preparedStatement.setInt(2, cartItem.getId_cart());
            preparedStatement.setInt(3, cartItem.getId_product());
            preparedStatement.setInt(4, cartItem.getProduct_op_id());
            preparedStatement.setInt(5, cartItem.getQuantity());
            preparedStatement.setBigDecimal(6, cartItem.getTotal_price());

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public int update(CartItem cartItem) {
        String query = "update cart_item set id_item = ?, id_cart = ?, id_product = ?, product_op_id = ?, quantity = ?," +
                " total_price = ? where id_cart = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, cartItem.getId_item());
            preparedStatement.setInt(2, cartItem.getId_cart());
            preparedStatement.setInt(3, cartItem.getId_product());
            preparedStatement.setInt(4, cartItem.getProduct_op_id());
            preparedStatement.setInt(5, cartItem.getQuantity());
            preparedStatement.setBigDecimal(6, cartItem.getTotal_price());

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public int delete(CartItem cartItem) {
        String query = "delete from cart_items where id_item = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, cartItem.getId_cart());

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    public int deleteCartItemById(int id){
        String query = "delete from cart_items where id_cart = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, id);

            rs = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public int insertAll(ArrayList<CartItem> arr) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<CartItem> arr) {
        return 0;
    }


}
