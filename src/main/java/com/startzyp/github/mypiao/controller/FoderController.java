package com.startzyp.github.mypiao.controller;

import com.google.gson.Gson;
import com.startzyp.github.mypiao.entity.Foder;
import com.startzyp.github.mypiao.service.interfaces.FoderService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/foder")
public class FoderController {
    @Autowired
    private FoderService foderService;


    @RequestMapping(value = "/mybuy",method = RequestMethod.GET)
    public String list() {

        return "mybuy";
    }

    @RequestMapping(value = "/update",method = RequestMethod.GET)
    public void update(@Param("fid") String fid) {
        foderService.Updata(Integer.parseInt(fid));
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public void list(HttpSession model,ServletResponse response) throws IOException {
        String uid = (String)model.getAttribute("username");
        List<Foder> listfoder = foderService.listfoder(uid);
        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(listfoder));
    }

    @RequestMapping(value = "/buy",method = RequestMethod.GET)
    public void buy(@Param("productname") String productname,@Param("uid") String uid,@Param("addr") String addr,@Param("groupname") String groupname,@Param("types") String types,@Param("price") String price,@Param("buydate") String buydate,@Param("status") String status){
        Foder foder = new Foder(null, uid, productname, addr, groupname, types, Double.parseDouble(price), Timestamp.valueOf(buydate), status);
        foderService.insert(foder);
    }



}
