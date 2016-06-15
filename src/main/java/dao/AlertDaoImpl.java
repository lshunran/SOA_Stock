package dao;

import entity.Alert;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.Serializable;
import java.util.List;

/**
 * Created by ashun on 16/6/12.
 */
@Repository
@Transactional
public class AlertDaoImpl implements AlertDao {

    private EntityManager em;
    @PersistenceContext
    void setEntityManager(EntityManager entityManager) { this.em = entityManager; }


    public void add_Alert(String username, int limitup, int limitdown, int infomine, int bigdeal, int volume, int amount, String stockId) {
        Alert alert = new Alert();
        alert.setUsername(username);
        alert.setLimitup(limitup);
        alert.setLimitdown(limitdown);
        alert.setInfomine(infomine);
        alert.setBigdeal(bigdeal);
        alert.setVolume(volume);
        alert.setAmount(amount);
        alert.setStockid(stockId);
        em.persist(alert);
    }

    public List<Alert> get_AlertByUsername(String username) {
        Query query = em.createQuery("select a from Alert a where a.username like :name");
        query.setParameter("name",username);
        return query.getResultList();
    }
}
