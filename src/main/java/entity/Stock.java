package entity;

import org.codehaus.jackson.annotate.JsonBackReference;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by fordevelopment on 15/6/24.
 */
@Entity
@Table(name = "stock", schema = "", catalog = "stockdb")
public class Stock {
    private String code;
    private String name;
    private String industry;
    private String area;
    private Double pe;
    private Double outstanding;
    private Double totals;
    private Double totalAssets;
    private Double liquidAssets;
    private Double fixedAssets;
    private Double reserved;
    private Double reservedPerShare;
    private Double esp;
    private Double bvps;
    private Double pb;
    private Long timeToMarket;


    @Id
    @Column(name = "code", nullable = false, insertable = true, updatable = true, length = 6)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "name", nullable = true, insertable = true, updatable = true, length = 8)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "industry", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    @Basic
    @Column(name = "area", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    @Basic
    @Column(name = "pe", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getPe() {
        return pe;
    }

    public void setPe(Double pe) {
        this.pe = pe;
    }

    @Basic
    @Column(name = "outstanding", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getOutstanding() {
        return outstanding;
    }

    public void setOutstanding(Double outstanding) {
        this.outstanding = outstanding;
    }

    @Basic
    @Column(name = "totals", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getTotals() {
        return totals;
    }

    public void setTotals(Double totals) {
        this.totals = totals;
    }

    @Basic
    @Column(name = "totalAssets", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getTotalAssets() {
        return totalAssets;
    }

    public void setTotalAssets(Double totalAssets) {
        this.totalAssets = totalAssets;
    }

    @Basic
    @Column(name = "liquidAssets", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getLiquidAssets() {
        return liquidAssets;
    }

    public void setLiquidAssets(Double liquidAssets) {
        this.liquidAssets = liquidAssets;
    }

    @Basic
    @Column(name = "fixedAssets", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getFixedAssets() {
        return fixedAssets;
    }

    public void setFixedAssets(Double fixedAssets) {
        this.fixedAssets = fixedAssets;
    }

    @Basic
    @Column(name = "reserved", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getReserved() {
        return reserved;
    }

    public void setReserved(Double reserved) {
        this.reserved = reserved;
    }

    @Basic
    @Column(name = "reservedPerShare", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getReservedPerShare() {
        return reservedPerShare;
    }

    public void setReservedPerShare(Double reservedPerShare) {
        this.reservedPerShare = reservedPerShare;
    }

    @Basic
    @Column(name = "esp", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getEsp() {
        return esp;
    }

    public void setEsp(Double esp) {
        this.esp = esp;
    }

    @Basic
    @Column(name = "bvps", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getBvps() {
        return bvps;
    }

    public void setBvps(Double bvps) {
        this.bvps = bvps;
    }

    @Basic
    @Column(name = "pb", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getPb() {
        return pb;
    }

    public void setPb(Double pb) {
        this.pb = pb;
    }

    @Basic
    @Column(name = "timeToMarket", nullable = true, insertable = true, updatable = true)
    public Long getTimeToMarket() {
        return timeToMarket;
    }

    public void setTimeToMarket(Long timeToMarket) {
        this.timeToMarket = timeToMarket;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Stock that = (Stock) o;

        if (code != null ? !code.equals(that.code) : that.code != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (industry != null ? !industry.equals(that.industry) : that.industry != null) return false;
        if (area != null ? !area.equals(that.area) : that.area != null) return false;
        if (pe != null ? !pe.equals(that.pe) : that.pe != null) return false;
        if (outstanding != null ? !outstanding.equals(that.outstanding) : that.outstanding != null) return false;
        if (totals != null ? !totals.equals(that.totals) : that.totals != null) return false;
        if (totalAssets != null ? !totalAssets.equals(that.totalAssets) : that.totalAssets != null) return false;
        if (liquidAssets != null ? !liquidAssets.equals(that.liquidAssets) : that.liquidAssets != null) return false;
        if (fixedAssets != null ? !fixedAssets.equals(that.fixedAssets) : that.fixedAssets != null) return false;
        if (reserved != null ? !reserved.equals(that.reserved) : that.reserved != null) return false;
        if (reservedPerShare != null ? !reservedPerShare.equals(that.reservedPerShare) : that.reservedPerShare != null)
            return false;
        if (esp != null ? !esp.equals(that.esp) : that.esp != null) return false;
        if (bvps != null ? !bvps.equals(that.bvps) : that.bvps != null) return false;
        if (pb != null ? !pb.equals(that.pb) : that.pb != null) return false;
        if (timeToMarket != null ? !timeToMarket.equals(that.timeToMarket) : that.timeToMarket != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = code != null ? code.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (industry != null ? industry.hashCode() : 0);
        result = 31 * result + (area != null ? area.hashCode() : 0);
        result = 31 * result + (pe != null ? pe.hashCode() : 0);
        result = 31 * result + (outstanding != null ? outstanding.hashCode() : 0);
        result = 31 * result + (totals != null ? totals.hashCode() : 0);
        result = 31 * result + (totalAssets != null ? totalAssets.hashCode() : 0);
        result = 31 * result + (liquidAssets != null ? liquidAssets.hashCode() : 0);
        result = 31 * result + (fixedAssets != null ? fixedAssets.hashCode() : 0);
        result = 31 * result + (reserved != null ? reserved.hashCode() : 0);
        result = 31 * result + (reservedPerShare != null ? reservedPerShare.hashCode() : 0);
        result = 31 * result + (esp != null ? esp.hashCode() : 0);
        result = 31 * result + (bvps != null ? bvps.hashCode() : 0);
        result = 31 * result + (pb != null ? pb.hashCode() : 0);
        result = 31 * result + (timeToMarket != null ? timeToMarket.hashCode() : 0);
        return result;
    }

}
