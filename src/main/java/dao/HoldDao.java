package dao;

/**
 * Created by fordevelopment on 15/6/24.
 */
public interface HoldDao {
    void add_hold(Integer groupId,String stockCode,int amount,double cost);
}
