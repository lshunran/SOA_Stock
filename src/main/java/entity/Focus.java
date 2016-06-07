package entity;

import javax.persistence.*;

/**
 * Created by fordevelopment on 15/6/22.
 */
@Entity
@Table(name = "focus", schema = "", catalog = "stockdb")
public class Focus {
    private int id;
    private Integer uid;
    private String scode;
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
    @Column(name = "uid", nullable = true, insertable = true, updatable = true)
    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "scode", nullable = true, insertable = true, updatable = true, length = 6)
    public String getScode() {
        return scode;
    }

    public void setScode(String scode) {
        this.scode = scode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Focus focus = (Focus) o;

        if (id != focus.id) return false;
        if (uid != null ? !uid.equals(focus.uid) : focus.uid != null) return false;
        if (scode != null ? !scode.equals(focus.scode) : focus.scode != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (uid != null ? uid.hashCode() : 0);
        result = 31 * result + (scode != null ? scode.hashCode() : 0);
        return result;
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
