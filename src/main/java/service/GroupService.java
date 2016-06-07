package service;

import dao.GroupDao;
import entity.Group;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by fordevelopment on 15/6/24.
 */
@Transactional
@Service
public class GroupService {
    @Autowired
    private GroupDao groupDao;

    public void create_group(String name,int userId)
    {
        groupDao.create_group(name,userId);
    }

    public List<Group> get_group_list(Integer userId)
    {
        return groupDao.get_group_list(userId);
    }

}
