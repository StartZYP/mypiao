package com.startzyp.github.mypiao.service.interfaces;


import com.startzyp.github.mypiao.entity.User;

public interface UserService {
    int regist(User user);

    int checkusername(String username);

    User login(String username, String password);

    //更新用户
    int updateByPrimaryKeySelective(User record);

    User getUser(String username);
}
