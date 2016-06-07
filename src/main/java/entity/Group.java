package entity;

import org.codehaus.jackson.annotate.JsonBackReference;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;

/**
 * Created by fordevelopment on 15/6/22.
 */
@Entity
@Table(name = "group", schema = "", catalog = "stockdb")
public class Group {

    private int id;
    private String name;
    private Date establish;
    private int belong;
    private double cash;
    private User userById;
    private Collection<Hold> holdsById;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, insertable = true, updatable = true, length = 45)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "establish", nullable = false, insertable = true, updatable = true)
    public Date getEstablish() {
        return establish;
    }

    public void setEstablish(Date establish) {
        this.establish = establish;
    }

    @Basic
    @Column(name = "belong", nullable = false, insertable = true, updatable = true)
    public int getBelong() {
        return belong;
    }

    public void setBelong(int belong) {
        this.belong = belong;
    }

    @Basic
    @Column(name = "cash", nullable = false, insertable = true, updatable = true, precision = 0)
    public double getCash() {
        return cash;
    }

    public void setCash(double cash) {
        this.cash = cash;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Group group = (Group) o;

        if (id != group.id) return false;
        if (belong != group.belong) return false;
        if (Double.compare(group.cash, cash) != 0) return false;
        if (name != null ? !name.equals(group.name) : group.name != null) return false;
        if (establish != null ? !establish.equals(group.establish) : group.establish != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (establish != null ? establish.hashCode() : 0);
        result = 31 * result + belong;
        temp = Double.doubleToLongBits(cash);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    @ManyToOne
    @PrimaryKeyJoinColumn(name = "id", referencedColumnName = "id")
    public User getUserById() {
        return userById;
    }

    public void setUserById(User userById) {
        this.userById = userById;
    }


    @OneToMany(mappedBy = "groupByGid")
    public Collection<Hold> getHoldsById() {
        return holdsById;
    }

    public void setHoldsById(Collection<Hold> holdsById) {
        this.holdsById = holdsById;
    }
}
