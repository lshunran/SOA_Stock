package entity;

import org.codehaus.jackson.annotate.JsonManagedReference;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by fordevelopment on 15/6/22.
 */
@Entity
@Table(name = "comment", schema = "", catalog = "stockdb")
public class Comment {
    private int id;
    private String comment;
    private String scode;
    private int uid;
    private Timestamp time;
    private User userByUid;
    private Stock stockByScode;


    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "comment", nullable = false, insertable = true, updatable = true, length = 65535)
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Comment comment1 = (Comment) o;

        if (id != comment1.id) return false;
        if (comment != null ? !comment.equals(comment1.comment) : comment1.comment != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (comment != null ? comment.hashCode() : 0);
        return result;
    }

    @Basic
    @Column(name = "scode", nullable = false, insertable = true, updatable = true, length = 6)
    public String getScode() {
        return scode;
    }

    public void setScode(String scode) {
        this.scode = scode;
    }

    @Basic
    @Column(name = "uid", nullable = false, insertable = true, updatable = true)
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "time", nullable = false, insertable = true, updatable = true)
    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @ManyToOne
    @PrimaryKeyJoinColumn(name = "uid", referencedColumnName = "id")
    public User getUserByUid() {
        return userByUid;
    }

    public void setUserByUid(User userByUid) {
        this.userByUid = userByUid;
    }

    @ManyToOne
    @PrimaryKeyJoinColumn(name = "scode", referencedColumnName = "code")
    public Stock getStockByScode() {
        return stockByScode;
    }

    public void setStockByScode(Stock stockByScode) {
        this.stockByScode = stockByScode;
    }
}
