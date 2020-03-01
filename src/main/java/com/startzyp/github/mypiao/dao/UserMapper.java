package com.startzyp.github.mypiao.dao;


import com.startzyp.github.mypiao.entity.User;

public interface UserMapper {
    //注册
    int insert(User record);

    //检查是否注册
    int checkUsername(String username);

    //登陆查询
    User login(User user);

    User getuser(String username);
    //更新用户
    int updateByPrimaryKeySelective(User record);
}
