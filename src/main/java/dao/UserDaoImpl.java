package dao;

import entity.User;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Li on 2015/6/22.
 */
@Repository
public class UserDaoImpl implements UserDao {

    private EntityManager em;
    @PersistenceContext
    void setEntityManager(EntityManager entityManager) { this.em = entityManager; }



    public List<User> UserLogin(String username,String password){
        Query query = em.createQuery("select u from User u where u.name =:username and u.password =:password");
        query.setParameter("username",username);
        query.setParameter("password",password);
        List<User> rs = query.getResultList();
        for(int i =0;i<rs.size();i++)
            System.out.print("1"+rs.get(i).getName());
        if(rs!=null) return rs;
        else return null;
    }

    public  void UserRegister(String username,String password){
        User adduser =new User();
        adduser.setName(username);
        adduser.setPassword(password);
        em.persist(adduser);
    }

    public User get_user(String userName) {
        Query query = em.createQuery("select u from User u where u.name =:username");
        query.setParameter("username",userName);
        return (User)query.getSingleResult();
    }
}
