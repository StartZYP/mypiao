package com.startzyp.github.mypiao.controller;



import com.startzyp.github.mypiao.entity.User;
import com.startzyp.github.mypiao.service.interfaces.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping(value = "/loginpage", method = RequestMethod.GET)
    public String loginpage(){
        return "login";
    }

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public String info(HttpSession session){
        session.removeAttribute("info");
        String username =(String)session.getAttribute("username");
        User user = userService.getUser(username);
        session.setAttribute("info",user);
        return "myinfo";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@Param("username") String username,@Param("password") String password, HttpSession session) {
        try {
            session.removeAttribute("msg");
            User exituser = userService.login(username, password);
            session.setAttribute("username", exituser.getUsername());
            return "index";
        } catch (Exception e) {
            session.setAttribute("msg", "用户或密码错误");
        }
        return "login";
    }


    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@Param("pname") String pname,@Param("phone") String phone,@Param("email") String email,@Param("addr") String addr, HttpSession session) {
        String username =(String)session.getAttribute("username");
        User user = new User(null, null, username, null, pname, email, phone, addr);
        userService.updateByPrimaryKeySelective(user);
        return "myinfo";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Param("username") String username,@Param("password") String password, HttpSession request) {
        try {
            int checkusername = userService.checkusername(username);
            if (checkusername >= 1) {
                request.setAttribute("msg", "此用户名已注册");
            } else {
                User user = new User(null, "1", username, password, null, null, null, null);
                user.setRole("1");
                userService.regist(user);
                request.setAttribute("msg", "注册成功");
            }
        } catch (Exception e) {
            request.setAttribute("msg", "此用户名已注册");
        }
        return "login";
    }


    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("username");
        return "forward:/user/loginpage";
    }
}
