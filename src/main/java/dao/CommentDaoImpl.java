package dao;

import entity.Comment;
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
class CommentDaoImpl implements CommentDao {

    private EntityManager em;
    @PersistenceContext
    void setEntityManager(EntityManager entityManager) { this.em = entityManager; }


    public void add_comment(String stockCode,String comment,Integer id)
    {
        Comment comment1 = new Comment();
        comment1.setComment(comment);
        comment1.setScode(stockCode);
        comment1.setUid(id);
        comment1.setTime(new java.sql.Timestamp(new java.util.Date().getTime()));
        em.persist(comment1);
    }

    public List<Comment> get_all_comment(String stockCode) {
        Query query = em.createQuery("select c from Comment c where c.scode like :stockCode");
        query.setParameter("stockCode",stockCode);
        return query.getResultList();
    }
}
