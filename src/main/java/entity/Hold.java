package entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by fordevelopment on 15/6/22.
 */
@Entity
@Table(name = "hold", schema = "", catalog = "stockdb")
public class Hold {
    private int id;
    private int gid;
    private String scode;
    private Timestamp buyDate;
    private int amount;
    private double cost;

    private Group groupByGid;
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
    @Column(name = "gid", nullable = false, insertable = true, updatable = true)
    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
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
    @Column(name = "buyDate", nullable = false, insertable = true, updatable = true)
    public Timestamp getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(Timestamp buyDate) {
        this.buyDate = buyDate;
    }

    @Basic
    @Column(name = "amount", nullable = false, insertable = true, updatable = true, precision = 0)
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }



    @Basic
    @Column(name = "cost", nullable = false, insertable = true, updatable = true, precision = 0)
    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Hold hold = (Hold) o;

        if (id != hold.id) return false;
        if (gid != hold.gid) return false;
        if (Double.compare(hold.amount, amount) != 0) return false;
        if (Double.compare(hold.cost, cost) != 0) return false;
        if (scode != null ? !scode.equals(hold.scode) : hold.scode != null) return false;
        if (buyDate != null ? !buyDate.equals(hold.buyDate) : hold.buyDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + gid;
        result = 31 * result + (scode != null ? scode.hashCode() : 0);
        result = 31 * result + (buyDate != null ? buyDate.hashCode() : 0);
        temp = Double.doubleToLongBits(amount);
        result = 31 * result + (int) (temp ^ (temp >>> 32));

        temp = Double.doubleToLongBits(cost);
        result = 31 * result + (int) (temp ^ (temp >>> 32));

        return result;
    }

    @ManyToOne
    @PrimaryKeyJoinColumn(name = "gid", referencedColumnName = "id")
    public Group getGroupByGid() {
        return groupByGid;
    }

    public void setGroupByGid(Group groupByGid) {
        this.groupByGid = groupByGid;
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
