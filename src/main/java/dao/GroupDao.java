package dao;

import entity.Group;

import java.util.List;

/**
 * Created by fordevelopment on 15/6/24.
 */
public interface GroupDao {

    void create_group(String name,int userId);

    List<Group> get_group_list(Integer userId);
}
