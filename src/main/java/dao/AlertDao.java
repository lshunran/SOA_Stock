package dao;

import entity.Alert;

import java.util.List;

/**
 * Created by ashun on 16/6/12.
 */
public interface AlertDao {
    void add_Alert(String username, int limitup, int limitdown, int infomine, int bigdeal, int volume, int amount, String stockId);
    List get_AlertByUsername(String username);
}
