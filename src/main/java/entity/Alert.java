package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by ashun on 16/6/12.
 */
@Entity
public class Alert {
    private int id;
    private String username;
    private Integer limitup;
    private Integer limitdown;
    private Integer infomine;
    private Integer bigdeal;
    private Integer volume;
    private Integer amount;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "limitup")
    public Integer getLimitup() {
        return limitup;
    }

    public void setLimitup(Integer limitup) {
        this.limitup = limitup;
    }

    @Basic
    @Column(name = "limitdown")
    public Integer getLimitdown() {
        return limitdown;
    }

    public void setLimitdown(Integer limitdown) {
        this.limitdown = limitdown;
    }

    @Basic
    @Column(name = "infomine")
    public Integer getInfomine() {
        return infomine;
    }

    public void setInfomine(Integer infomine) {
        this.infomine = infomine;
    }

    @Basic
    @Column(name = "bigdeal")
    public Integer getBigdeal() {
        return bigdeal;
    }

    public void setBigdeal(Integer bigdeal) {
        this.bigdeal = bigdeal;
    }

    @Basic
    @Column(name = "volume")
    public Integer getVolume() {
        return volume;
    }

    public void setVolume(Integer volume) {
        this.volume = volume;
    }

    @Basic
    @Column(name = "amount")
    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Alert alert = (Alert) o;

        if (id != alert.id) return false;
        if (username != null ? !username.equals(alert.username) : alert.username != null) return false;
        if (limitup != null ? !limitup.equals(alert.limitup) : alert.limitup != null) return false;
        if (limitdown != null ? !limitdown.equals(alert.limitdown) : alert.limitdown != null) return false;
        if (infomine != null ? !infomine.equals(alert.infomine) : alert.infomine != null) return false;
        if (bigdeal != null ? !bigdeal.equals(alert.bigdeal) : alert.bigdeal != null) return false;
        if (volume != null ? !volume.equals(alert.volume) : alert.volume != null) return false;
        if (amount != null ? !amount.equals(alert.amount) : alert.amount != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (limitup != null ? limitup.hashCode() : 0);
        result = 31 * result + (limitdown != null ? limitdown.hashCode() : 0);
        result = 31 * result + (infomine != null ? infomine.hashCode() : 0);
        result = 31 * result + (bigdeal != null ? bigdeal.hashCode() : 0);
        result = 31 * result + (volume != null ? volume.hashCode() : 0);
        result = 31 * result + (amount != null ? amount.hashCode() : 0);
        return result;
    }
}
