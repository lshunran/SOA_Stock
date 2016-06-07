package dao;

import entity.Stock;

import java.util.List;

/**
 * Created by fordevelopment on 15/6/24.
 */
public interface FocusDao {
    List<Stock> get_all_focus(Integer uid);
    void add_focus(Integer uid,String scode);
    boolean is_focus(Integer uid,String scode);
    void remove_focus(Integer uid,String scode);
}
