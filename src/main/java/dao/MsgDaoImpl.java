package dao;

import entity.Msg;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ashun on 16/6/13.
 */
@Repository
@Transactional
public class MsgDaoImpl implements MsgDao {

    private EntityManager em;
    @PersistenceContext
    void setEntityManager(EntityManager entityManager) { this.em = entityManager; }

    public List<Msg> getMsg(String username) {
        Query query = em.createQuery("select m from Msg m where m.username like :name order by m.id desc");
        query.setParameter("name",username);
        return query.getResultList();
    }
}
