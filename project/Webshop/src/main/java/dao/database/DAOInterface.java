package dao.database;

import java.util.ArrayList;

public interface DAOInterface<T> {
    ArrayList<T> selectAll();

    T selectById(int id);

    int insert(T t);

    int insertAll(ArrayList<T> arr);

    int delete(T t);

    int deleteAll(ArrayList<T> arr);

    int update(T t);
}
