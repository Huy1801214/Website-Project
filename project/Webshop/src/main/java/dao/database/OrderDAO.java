package dao.database;

import dao.db.DBConnect;
import model.Order;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class OrderDAO implements DAOInterface<Order> {
    @Override
    public ArrayList<Order> selectAll() {
        return null;
    }

    @Override
    public Order selectById(int id) {
        return null;
    }

    @Override
    public int insert(Order order) {
        int rs = 0;
        int id = 0;
        ResultSet resultSet = null;
        String query = "INSERT INTO `order` (id_user, id_cart, order_date, id_voucher, total_price, id_address, note, pay_method, status, id_product, quantity, price) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, order.getIdUser());
            preparedStatement.setInt(2, order.getIdCart());
            LocalDateTime localDateTime = order.getOrderDate();
            if (localDateTime != null) {
                Timestamp timestamp = Timestamp.valueOf(localDateTime);
                preparedStatement.setTimestamp(3, timestamp);
            } else {
                preparedStatement.setTimestamp(3, null);
            }

            Integer idVoucher = order.getIdVoucher();
            if(idVoucher != null) {
                preparedStatement.setInt(4, idVoucher);
            }else {
                preparedStatement.setNull(4, Types.INTEGER);
            }

            preparedStatement.setBigDecimal(5, order.getTotalPrice());
            preparedStatement.setInt(6, order.getIdAddress());
            preparedStatement.setString(7, order.getNote());
            preparedStatement.setByte(8, order.getPayMethod());
            preparedStatement.setString(9, order.getStatus());
            preparedStatement.setInt(10, order.getIdProduct());
            preparedStatement.setInt(11, order.getQuantity());
            preparedStatement.setBigDecimal(12, order.getPrice());


            rs = preparedStatement.executeUpdate();
            if (rs > 0) {
                resultSet = preparedStatement.getGeneratedKeys();
                if (resultSet.next()) {
                    id = resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return id;
    }

    @Override
    public int insertAll(ArrayList<Order> arr) {
        return 0;
    }

    @Override
    public int delete(Order order) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Order> arr) {
        return 0;
    }

    @Override
    public int update(Order order) {
        return 0;
    }
}
