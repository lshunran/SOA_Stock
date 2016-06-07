package service;

import dao.FocusDao;
import dao.UserDao;
import entity.Stock;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by fordevelopment on 15/6/24.
 */
@Transactional
@Service
public class UserService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private FocusDao focusDao;

    public List<User> UserLogin(String username,String password){
        return userDao.UserLogin(username,password);
    }

    public void UserRegister(String username,String password){
        userDao.UserRegister(username,password);
    }

    public User get_user(String userName)
    {
        return userDao.get_user(userName);
    }


    public List<Stock> get_all_focus(Integer uid)
    {
        return focusDao.get_all_focus(uid);
    }

    public void add_focus(Integer uid,String scode)
    {
        focusDao.add_focus(uid,scode);
    }

    public boolean is_focus(Integer uid,String scode)
    {
        return focusDao.is_focus(uid,scode);
    }

    public void remove_focus(Integer uid,String scode)
    {
        focusDao.remove_focus(uid,scode);
    }

}
