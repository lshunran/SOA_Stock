package entity;

import javax.persistence.*;

/**
 * Created by fordevelopment on 15/6/22.
 */
@Entity
@Table(name = "follow", schema = "", catalog = "stockdb")
public class Follow {
    private int id;
    private int luid;
    private int ruid;
    private User userByLuid;
    private User userByRuid;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "luid", nullable = false, insertable = true, updatable = true)
    public int getLuid() {
        return luid;
    }

    public void setLuid(int luid) {
        this.luid = luid;
    }

    @Basic
    @Column(name = "ruid", nullable = false, insertable = true, updatable = true)
    public int getRuid() {
        return ruid;
    }

    public void setRuid(int ruid) {
        this.ruid = ruid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Follow follow = (Follow) o;

        if (id != follow.id) return false;
        if (luid != follow.luid) return false;
        if (ruid != follow.ruid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + luid;
        result = 31 * result + ruid;
        return result;
    }

    @ManyToOne
    @PrimaryKeyJoinColumn(name = "luid", referencedColumnName = "id")
    public User getUserByLuid() {
        return userByLuid;
    }

    public void setUserByLuid(User userByLuid) {
        this.userByLuid = userByLuid;
    }

    @ManyToOne
    @PrimaryKeyJoinColumn(name = "ruid", referencedColumnName = "id")
    public User getUserByRuid() {
        return userByRuid;
    }

    public void setUserByRuid(User userByRuid) {
        this.userByRuid = userByRuid;
    }
}
