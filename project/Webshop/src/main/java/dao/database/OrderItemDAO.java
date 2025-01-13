package dao.database;

import dao.db.DBConnect;
import model.OrderItem;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class OrderItemDAO implements DAOInterface<OrderItem> {
    @Override
    public ArrayList<OrderItem> selectAll() {
        return null;
    }

    @Override
    public OrderItem selectById(int id) {
        return null;
    }

    @Override
    public int insert(OrderItem orderItem) {
        int rs = 0;
        String query = "INSERT INTO `order_items` (id_order, id_product, quantity, price) VALUES (?, ?, ?, ?)";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, orderItem.getId_order());
            preparedStatement.setInt(2, orderItem.getId_product());
            preparedStatement.setInt(3, orderItem.getQuantity());
            preparedStatement.setBigDecimal(4, orderItem.getPrice());
            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public int insertAll(ArrayList<OrderItem> arr) {
        return 0;
    }

    @Override
    public int delete(OrderItem orderItem) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<OrderItem> arr) {
        return 0;
    }

    @Override
    public int update(OrderItem orderItem) {
        return 0;
    }
}
