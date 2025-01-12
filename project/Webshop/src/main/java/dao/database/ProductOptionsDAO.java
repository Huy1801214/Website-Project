package dao.database;

import dao.db.DBConnect;
import model.ProductOptions;
import model.Products;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductOptionsDAO implements DAOInterface<ProductOptions> {
    @Override
    public ArrayList<ProductOptions> selectAll() {
        return null;
    }

    @Override
    public ProductOptions selectById(int id) {
        String query = "select * from product_options where id_product = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                ProductOptions po = new ProductOptions();
                po.setId_product(id);
                po.setSize(resultSet.getString("size"));
                po.setColor(resultSet.getString("color"));
                po.setQuantity(resultSet.getInt("quantity"));
                po.setMa_dinh_danh(resultSet.getString("ma_dinh_danh"));

                return po;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return null;
    }

    @Override
    public int insert(ProductOptions productOptions) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<ProductOptions> arr) {
        return 0;
    }

    @Override
    public int delete(ProductOptions productOptions) {
        String query = "delete from product_options where id_product = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, productOptions.getId_product());

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public int deleteAll(ArrayList<ProductOptions> arr) {
        return 0;
    }

    @Override
    public int update(ProductOptions productOptions) {
        return 0;
    }

    public List<ProductOptions> getOptionsById(int productId) {
        List<ProductOptions> list = new ArrayList<>();
        String query = "select * from product_options where id_product = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            preparedStatement.setInt(1, productId);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int product_op_id = resultSet.getInt("product_op_id");
                int id_product = resultSet.getInt("id_product");
                String size = resultSet.getString("size");
                String color = resultSet.getString("color");
                int quantity = resultSet.getInt("quantity");
                String ma_dinh_danh = resultSet.getString("ma_dinh_danh");

                list.add(new ProductOptions(product_op_id, id_product, size, color, quantity, ma_dinh_danh));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return list;
    }
}
