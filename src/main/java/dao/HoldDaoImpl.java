package dao;

import entity.Hold;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Date;

/**
 * Created by fordevelopment on 15/6/24.
 */
@Repository
public class HoldDaoImpl implements HoldDao {
    private EntityManager em;
    @PersistenceContext
    void setEntityManager(EntityManager entityManager) { this.em = entityManager; }
    public void add_hold(Integer groupId, String stockCode, int amount,double cost) {
        Hold hold = new Hold();
        hold.setGid(groupId);
        hold.setScode(stockCode);
        hold.setAmount(amount);
        hold.setBuyDate(new java.sql.Timestamp(new java.util.Date().getTime()));
        hold.setCost(cost);
        em.persist(hold);
    }


}
