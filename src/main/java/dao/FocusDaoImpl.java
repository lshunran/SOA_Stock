package dao;

import entity.Focus;
import entity.Stock;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by fordevelopment on 15/6/24.
 */
@Repository
public class FocusDaoImpl implements FocusDao {
    private EntityManager em;
    @PersistenceContext
    void setEntityManager(EntityManager entityManager) { this.em = entityManager; }

    public List<Stock> get_all_focus(Integer uid) {
        Query query = em.createQuery("select f.stockByScode from Focus f where f.uid =:userid ");
        query.setParameter("userid",uid);
        return query.getResultList();
    }

    public void add_focus(Integer uid, String scode) {
        Focus focus = new Focus();
        focus.setUid(uid);
        focus.setScode(scode);
        em.persist(focus);
    }

    public boolean is_focus(Integer uid, String scode) {
        Query query = em.createQuery("select f from Focus f where f.uid =:userid and f.scode =:scode");
        query.setParameter("userid",uid);
        query.setParameter("scode",scode);
        return !query.getResultList().isEmpty();
    }

    public void remove_focus(Integer uid, String scode) {
        Query query = em.createQuery("delete from Focus f where f.uid =:userid and f.scode =:scode");
        query.setParameter("userid",uid);
        query.setParameter("scode",scode);
        query.executeUpdate();
    }


}
