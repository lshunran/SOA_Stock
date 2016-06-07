package dao;

import entity.Group;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.sql.Date;
import java.util.List;

/**
 * Created by fordevelopment on 15/6/24.
 */
@Repository
public class GroupDaoImpl implements GroupDao {
    private EntityManager em;
    @PersistenceContext
    void setEntityManager(EntityManager entityManager) { this.em = entityManager; }

    public void create_group(String name, int userId) {
        Group group = new Group();
        group.setName(name);
        group.setBelong(userId);
        group.setCash(200000);
        Date time= new java.sql.Date(new java.util.Date().getTime());
        group.setEstablish(time);
        em.persist(group);
    }

    public List<Group> get_group_list(Integer userId) {
        Query query = em.createQuery("select g from Group g where g.belong = :userId");
        query.setParameter("userId",userId);
        return query.getResultList();
    }
}
