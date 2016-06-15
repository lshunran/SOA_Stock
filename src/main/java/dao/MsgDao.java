package dao;

import entity.Msg;

import java.util.List;

/**
 * Created by ashun on 16/6/13.
 */
public interface MsgDao {
    List getMsg(String username);
}
