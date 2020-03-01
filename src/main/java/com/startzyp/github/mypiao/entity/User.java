package com.startzyp.github.mypiao.entity;

public class User {
    private Integer uid;

    private String role;

    private String username;

    private String password;

    private String realname;

    private String email;

    private String phone;

    private String addr;


    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", role='" + role + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", realname='" + realname + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", addr='" + addr + '\'' +
                '}';
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public User(Integer uid, String role, String username, String password, String realname, String email, String phone, String addr) {
        this.uid = uid;
        this.role = role;
        this.username = username;
        this.password = password;
        this.realname = realname;
        this.email = email;
        this.phone = phone;
        this.addr = addr;
    }
}
