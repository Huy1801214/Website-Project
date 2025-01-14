package dao.database;

import dao.db.DBConnect;
import model.Products;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO implements DAOInterface<Products> {
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
                Date created_date = resultSet.getDate("created_date");
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

    public ArrayList<Products> searchProductsByName(String keyword) {
        ArrayList<Products> products = new ArrayList<>();
        String query = "select * from product where product_name like ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;
        try {
            preparedStatement.setString(1, "%" + keyword + "%");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Products product = new Products();
                product.setId_product(resultSet.getInt("id_product"));
                product.setProduct_name(resultSet.getString("product_name"));
                product.setImg(resultSet.getString("img"));
                product.setDescription(resultSet.getString("description"));
                product.setIn_price(resultSet.getBigDecimal("in_price"));
                product.setOut_price(resultSet.getBigDecimal("out_price"));
                product.setQuantity(resultSet.getInt("quantity"));
                product.setSelled_quantity(resultSet.getInt("selled_quantity"));
                product.setCreadted_date(resultSet.getDate("created_date"));
                product.setId_category(resultSet.getInt("id_category"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return products;
    }

    public ArrayList<Products> selectByIdCategory(int id_category) {
        ArrayList<Products> products = new ArrayList<>();
        String query = "select * from product where id_category = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, id_category);
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
                Date created_date = resultSet.getDate("created_date");

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
    public Products selectById(int id) {
        String query = "select * from product where id_product = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        ResultSet resultSet = null;

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Products products = new Products();
                products.setId_product(resultSet.getInt("id_product"));
                products.setProduct_name(resultSet.getString("product_name"));
                products.setImg(resultSet.getString("img"));
                products.setDescription(resultSet.getString("description"));
                products.setIn_price(resultSet.getBigDecimal("in_price"));
                products.setOut_price(resultSet.getBigDecimal("out_price"));
                products.setQuantity(resultSet.getInt("quantity"));
                products.setSelled_quantity(resultSet.getInt("selled_quantity"));
                products.setCreadted_date(resultSet.getDate("created_date"));
                products.setId_category(resultSet.getInt("id_category"));

                return products;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(resultSet, preparedStatement, DBConnect.getConnection());
        }
        return null;
    }

    @Override
    public int insert(Products products) {
        String query = "insert into product (product_name, img, description, in_price, out_price, quantity, " +
                "selled_quantity, created_date, id_category) values (?,?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;

            preparedStatement.setString(1, products.getProduct_name());
            preparedStatement.setString(2, products.getImg());
            preparedStatement.setString(3, products.getDescription());
            preparedStatement.setBigDecimal(4, products.getIn_price());
            preparedStatement.setBigDecimal(5, products.getOut_price());
            preparedStatement.setInt(6, products.getQuantity());
            preparedStatement.setInt(7, products.getSelled_quantity());
            preparedStatement.setDate(8, products.getCreadted_date());
            preparedStatement.setInt(9, products.getId_category());

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public int insertAll(ArrayList<Products> arr) {
        return 0;
    }

    @Override
    public int delete(Products products) {
        String query = "delete from product where id_product = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, products.getId_product());

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    @Override
    public int deleteAll(ArrayList<Products> arr) {
        return 0;
    }

    @Override
    public int update(Products products) {
        String query = "update product set product_name = ?, img = ?, description = ?, in_price = ?, out_price = ?, " +
                "quantity = ?, selled_quantity = ?, created_date = ?, id_category = ? where id_product = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;
            preparedStatement.setString(1, products.getProduct_name());
            preparedStatement.setString(2, products.getImg());
            preparedStatement.setString(3, products.getDescription());
            preparedStatement.setBigDecimal(4, products.getIn_price());
            preparedStatement.setBigDecimal(5, products.getOut_price());
            preparedStatement.setInt(6, products.getQuantity());
            preparedStatement.setInt(7, products.getSelled_quantity());
            preparedStatement.setDate(8, products.getCreadted_date());
            preparedStatement.setInt(9, products.getId_category());
            preparedStatement.setInt(10, products.getId_product());

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        Products p = dao.selectById(2);
        System.out.println(p.getProduct_name());
    }

    public int updateQuantity(int idProduct, int quantity) {
        String query = "update product set quantity = ? where id_product = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);
        int rs = 0;
        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, idProduct);

            rs = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
        return rs;
    }

    public void updateSelledQuantity(int id_product, int selledQuantity) {
        String query = "UPDATE product SET selled_quantity = ? WHERE id_product = ?";
        PreparedStatement preparedStatement = DBConnect.getPreparedStatement(query);

        try {
            assert preparedStatement != null;
            preparedStatement.setInt(1, selledQuantity);
            preparedStatement.setInt(2, id_product);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnect.close(null, preparedStatement, DBConnect.getConnection());
        }
    }
}
