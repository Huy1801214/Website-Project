package dao.database;

import dao.db.DBConnect;
import model.OrderStatus;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class OrderStatusDAO implements DAOInterface<OrderStatus> {
    @Override
    public ArrayList<OrderStatus> selectAll() {
        return null;
    }

    @Override
    public OrderStatus selectById(int id) {
        return null;
    }

    @Override
    public int insert(OrderStatus orderStatus) {
        String query = "insert into order_status values(?,?,?,?)";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;

            preparedStatement.setInt(1, orderStatus.getId_status());
            preparedStatement.setInt(2, orderStatus.getId_order());
            preparedStatement.setString(3, orderStatus.getStatus());
            LocalDateTime localDateTime = orderStatus.getUpdate_at();
            if (localDateTime != null) {
                Timestamp timestamp = Timestamp.valueOf(localDateTime);
                preparedStatement.setTimestamp(4, timestamp);
            } else {
                preparedStatement.setTimestamp(4, null);
            }

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public int insertAll(ArrayList<OrderStatus> arr) {
        return 0;
    }

    @Override
    public int delete(OrderStatus orderStatus) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<OrderStatus> arr) {
        return 0;
    }

    @Override
    public int update(OrderStatus orderStatus) {
        return 0;
    }
}
