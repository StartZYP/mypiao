package com.startzyp.github.mypiao.service.impl;


import com.startzyp.github.mypiao.dao.UserMapper;
import com.startzyp.github.mypiao.entity.User;
import com.startzyp.github.mypiao.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public int regist(User user) {
        return	userMapper.insert(user);
    }

    @Override
    public int checkusername(String username) {

        return userMapper.checkUsername(username);
    }


    @Override
    public User login(String username, String password) {

        User user1 = new User(null, null, username, password, null, null, null, null);
        User user = userMapper.login(user1);
        if( user == null){
            throw new RuntimeException("用户名或密码不正确");
        }
        return user;
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {
        return userMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public User getUser(String username) {
        return userMapper.getuser(username);
    }

}
