package com.startzyp.github.mypiao.entity;

import java.sql.Timestamp;

public class Foder {
    private Integer fid;
    private String uid;
    private String productname;
    private String addr;
    private String groupname;
    private String types;
    private Double price;
    private Timestamp buydate;
    private String status;

    @Override
    public String toString() {
        return "Foder{" +
                "fid=" + fid +
                ", uid='" + uid + '\'' +
                ", productname='" + productname + '\'' +
                ", addr='" + addr + '\'' +
                ", groupname='" + groupname + '\'' +
                ", types='" + types + '\'' +
                ", price=" + price +
                ", buydate=" + buydate +
                ", status='" + status + '\'' +
                '}';
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Timestamp getBuydate() {
        return buydate;
    }

    public void setBuydate(Timestamp buydate) {
        this.buydate = buydate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Foder(Integer fid, String uid, String productname, String addr, String groupname, String types, Double price, Timestamp buydate, String status) {
        this.fid = fid;
        this.uid = uid;
        this.productname = productname;
        this.addr = addr;
        this.groupname = groupname;
        this.types = types;
        this.price = price;
        this.buydate = buydate;
        this.status = status;
    }




}
