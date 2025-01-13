package dao.database;

import dao.db.DBConnect;
import model.ProductOptions;
import model.Products;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductOptionDAO implements DAOInterface<ProductOptions>{

    @Override
    public ArrayList<ProductOptions> selectAll() {
        return null;
    }

    @Override
    public ProductOptions selectById(int id) {
        String query = "select * from product_options where product_op_id = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                ProductOptions productOption = new ProductOptions();
                productOption.setProduct_op_id(resultSet.getInt("product_op_id"));
                productOption.setId_product(resultSet.getInt("id_product"));
                productOption.setSize(resultSet.getString("size"));
                productOption.setColor(resultSet.getString("color"));
                productOption.setQuantity(resultSet.getInt("quantity"));
                productOption.setMa_dinh_danh(resultSet.getString("ma_dinh_danh"));

                return productOption;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return null;
    }

    @Override
    public int update(ProductOptions productOptions) {
        String query = "update product_options set product_op_id = ?, id_product = ?, size = ?, color = ?, quantity = ?, ma_dinh_danh = ? where product_op_id = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, productOptions.getProduct_op_id());
            preparedStatement.setInt(2, productOptions.getId_product());
            preparedStatement.setString(3, productOptions.getSize());
            preparedStatement.setString(4, productOptions.getColor());
            preparedStatement.setInt(5, productOptions.getQuantity());
            preparedStatement.setString(6, productOptions.getMa_dinh_danh());

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
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
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<ProductOptions> arr) {
        return 0;
    }



}
