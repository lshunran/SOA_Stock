package dao;

import entity.User;

import java.util.List;

/**
 * Created by fordevelopment on 15/6/24.
 */
public interface UserDao {
    List<User> UserLogin(String username,String password);
    void UserRegister(String username,String password);
    User get_user(String userName);
}
