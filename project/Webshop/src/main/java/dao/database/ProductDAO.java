package dao.database;

import dao.db.DBConnect;
import model.Products;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO implements DAOInterface<Products>{
    @Override
    public ArrayList<Products> selectAll() {
        ArrayList<Products> products = new ArrayList<>();
        String query = "select * from product";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;
        try {
            assert preparedStatement != null;
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id_product = resultSet.getInt("id_product");
                String product_name = resultSet.getString("product_name");
                String img = resultSet.getString("img");
                String description = resultSet.getString("description");
                BigDecimal in_price = resultSet.getBigDecimal("in_price");
                BigDecimal out_price = resultSet.getBigDecimal("out_price");
                int quantity = resultSet.getInt("quantity");
                int selled_quantity = resultSet.getInt("selled_quantity");
                Date created_date =resultSet.getDate("created_date");
                int id_category = resultSet.getInt("id_category");


                products.add(new Products(id_product, product_name, img, description, in_price, out_price, quantity,
                        selled_quantity, created_date, id_category));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return products;
    }

    @Override
    public Products selectById(Products products) {
        return null;
    }

    @Override
    public int insert(Products products) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Products> arr) {
        return 0;
    }

    @Override
    public int delete(Products products) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Products> arr) {
        return 0;
    }

    @Override
    public int update(Products products) {
        return 0;
    }
}
