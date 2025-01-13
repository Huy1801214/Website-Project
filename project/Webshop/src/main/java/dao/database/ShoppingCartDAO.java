package dao.database;

import dao.db.DBConnect;
import model.Products;
import model.ShoppingCart;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShoppingCartDAO implements DAOInterface<ShoppingCart> {
    @Override
    public ArrayList<ShoppingCart> selectAll() {
        return null;
    }

    @Override
    public ShoppingCart selectById(int id_user) {
        String query = "select * from shopping_cart where id_user = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, id_user);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                ShoppingCart shoppingCart = new ShoppingCart();
                shoppingCart.setId_user(id_user);
                shoppingCart.setId_cart(resultSet.getInt("id_cart"));
                shoppingCart.setDate(resultSet.getDate("created_at"));

                return shoppingCart;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return null;
    }

    @Override
    public int insert(ShoppingCart shoppingCart) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<ShoppingCart> arr) {
        return 0;
    }

    @Override
    public int delete(ShoppingCart shoppingCart) {
        String query = "delete from shopping_cart where id_cart = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, shoppingCart.getId_cart());

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
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
