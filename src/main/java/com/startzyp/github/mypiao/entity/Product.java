package com.startzyp.github.mypiao.entity;

import java.sql.Timestamp;
import java.util.Date;

public class Product {
    private Integer pid;
    private String productname;
    private String introduction;
    private String addr;
    private String groupname;
    private Timestamp dates;
    private Integer num;
    private String types;
    private Double price;
    private String isDelete;


    public void setDates(Timestamp dates) {
        this.dates = dates;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", productname='" + productname + '\'' +
                ", introduction='" + introduction + '\'' +
                ", addr='" + addr + '\'' +
                ", groupname='" + groupname + '\'' +
                ", dates=" + dates +
                ", num=" + num +
                ", types='" + types + '\'' +
                ", price=" + price +
                ", isDelete='" + isDelete + '\'' +
                '}';
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
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

    public Date getDates() {
        return dates;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
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

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public Product(Integer pid, String productname, String addr, String isDelete, String types, String groupname, String introduction, Integer num, Timestamp dates, Double price) {
        this.pid = pid;
        this.productname = productname;
        this.introduction = introduction;
        this.addr = addr;
        this.groupname = groupname;
        this.dates = dates;
        this.num = num;
        this.types = types;
        this.price = price;
        this.isDelete = isDelete;
    }
}
